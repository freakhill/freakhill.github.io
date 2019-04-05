+++
title = "My study of type theory"
description = "because these people like to make things confusing when there is absolutely no need to"
date = 2019-03-17
weight = 81
draft = false
in_search_index = true
[taxonomies]
#tags = [ "clojure" ]
[extra]
+++

Type theory people like to make things horribly confusing when there is absolutely no need to. Evil, evil people.

How will we do that, layman explanations, pascal notation, color coding if possible! When things get dense, always add a legend!

This will be a work in progress for a long long time.

This will contain a bunch of stuff I will study, it's not a book, it's not a tutorial, at best it's a bunch of notes written in order to understand a bunch of stuff through the type theory domain, in a very sparse non exhaustive manner.

Why do I study all that gunk? I want to make a programming language with a powerful type system that stays out of the way as hard as technically possible, some kind of gradual dependent typing where I can just assert stuff and the language can add runtime checks as it sees fits, and it tells me where so I'm aware of the costs. C++ has the idea of "you pay the price for a feature only when you need it", I want to make it so that "you have to endure the typing pain only when you need some specific gain", by default the language should feel 100% like a dynamic language, runtime errors and all.

Trying mathjax...

{{ load-mathjax }}

With tag

{% math %} 
When $a \ne 0$, there are two solutions to \(ax^2 + bx + c = 0\) and they are
$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$
{% end %}


Raw

When $a \ne 0$, there are two solutions to \(ax^2 + bx + c = 0\) and they are
$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$

# What is a type

...

# How to read prooves

...

# What's a type system, what's type safety, what's soundness, totality, can it model a web server!??

...

# Curry Howard isomorphism

...

# The lambda cube

...

# Propositional logic

...

# First order logic

...

# Second order logic

...

# Naive set theory

...

# ZFC (& Russel logic) & First order logic

...

# Lambda calculus

...

# Simply typed lambda calculus

...

# System T

...

# System F

...

# System F<

...

# Normalization

...

# Sequent calculus

...

# Strong normalization

...

# Type of type & Girard's paradox, parallel to Russel's paradox

...

# Beta-conversion and Eta-conversion

...

# Polymorphism

...

# Dependent types

...

## Lambda Pi, First order dependent type theory

...

## Lambda Pi2

...

## Lambda Pi omega

...

## Calculus of constructions

...

## Calculus of inducive constructions

...

## Intuitionistic theory (Martin Lof)

...

## LF

...

## Linear logic (where to put that???)

...

## Modal logic

...

## Hoare logic

...

## Separation logic

...

## Subtyping, records, row types, modules, Coq Canonical structures etc.

... Lots of stuff to cover ...

## Paper i'm reading: "Complete and Easy Bidirectional Typechecking for Higher-Rank Polymorphism" Joshua Dunfield, Neelakantan Krishnaswami

...
