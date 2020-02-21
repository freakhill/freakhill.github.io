+++
title = "Fexpr the ultimate lambda code rewrite!"
description = "my own definition"
date = 2019-03-17
weight = 40
draft = false
in_search_index = true
+++

[This article](http://www.dalnefre.com/wp/2011/11/fexpr-the-ultimate-lambda/) introduces an ancestral
Lisp construction called ["Fexpr"](https://en.wikipedia.org/wiki/Fexpr) under the prism of the
[Vau calculus](http://lisp.esthlos.com/papers/jshutt.pdf) and actors.

I rewrote its code in clojure for (self)educational purpose, and added comments here and there
to make it more understandable for the common folk (mainly myself). Only libs used are core.async
and core.match! I also added a dumb parser and some logging facilities to help understanding.

I find the subject quite interesting and I hope my small contribution will be of interest to somebody!

[Here is the source!](https://github.com/freakhill/fexpr-test/blob/master/src/fexpr_test/core.clj)

It's not pretty but it's not obfuscated (i think...). You can browse through the code in parallel of
reading the [original article](https://github.com/freakhill/fexpr-test/blob/master/src/fexpr_test/core.clj)!