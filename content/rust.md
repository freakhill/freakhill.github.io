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

```

exec:

```rust
```

Base idea is to use boxed closures as 
