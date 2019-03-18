+++
title = "Rust stuff!"
description = "Interesting clojure stuff that I explored and I have yet to explore"
date = 2019-03-17
weight = 96
draft = false
in_search_index = true
[taxonomies]
#tags = [ "rust" ]
[extra]
+++

[Rust container cheat sheet](https://docs.google.com/presentation/d/1q-c7UAyrUlM-eZyTo1pd8SZ0qwA_wYxmPZVOQkoDmH4/edit#slide=id.p)

### Microprofile

[reddit thread](https://www.reddit.com/r/rust/comments/b1iwnc/microprofile_for_rust/)

Profiling for rust games! With a chrome interface and all. seems pretty neat!

### Building fast interpreters in Rust

[slideshare](https://www.slideshare.net/RReverser/building-fast-interpreters-in-rust)

raw AST interpretation slower than bytecode slower than JIT/codegen aaaand codegen has a huge constant factor but ends up beating JIT past some point.

#### Raw interpretation

```rust
match e {
  Expr::Literal(lit) => *lit,
  Expr::Variable(var) => var.calc(context),
  Expr::Binary { lhs, op, rhs } => {
    let lhs = lhs.calc(context);
    let rhs = rhs.calc(context);
    op.apply(lhs, rhs)
  }
}
```

#### Bytecode

compile:
```rust
match e {
  Expr::Literal(lit) => bytecode.push(BytecodeOp::Literal(*lit)),
  Expr::Variable(v) => bytecode.push(BytecodeOp::Variable(*v)),
  Expr::Binary { lhs, op, rhs } => {
    lhs.compile(bytecode);
    rhs.compile(bytecode);
    bytecode.push(BytecodeOp::BinOp(*op));
  }
}
```

exec:
```rust
for op in &self.ops {
  match op {
    BytecodeOp::Literal(lit) => stack.push(*lit),
    BytecodeOp::Variable(var) => stack.push(var.calc(context)),
    BytecodeOp::BinOp(op) => {
      let rhs = stack.pop().unwrap();
      let lhs = stack.pop().unwrap();
      stack.push(op.apply(lhs, rhs));
    }
  }
}
```

#### Boxed closures (much better perf than ast/bytecode)

(target is f64 because the example is a calculator...)

```rust
pub type CompiledExpr = Box<dyn Fn(&Context) -> f64>
```

```rust
match e {
  Expr::Literal(lit) => Box::new(move |_ctx| lit),
  Expr::Variable(var) => match var {
    Variable::X => Box::new(move |ctx| ctx.x),
    ...
  },
  Expr::Binary { lhs, op, rhs } => {
    let lhs = lhs.compile();
    let rhs = rhs.compile();
    match op {
      BinOp::Add => Box::new(move |ctx| lhs(ctx) + rhs(ctx)),
      ...
    }
  }
}
```

Then call the resulting closure.

Why is it faster???

Bytecode goes:
- fetch op
- pop stack pop stack
- match BinaryOp, op.apply (vtable) on 2 params
- stack push

Boxed closures go:
- indirect call into indirect call (no vtable)

no data stack, just the c stack

matters that much?

think about it later on...

#### LLVM from Rust

```rust
let context = Context::create();
let f64type = context.f64_type();
let builder = context.create_builder();

let module = context.create_module("module");
let func = module.add_function("jit_compiled",
    f64type.fn_type(&[f64type.into(), f64type.into()], false),
    None,);
    
let block = func.append_basic_block("entry");
builder.position_at_end(&block);

let result = ...;

builder.build_return(Some(&result));

match e {
  Expr::Literal(lit) => f64type.const_float(*lit),
  Expr::Variable(var) => func.get_nth_param(...).into_float_value(),
  Expr::Binary { lhs, op, rhs } => {
    let lhs = lhs.compile(...);
    let rhs = rhs.compile(...);
    match op {
      BinOp::Add => builder.build_float_add(lhs, rhs, "add"),
      ...
    }
  }
}

let engine = module.create_jit_execution_engine(OptimizationLevel::None)?;
unsafe { engine.get_function("jit_compiled")? }
```

#### Cranelift

```rust
let builder = SimpleJITBuilder::new();
let mut module: Module<SimpleJITBackend> = Module::new(builder);
let mut ctx = module.make_context();
let mut func_builder_ctx = FunctionBuilderContext::new();

let sig = &mut ctx.func.signature;
sid.params.push(AbiParam::new(types::F64)); // X
sig.params.push(AbiParam::new(types::F64)); // Y
sig.returns.push(AbiParam::new(types::F64));

let mut builder = FunctionBuilder::new(
  &mut ctx.func, &mut func_builder_ctx);

// ebb = Extended Basic Block
// In compiler construction, a basic block is a straight-line code sequence with no branches in except to the entry and no branches out except at the exit.
// An extended basic block is a maximal collection of basic blocks where:
// - only the first basic block can have multiple predecessor basic blocks;
// - all the other basic blocks have one single predecessor basic block, which must be within the collection of basic blocks.
let entry_ebb = builder.create_ebb();
builder.append_ebb_params_for_function_params(entry_ebb);
builder.switch_to_block(entry_ebb);
builder.seal_block(entry_ebb);

let result = ...;

// ins => instructions
builder.ins().return_(&[result]);
builder.finalize();

match e {
  Expr::Literal(lit) => {
    let ins = builder.ins();
    ins.f64const(Ieee64::with_float(*lit))
  },
  Expr::Variable(var) => builder.ebb_params(ebb)[ ... ],
  Expr::Binary { lhs, op, rhs } => {
    let lhs = lhs.compile( ... );
    let rhs = rhs.compile( ... );
    let ins = builder.ins();
    match op {
      BinOp::Add => ins.fadd(lhs, rhs),
      ...
    }
  }
}

let id = module.declare_function("jit_compiled",
    Linkage::Local,
    &ctx.func.signature);
module.define_function(id, &mut ctx)?;
module.clear_context(&mut ctx);
module.finalize_definitions();
Ok(unsafe { ::std::mem::transmute(module.get_finalized_function(id)) })
// type FinalizedFunction = *const u8 -> code and data in memory
// type FinalizedData = (*mut u8, usize) -> complete output artifact for a data object
```

### Spongedown - markdown to html with asciiart to svg support

[Github repo](https://github.com/ivanceras/spongedown)

### Flamer - flame graphs for rust

[Github repo](https://github.com/llogiq/flamer)
