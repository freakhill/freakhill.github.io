+++
title = "My study of type theory"
description = "because these people like to make things confusing when there is absolutely no need to"
date = 2019-03-17
weight = 70
draft = false
in_search_index = true
[taxonomies]
#tags = [ "clojure" ]
[extra]
+++

{{ mathjax() }}

Type theory people like to make things horribly confusing when there is absolutely no need to. Evil, evil people.

How will we do that, layman explanations, pascal notation, color coding if possible! When things get dense, always add a legend!

This will be a work in progress for a long long time.

This will contain a bunch of stuff I will study, it's not a book, it's not a tutorial, at best it's a bunch of notes written in order to understand a bunch of stuff through the type theory domain, in a very sparse non exhaustive manner.

Why do I study all that gunk? I want to make a programming language with a powerful type system that stays out of the way as hard as technically possible, some kind of gradual dependent typing where I can just assert stuff and the language can add runtime checks as it sees fits, and it tells me where so I'm aware of the costs. C++ has the idea of "you pay the price for a feature only when you need it", I want to make it so that "you have to endure the typing pain only when you need some specific gain", by default the language should feel 100% like a dynamic language, runtime errors and all.

Trying mathjax...

## Testing latex

https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference

find unicode for symbol http://detexify.kirelabs.org/classify.html

When $a \ne 0$, there are two solutions to \(ax^2 + bx + c = 0\) and they are
$$x = {-b \pm \sqrt{\enclose{circle,box}{b^2}-\color{red}{4ac}} \over 2a}.$$

$$
  \newcommand\C{{\mathbb C}}
  \newcommand\np[2]{{#1}#2{#1}}
  \C[y_1,\ldots,y_n]\to {\mathcal A}, \quad a\mapsto\np{:}{a}
$$

$$\unicode[.55,0.05][Geramond]{x22D6}$$

\[ \exp x = 1 + x + x^2/2 + x^3/6 + \cdots \]<br />
\[<br />
   \exp x = 1 + x + x^2/2 + x^3/6 + \cdots<br />
\]

need to work out how to unescape thing with zola to make following work

{% raw %}
$\require{AMScd}$
\begin{CD}
    A @>a>> B\\
    @V b V V= @VV c V\\
    C @>>d> D
\end{CD}

$$
    \begin{matrix}
    1 & x & x^2 \\
    1 & y & y^2 \\
    1 & z & z^2 \\
    \end{matrix}
$$

$$ \left[
\begin{array}{cc|c}
  1&2&3\\
  4&5&6
\end{array}
\right] $$

$$
  \begin{pmatrix}
    a & b\\
    c & d\\
  \hline
    1 & 0\\
    0 & 1
  \end{pmatrix}
$$

$$\begin{align}
\sqrt{37} & = \sqrt{\frac{73^2-1}{12^2}} \\
 & = \sqrt{\frac{73^2}{12^2}\cdot\frac{73^2-1}{73^2}} \\ 
 & = \sqrt{\frac{73^2}{12^2}}\sqrt{\frac{73^2-1}{73^2}} \\
 & = \frac{73}{12}\sqrt{1 - \frac{1}{73^2}} \\ 
 & \approx \frac{73}{12}\left(1 - \frac{1}{2\cdot73^2}\right)
\end{align}$$

$$
judgements
\hline
other judgements
\hgline
we good???
$$

$$\documentclass{article}

\usepackage{booktabs}

\begin{document}

\begin{table}\centering
\begin{tabular}{lll}
\toprule
Foo & 1 & 2 \\
    & 1 & 2 \\\cmidrule{2-3}% That's the rule you're looking for.
    & 1 & 2 \\
    & 1 & 2 \\
\midrule
Bar & 1 & 2 \\
    & 1 & 2 \\\cmidrule{2-3}% This too. The numbers designate the columns covered.
    & 1 & 2 \\
    & 1 & 2 \\
\bottomrule
\end{tabular}
\caption{1 and 2 in relation to Foo and Bar.}
\end{table}

\end{document}$$


{% endraw %}

$$  f(n) =
\begin{cases}
n/2,  & \text{if $n$ is even} \\
3n+1, & \text{if $n$ is odd}
\end{cases}$$

$$
\begin{array}{c|lcr}
n & \text{Left} & \text{Center} & \text{Right} \\
\hline
1 & 0.24 & 1 & 125 \\
2 & -1 & 189 & -8 \\
3 & -20 & 2000 & 1+10i
\end{array}
$$

$$
\left\{ 
\begin{array}{c}
a_1x+b_1y+c_1z=d_1 \\ 
a_2x+b_2y+c_2z=d_2 \\ 
a_3x+b_3y+c_3z=d_3
\end{array}
\right. 
$$

$$
\begin{array}{c|rrrr}& x^3 & x^2 & x^1 & x^0\\ & 1 & -6 & 11 & -6\\ {\color{red}1} & \downarrow & 1 & -5 & 6\\ \hline & 1 & -5 & 6 & |\phantom{-} {\color{blue}0} \end{array}
$$

inlined $int_0^1 f(x)dx$ and $f'(x) = dy/dx$

not inlined $$int_0^1 f(x)dx$$ and $$f'(x) = dy/dx$$
 
when $x<y$ we have $Bla + BlaBla_7^9$

## Testing AsciiMath

http://asciimath.org/


;;(1+2+3+4)//("4 terms")//More//Judgements;;

;;[[a,b],[c,d]];;

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
