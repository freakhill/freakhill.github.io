+++
title = "I'm building a Lisp on the side"
description = "random assortment of notes"
date = 2019-03-17
weight = 99
draft = false
# slug = ""
in_search_index = true
# The taxonomies for that page. The keys need to be the same as the taxonomies
# name configured in `config.toml` and the values an array of String like
# tags = ["rust", "web"]
[taxonomies]

[extra]
+++

I want to make a lisp to develop games on PC and consoles.

Use F-Expr and pervasive full program optimization, partial interpreter & LLVM code generation.

First order locality, packing, static & dynamic environments.

No GC, support for rust Pin/Unpin (build up support of gc as a library)

Concepts:
- Locality
- Packing = Tilling * Alignment * Size of each field
- Modules
- Each symbol has an API and a version, and a locality
- do not export libraries/packages, but functions and static bundles each with api/version/and dependencies

Think about:
- How to do polymorphism?? in our multi-stage compiling system

We want flow typing
We want to be able to bind to C libraries fast, so we can call LLVM/Z3 from inside
our language.

// There are no macros in jojolist, only applicative and operatives
// [1 2 3] ≡ (array 1 2 3)
// "abc" ≡ (packing --stuff--for-unicode-packing-- (array 65 66 67??))
// {.offset_member 1 @ptr_member 12 >"dict member" 77} ≡ (packing ~~~ (record ...))
// tilling [0 (n [1]) (n [2]) (n [3 4 5]) 6 7 (m [8])]
// align ...
// sizes ...
// packing tilling x align x size

### Stuff to check out

- [Spiral language](https://github.com/mrakgr/The-Spiral-Language)
- [Vau]()
- [ATS]()
- [Learn ADA/Spark]()
- look for the source for rust's lifetime checker
- [implementing functional languages](https://www.microsoft.com/en-us/research/wp-content/uploads/1992/01/student.pdf)
- [spineless tagless machine](https://www.microsoft.com/en-us/research/wp-content/uploads/1992/04/spineless-tagless-gmachine.pdf)
- [functional programming and parallel graph rewriting](https://wiki.clean.cs.ru.nl/Functional_Programming_and_Parallel_Graph_Rewriting)

