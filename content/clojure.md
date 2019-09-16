+++
title = "Clojure stuff!"
description = "Interesting clojure stuff that I explored and I have yet to explore"
date = 2019-03-17
weight = 60
draft = false
in_search_index = true
[taxonomies]
#tags = [ "clojure" ]
[extra]
+++

[How to build a graalvm binary](https://github.com/BrunoBonacci/graalvm-clojure/blob/master/doc/clojure-graalvm-native-binary.md)

### Nippy

[github repo](https://github.com/ptaoussanis/nippy)

High-performance serialization library for Clojure

### asynctor

[github repo](https://github.com/ertugrulcetin/asynctor)

Minimal core.async inspector library for Clojure(Script)

### methodical

[github repo](https://github.com/camsaul/methodical)

CL multimethods in Clojure. apparently more performant than default clojure ones, why??

### JIT Watch

[github repo](https://github.com/AdoptOpenJDK/jitwatch)

Nice insight in the behaviour of the Hotspot JIT!

Need to try this out to see how it works with clojure.

### Netflix concurrency limits

[github repo](https://github.com/Netflix/concurrency-limits)

This is actually a Java library. Use classic TCP congestion libraries to manage a service (accept/reject requests).

### Resilience4clj

[github repo](https://github.com/luchiniatwork/resilience4clj-circuitbreaker)

circuit breakers etc. for clojure (from resilience4j lib)

### Meander

[github repo](https://github.com/noprompt/meander)

Like Specter but with logic operators (more declarative).

Declarative data transformation.

### Pathom

[github repo](https://github.com/wilkerlucio/pathom)

Parses EQL queries.

### Primitive maths

[github repo](https://github.com/ztellman/primitive-math)

Avoid hidden reflection when doing basic math in Clojure.

### Xforms - extra transducers

[github repo](https://github.com/cgrand/xforms)

### Soy-clj - clojure wrapper for google close template library

Consider forking to do an updated version

[github repo](https://github.com/codahale/soy-clj)

### Hara - set of libraries to explore more in detail

[github repo](https://github.com/zcaudate/hara)

### bifurcan - high performance data structure

[github repo](https://github.com/lacuna/bifurcan)

Description from the website:

This library provides high-quality Java implementations of mutable and immutable data structures, each sharing a common API and these design principles:
- efficient random access
- efficient splitting and merging of collections
- customizable equality semantics
- contiguous memory used wherever possible
- performance equivalent to, or better than, existing alternatives

Rather than using the existing collection interfaces in java.util such as List or Map, it provides its own interfaces (IList, IMap, ISet) that provide functional semantics - each update to a collection returns a reference to a new collection. Each interface provides a method (toList, toMap, toSet) for coercing the collection to a read-only version of the standard Java interfaces.

### IgushArray java port

[github repo](https://github.com/StoneT2000/IgushArray-Java)

An implementation of the IgushArray in Java, with O(1) access and O(N^1/2) insertion and removal

(ArrayList interface, constant get time (slower constant than real array, probably amortized)
and square(n) time insertion/removal, much much much faster than with a real array).

## Stuff i made

- [fexpr the ultimate lambda rewrite](./handmade/fexpr-the-ultimate-lambda.md)
