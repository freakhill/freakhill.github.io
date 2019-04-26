+++
title = "I'm building a Lisp on the side"
description = "random assortment of notes"
date = 2019-03-17
weight = 80
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

partial evaluator + effect system + "collapse tower of interpreters" paper?

First order locality, packing, static & dynamic environments.

No GC, support for rust Pin/Unpin (build up support of gc as a library)

Concepts:
- Locality
- Packing = Tilling * Alignment * Size of each field
- Modules
- Each symbol has an API and a version, and a locality
- do not export libraries/packages, but functions and static bundles each with api/version/and dependencies

possibility to hint fix registers to store specific data
(for instance when making a VM keep the virtual pc in a specific register to avoid spilling)

http://lua-users.org/lists/lua-l/2011-02/msg00742.html

https://www.reddit.com/r/programming/comments/badl2/luajit_2_beta_3_is_out_support_both_x32_x64/c0lrus0/

when compiling/linking, possibility to hand tile the objects, keep the hotpaths close to each-other to be more I-cache friendly

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

## Stuff to check out

- [Spiral language](https://github.com/mrakgr/The-Spiral-Language)
- [Vau]()
- [ATS]()
- [Heliotrope](https://github.com/halgari/heliotrope)
- [Pink](https://github.com/namin/pink)
- [Collapsing towers of interpreters](http://lampwww.epfl.ch/~amin/pub/collapsing-towers.pdf)
- [Egison language](https://github.com/egison/egison) and its great pattern matching
- [Learn ADA/Spark]()
- look for the source for rust's lifetime checker
- [implementing functional languages](https://www.microsoft.com/en-us/research/wp-content/uploads/1992/01/student.pdf)
- [spineless tagless machine](https://www.microsoft.com/en-us/research/wp-content/uploads/1992/04/spineless-tagless-gmachine.pdf)
- [functional programming and parallel graph rewriting](https://wiki.clean.cs.ru.nl/Functional_Programming_and_Parallel_Graph_Rewriting)
- [llvm reference manual](https://llvm.org/docs/LangRef.html)
- [llvm docs](http://llvm.org/docs/)
- [great article about locks!](https://queue.acm.org/detail.cfm?id=2991130)

## An argument againat resumable exceptions

[From Bjarne Stroupstrup - Design and evolution of C++](https://books.google.co.jp/books?id=hS9mDwAAQBAJ&lpg=PT459&ots=xNle_k81Rl&dq=bjarne%20stroustrup%20against%20resumable%20exceptoni&pg=PT459#v=onepage&q=bjarne%20stroustrup%20against%20resumable%20exceptoni&f=false)

## Halide

In Jojolisp we already have the idea of separating a data structure definition (fields, open or close etc.) from its implementation (packing, order etc.).

Halide pushes further by separating an algorithm definition (a + b * c) from its implementation (vertorization, parallelisation etc.)!

This separations allows to experiment with different implementation strategies a lot faster (and is one nice step in implementing some degree of automatic high level optimization.

Halide works on matrix/array operations.

### Notes from Halide talks

(Re)organizing computation is hard:
- Optimizing parallelism/locality requires transforming program & data structure
- What transformations are legal?
- What transformations are beneficial?

Halide’s answer: decouple algorithm from schedule

Algorithm: what is computed

Schedule: where and when it’s computed

Easy for programmers to build pipelines

Easy to specify & explore optimizations manual or automatic search

Easy for the compiler to generate fast code

How can we determine good schedules?

Explicit programmer control: 
- The compiler does exactly what you say
- Schedules cannot influence correctness
- Exploration is fast and easy

Stochastic search (autotuning):
- Pick your favorite high-dimensional search.(We used Petabricks’ genetic algorithm tuner [Ansel et al. 2009])

\ /// \

BIG POINT : LOOPS ARE IMPLICIT IN HALIDE

## ADA/SPARK

...

### Spiral

...

### Vau/KLisp/Kernel

...

### Midori

Research project at microsoft about programming languages, compilers, OS, services, application, programming model etc. etc.

#### Safety

[source](http://joeduffyblog.com/2015/11/03/a-tale-of-three-safeties/)

Goal => eliminate bugs "by construction", allowing the mental space to go for more advanced/complex design optimizations

- memory safety
- type safety
- concurrency safety

Many approaches are available.

Software fault isolation => runtime cose, cannot fully exploit type&concurrency safety

Language-based safety => type system & local checks, prohibits categories of behaviours, safety holes avoided while writing code instead of at runtime. still some optional runtime checks (ex: array bound). however, if the type system is unsound there is no software fault isolation safety net...

Use a mix of these for defense in depth.

Example: runtime approach => google c++ sanitizers and microsoft's "/guard" feature. language approach => anything non C pretty much, careful of the escape hatches like the "unsafe" keyword in C#.
    
As small as possible amount of encapsulated unsafe code, isolated by component ("Trusted Computing Base"). OS scheduler, memory manager, all applications etc. were written in 100% safe code. Reliance on type safety => compiler part of the TCP. Limit the compiler related risks with "proof carrying code" and "typed assembly language" (TAL). Some amount of runtime checks will lessen the risk.

The cost? There is some stuff you can't dfo without pointer arithmetic, data races, etc. Their research was about how to minimize those costs. They were pretty succesful. They could unlock things like no blocking IO/lightweight processes.fine frained concurrency/asynchonous message passing etc. in a pervasive way which in the end offset the costs.

    For example, we did have certain types that were just buckets of bits. But these were just PODs. This allowed us to parse bits out of byte buffers – and casting to and fro between different wholly differnt “types” – efficiently and without loss of safety. We had a first class slicing type that permit us to form safe, checked windows over buffers, and unify the way we accessed all memory in the system (the slice type we’re adding to .NET was inspired by this).

    You might also wonder about the RTTI overheads required to support type safety. Well, thanks to PODs, and proper support for discriminated unions, we didn’t need to cast things all that much. And anywhere we did, the compiler optimized the hell out of the structures. The net result wasn’t much more than what a typical C++ program has just to support virtual dispatch (never mind casting).

    A general theme that ran throughout this journey is that compiler technology has advanced tremendously in the past 20 years. In most cases, safety overheads can be optimized very aggressively. That’s not to say they drop to zero, but we were able to get them within the noise for most interesting programs. And – surprisingly – we found plenty of cases where safety enabled new, novel optimization techniques! For example, having immutability in the type system permit us to share pages more aggressively across multiple heaps and programs; teaching the optimizer about contracts let us more aggressively hoist type safety checks; and so on.

    Another controversial area was concurrency safety. Especially given that the start of the project overlapped with the heady multicore days of the late 2000s. What, no parallelism, you ask?

    Note that I didn’t say we banned concurrency altogether, just that we banned unsafe concurrency. First, most concurrency in the system was expressed using message passing between lightweight software isolated processes. Second, within a process, we formalized the rules of safe shared memory parallelism, enforced through type system and programming model rules. The net result was that you couldn’t write a shared memory data race.

    They key insight driving the formalism here was that no two “threads” sharing an address space were permitted to see the same object as mutable at the same time. Many could read from the same memory at once, and one could write, but multiple could not write at once. A few details were discussed in our OOPSLA paper, and Rust achieved a similar outcome and documented it nicely. It worked well enough for many uses of fine-grained parallelism, like our multimedia stack.

    Since Midori, I’ve been working to bring some of our key lessons about how to achieve simultaneous safety and performance to both .NET and C++. Perhaps the most visible artifact are the safety profiles we recently launched as part of the C++ Core Guidelines effort. I expect more to show up in C# 7 and the C# AOT work we’re doing right now as we take .NET cross-platform. Midori was greenfield, whereas these environments require delicate compromises, which has been fun, but slowed down some of the transfer of these ideas into production. I’m happy to finally start seeing some of it bearing fruit.

    The combination of memory, type, and concurrency safety gave us a powerful foundation to stand on. Most of all, it delivered a heightened level of developer productivity and let us move fast. The extremely costly buffer overflows, data races, deadlocks, and so on, simply did not happen. Someday all operating systems will be written this way.

    In the next article in this series, we’ll look at how this foundational safety let us deliver a capability-based security model that was first class in the programming model and type system, and brought the same “by-construction” solution to eliminating ambient authority and enabling the principle of least privilege everywhere, by default, in a big way. See you next time.


#### Objects as secure capabilities

[source](http://joeduffyblog.com/2015/11/10/objects-as-secure-capabilities/)



Last time, we saw how Midori built on a foundation of type, memory, and concurrency safety. This time, we will see how this enabled some novel approaches to security. Namely, it let our system eliminate ambient authority and access control in favor of capabilities woven into the fabric of the system and its code. As with many of our other principles, the guarantees were delivered “by-construction” via the programming language and its type system.
Capabilities

First and foremost: what the heck are capabilities?

In the security systems most of us know and love, i.e. UNIX and Windows, permission to do something is granted based on identity, typically in the form of users and groups. Certain protected objects like files and system calls have access controls attached to them that restrict which users and groups can use them. At runtime, the OS checks that the requested operation is permitted based on these access controls, using ambient identity like what user is running the current process.

To illustrate this concept, consider a simple C call to the open API:

void main() {
	int file = open("filename", O_RDONLY, 0);
	// Interact with `file`...
}

Internally, this call is going to look at the identity of the current process, the access control tables for the given file object, and permit or reject the call accordingly. There are various mechanisms for impersonating users, like su and setuid on UNIX and ImpersonateLoggedOnUser on Windows. But the primary point here is that open just “knew” how to inspect some global state to understand the security implications of the action being asked of it. Another interesting aspect of this is that the O_RDONLY flag is passed, asking for readonly access, which factors into the authorization process too.

Well, what’s wrong with this?

It’s imprecise. It relies on ambient state that is invisible to the program. You can’t easily audit to see the security implications of the operation. You just need to know how open works. And thanks to its imprecision, it’s easy to get wrong, and going here wrong means security vulnerabilities. Specifically, it’s easy to trick a program into doing something on behalf of a user that it was never intended to do. This is called the “confused deputy problem”. All you need to do is trick the shell or program into impersonating a superuser, and you’re home free.

Capability-based security, on the other hand, isn’t reliant on global authority in this same way. It uses so-called “unforgeable tokens” to represent the ability to perform privileged operations. No matter how the decision gets made – there is an entirely complex topic of policy management and granting authority that gets into social and human behaviors – if the software isn’t meant to perform some operation, it simply never receives the token necessary to do said operation. And because tokens are unforgeable, the program can’t even attempt the operation. In a system like Midori’s, type safety meant that not only could the program not perform the operation, it would often be caught at compile-time.

Insecure operations rejected at compile-time, how cool is that!

The hypothetical open API from earlier, as you may have guessed, would look very different:

void main(File file) {
	// Interact with `file`...
}

OK, clearly we’re not in Kansas anymore. This is extremely different. And I’ve just passed the buck. Someone else has to show up with a File object? How do they get one?

The trite answer is, who cares, that’s up to the caller. But if they do show up with one, they must have been authorized to get it, because object references in a type safe system are unforgeable. The matter of policy and authorization are now pushed to the source where, arguably, they belong.

I’m over-simplifying a little bit, since this answer likely raised more questions than it actually answered. Let’s keep digging deeper.

So, again, let’s ask the question: how does one get their hands on a File object?

The code above neither knows nor cares whether where it came from. All it knows is it is given an object with a File-like API. It might have been new‘d up by the caller. More likely, it was obtained by consulting a separate entity, like a Filesystem or a Directory, both of which are also capability objects:

Filesystem fs = ...;
Directory dir = ... something(fs) ...;
File file = ... something(dir) ...;
MyProgram(file);

You might be getting really angry at me now. Where did fs come from? How did I get a Directory from fs, and how did I get a File from dir? I’ve just squished all the interesting topics around, like a water balloon, and answered nothing at all!

The reality is that those are all the interesting questions you encounter now when you try to design a filesystem using capabilities. You probably don’t want to permit free enumeration of the entire filesystem hierarchy, because if you get access to a Filesystem object – or the system’s root Directory – you can access everything, transitively. That’s the sort of thinking you do when you begin dealing with capabilities. You think hard about information encapsulation and exposure, because all you’ve got are objects to secure your system. Probably, you’ll have a way that a program requests access to some state somewhere on the Filesystem, declaratively, and then the “capability oracle” decides whether to give it to you. This is the role our application model played, and is how main got its hands on the capabilities a program’s manifest demanded that it needs. From that point onwards it’s just objects. The key is that nowhere in the entire system will you find the classical kind of ambient authority, and so none of these abstractions can “cheat” in their construction.

A classic paper, Protection, by Butler Lampson clearly articulates some of the key underlying principles, like unforgeable tokens. In a sense, each object in our system is its own “protection domain.” I also love Capability Myths Demolished’s way of comparing and contrasting capabilities with classical security models, if you want more details (or incorrectly speculate that they might be isomorphic).

Midori was by no means the first to build an operating systems with object capabilities at its core. In fact, we drew significant inspiration from KeyKOS and its successors EROS and Coyotos. These systems, like Midori, leveraged object-orientation to deliver capabilities. We were lucky enough to have some of the original designers of those projects on the team.

Before moving on, a warning’s in order: some systems confusingly use the term “capability” even though aren’t true capability systems. POSIX defines such a system and so both Linux and Android inherit it. Although POSIX capabilities are nicer than the typical classical ambient state and access control mechanisms – enabling finer-grained controls than usual – they are closer to them than the true sort of capability we’re discussing here.
Objects and State

A nice thing about capabilities just being objects is that you can apply existing knowledge about object-orientation to the domains of security and authority.

Since objects represent capabilities, they can be as fine or coarse as you wish. You can make new ones through composition, or modify existing ones through subclassing. Dependencies are managed just like any dependencies in an object-oriented system: by encapsulating, sharing, and requesting references to objects. You can leverage all sorts of classic design patterns suddenly in the domain of security. I do have to admit the simplicity of this idea was jarring to some.

One fundamental idea is revocation. An object has a type and our system let you substitute one implementation in place of another. That means if you ask me for a Clock, I needn’t give you access to a clock for all time, or even the real one for that matter. Instead, I can give you my own subclass of a Clock that delegates to the real one, and rejects your attempts after some event occurs. You’ve got to either trust the source of the clock, or explicitly safe-guard yourself against it, if you aren’t sure.

Another concept is state. In our system, we banned mutable statics, by-construction at compile-time, in our programming language. That’s right, not only could a static field only be written to once, but the entire object graph it referred to was frozen after construction. It turns out mutable statics are really just a form of ambient authority, and this approach prevents someone from, say, caching a Filesystem object in a global static variable, and sharing it freely, thereby creating something very similar to the classical security models we are seeking to avoid. It also had many benefits in the area of safe concurrency and even gave us performance benefits, because statics simply became rich constant object graphs that could be frozen and shared across binaries.

The total elimination of mutable statics had an improvement to our system’s reliability that is difficult to quantify, and difficult to understate. This is one of the biggest things I miss.

Recall my mention of Clock above. This is an extreme example, however, yes, that’s right, there was no global function to read time, like C’s localtime or C#’s DateTime.Now. To get the time, you must explicitly request a Clock capability. This has the effect of eliminating non-determinism from an entire class of functions. A static function that doesn’t do IO – something we can ascertain in our type system (think Haskell monads) – now becomes purely functional, memoizable, and even something we can evaluate at compile-time (a bit like constexpr on steroids).

I’ll be the first to admit, there was a maturity process that developers went through, as they learned about the design patterns in an object capability system. It was common for “big bags” of capabilities to grow over time, and/or for capabilities to be requested at an inopportune time. For example, imagine a Stopwatch API. It probably needs the Clock. Do you pass the Clock to every operation that needs to access the current time, like Start and Stop? Or do you construct the Stopwatch with a Clock instance up-front, thereby encapsulating the Stopwatch’s use of the time, making it easier to pass to others (recognizing, importantly, that this essentially grants the capability to read the time to the recipient). Another example, if your abstraction requires 15 distinct capabilities to get its job done, does its constructor take a flat list of 15 objects? What an unwieldy, annoying constructor! Instead, a better approach is to logically group these capabilities into separate objects, and maybe even use contextual storage like parents and children to make fetching them easier.

The weaknesses of classical object-oriented systems also rear their ugly heads. Downcasting, for example, means you cannot entirely trust subclassing as a means of information hiding. If you ask for a File, and I supply my own CloudFile that derives from File and adds its own public cloud-like functions to it, you might sneakily downcast to CloudFile and do things I didn’t intend. We addressed this with severe restrictions on casting and by putting the most sensitive capabilities on an entirely different plan altogether…
Distributed Capabilities

I’ll briefly touch on an area that warrants a lot more coverage in a future post: our asynchronous programming model. This model formed the foundation of how we did concurrent, distributed computing; how we performed IO; and, most relevant to this discussion, how capabilities could extend their reach across these critical domains.

In the Filesystem example above, our system often hosted the real object behind that Filesystem reference in a different process altogether. That’s right, invoking a method actually dispatched a remote call to another process, which serviced the call. So, in practice, most, but not all, capabilities were asynchronous objects; or, more precisely, unforgeable tokens that permit one to talk with them, something we called an “eventual” capability. The Clock was a counter-example to this. It was something we called a “prompt” capability: something that wrapped a system call, rather than a remote call. But most security-related capabilities tended to be remote, because most interesting things that require authority bottom out on some kind of IO. It’s rare you need authority to simply perform a computation. In fact, the filesystem, network stack, device drivers, graphics surfaces, and a whole lot more took the form of eventual capabilities.

This unification of overall security in the OS and how we built distributed, and highly concurrent, secure systems, was one of our largest, innovative, and most important accomplishments.

I should note, like the idea of capabilities in general, similar ideas were pioneered well before Midori. Although we didn’t use the languages directly, the ideas from the Joule language and, later, E, laid some very powerful foundations for us to build upon. Mark Miller’s 2006 PhD thesis is a treasure trove of insights in this entire area. We had the privilege of working closely with one of the brightest minds I’ve ever worked alongside, who happened to have been a chief designer of both systems.
Wrapping Up

There is so much to say about the benefits of capabilities. The foundation of type safety let us make some bold leaps forward. It led to a very different system architecture than is commonplace with ambient authority and access controls. This system brought secure, distributed computing to the forefront in a way that I’ve never witnessed before. The design patterns that emerged really embraced object-orientation to its fullest, leveraging all sorts of design patterns that suddenly seemed more relevant than ever before.

We never did get much real-world exposure on this model. The user-facing aspects were under-explored compared to the architectural ones, like policy management. For example, I doubt we’d want to ask my mom if she wants to let the program use a Clock. Most likely we’d want some capabilities to be granted automatically (like the Clock), and others to be grouped, through composition, into related ones. Capabilities-as-objects thankfully gives us a plethora of known design patterns for doing this. We did have a few honey pots, and none ever got hacked (well, at least, we didn’t know if we did), but I cannot attest for sure about the quantifiable security of the resulting system. Qualitatively I can say we felt better having the belts-and-suspenders security at many layers of the system’s construction, but we didn’t get a chance to prove it at scale.

In the next article, we’ll dig deeper into the asynchronous model that ran deep throughout the system. These days, asynchronous programming is a hot topic, with await showing up in C#, ECMAScript7, Python, C++, and more. This plus the fine-grained decomposition into lightweight processes connected by message passing were able to deliver a highly concurrent, reliable, and performant system, with asynchrony that was as easy to use as in all of those languages. See you next time!

#### Asynchronous everything

[source](http://joeduffyblog.com/2015/11/19/asynchronous-everything/)



Midori was built out of many ultra-lightweight, fine-grained processes, connected through strongly typed message passing interfaces. It was common to see programs that’d’ve classically been single, monolithic processes – perhaps with some internal multithreading – expressed instead as dozens of small processes, resulting in natural, safe, and largely automatic parallelism. Synchronous blocking was flat-out disallowed. This meant that literally everything was asynchronous: all file and network IO, all message passing, and any “synchronization” activities like rendezvousing with other asynchronous work. The resulting system was highly concurrent, responsive to user input, and scaled like the dickens. But as you can imagine, it also came with some fascinating challenges.
Asynchronous Programming Model

The asynchronous programming model looked a lot like C#’s async/await on the surface.

That’s not a coincidence. I was the architect and lead developer on .NET tasks. As the concurrency architect on Midori, coming off just shipping the .NET release, I admit I had a bit of a bias. Even I knew what we had wouldn’t work as-is for Midori, however, so we embarked upon a multi-year journey. But as we went, we worked closely with the C# team to bring some of Midori’s approaches back to the shipping language, and had been using a variant of the async/await model for about a year when C# began looking into it. We didn’t bring all the Midori goodness to .NET, but some of it certainly showed up, mostly in the area of performance. It still kills me that I can’t go back in time and make .NET’s task a struct.

But I’m getting ahead of myself. The journey to get to this point was a long one, and we should start at the beginning.
Promises

At the core of our asynchronous model was a technology called promises. These days, the idea is ubiquitous. The way we used promises, however, was more interesting, as we’ll start to see soon. We were heavily influenced by the E system. Perhaps the biggest difference compared to popular asynchronous frameworks these days is there was no cheating. There wasn’t a single synchronous API available.

The first cut at the model used explicit callbacks. This’ll be familiar to anybody who’s done Node.js programming. The idea is you get a Promise<T> for any operation that will eventually yield a T (or fail). The operation producing that may be running asynchronously within the process or even remotely somewhere else. The consumer doesn’t need to know or care. They just deal with the Promise<T> as a first class value and, when the T is sought, must rendezvous.

The basic callback model started something like this:

Promise<T> p = ... some operation ...;

... optionally do some things concurrent with that operation ...;

Promise<U> u = Promise.When(
    p,
    (T t) => { ... the T is available ... },
    (Exception e) => { ... a failure occurred ... }
);

Eventually we switched over from static to instance methods:

Promise<U> u = p.WhenResolved(
    (T t) => { ... the T is available ... },
    (Exception e) => { ... a failure occurred ... }
);

Notice that the promises chain. The operation’s callbacks are expected to return a value of type U or throw an exception, as appropriate. Then the recipient of the u promise does the same, and so on, and so forth.

This is concurrent dataflow programming. It is nice because the true dependencies of operations govern the scheduling of activity in the system. A classical system often results in work stoppage not because of true dependencies, but false dependencies, like the programmer just happening to issue a synchronous IO call deep down in the callstack, unbeknownst to the caller.

In fact, this is one of the reasons your screen bleaches so often on Windows. I’ll never forget a paper a few years back finding one of the leading causes of hangs in Outlook. A commonly used API would occasionally enumerate Postscript fonts by attempting to talk to the printer over the network. It cached fonts so it only needed to go to the printer once in a while, at unpredictable times. As a result, the “good” behavior led developers to think it safe to call from the UI thread. Nothing bad happened during testing (where, presumably, the developers worked on expensive computers with near-perfect networks). Sadly, when the network flaked out, the result was 10 second hangs with spinning donuts and bleachy white screens. To this day, we still have this problem in every OS that I use.

The issue in this example is the possibility for high latency wasn’t apparent to developers calling the API. It was even less apparent because the call was buried deep in a callstack, masked by virtual function calls, and so on. In Midori, where all asynchrony is expressed in the type system, this wouldn’t happen because such an API would necessarily return a promise. It’s true, a developer can still do something ridiculous (like an infinite loop on the UI thread), but it’s a lot harder to shoot yourself in the foot. Especially when it came to IO.

What if you didn’t want to continue the dataflow chain? No problem.

p.WhenResolved(
    ... as above ...
).Ignore();

This turns out to be a bit of an anti-pattern. It’s usually a sign that you’re mutating shared state.

The Ignore warrants a quick explanation. Our language didn’t let you ignore return values without being explicit about doing so. This specific Ignore method also addded some diagnostics to help debug situations where you accidentally ignored something important (and lost, for example, an exception).

Eventually we added a bunch of helper overloads and APIs for common patterns:

// Just respond to success, and propagate the error automatically:
Promise<U> u = p.WhenResolved((T t) => { ... the T is available ... });

// Use a finally-like construct:
Promise<U> u = p.WhenResolved(
    (T t) => { ... the T is available ... },
    (Exception e) => { ... a failure occurred ... },
    () => { ... unconditionally executes ... }
);

// Perform various kinds of loops:
Promise<U> u = Async.For(0, 10, (int i) => { ... the loop body ... });
Promise<U> u = Async.While(() => ... predicate, () => { ... the loop body ... });

// And so on.

This idea is most certainly not even close to new. Joule and Alice even have nice built-in syntax to make the otherwise clumsy callback passing shown above more tolerable.

But it was not tolerable. The model tossed out decades of familiar programming language constructs, like loops.

It got really bad. Like really, really. It led to callback soup, often nested many levels deep, and often in some really important code to get right. For example, imagine you’re in the middle of a disk driver, and you see code like:

Promise<void> DoSomething(Promise<string> cmd) {
    return cmd.WhenResolved(
        s => {
            if (s == "...") {
                return DoSomethingElse(...).WhenResolved(
                    v => {
                        return ...;
                    },
                    e => {
                        Log(e);
                        throw e;
                    }
                );
            }
            else {
                return ...;
            }
        },
        e => {
            Log(e);
            throw e;
        }
    );
}

It’s just impossible to follow what’s going on here. It’s hard to tell where the various returns return to, what throw is unhandled, and it’s easy to duplicate code (such as the error cases), because classical block scoping isn’t available. God forbid you need to do a loop. And it’s a disk driver – this stuff needs to be reliable!
Enter Async and Await

Almost every major language now features async and/or await-like constructs. We began wide-scale use sometime in 2009. And when I say wide-scale, I mean it.

The async/await approach let us keep the non-blocking nature of the system and yet clean up some of the above usability mess. In hindsight, it’s pretty obvious, but remember back then the most mainstream language with await used at scale was F# with its asynchronous workflows (also see this paper). And despite the boon to usability and productivity, it was also enormously controversial on the team. More on that later.

What we had was a bit different from what you’ll find in C# and .NET. Let’s walk through the progression from the promises model above to this new async/await-based one. As we go, I’ll point out the differences.

We first renamed Promise<T> to AsyncResult<T>, and made it a struct. (This is similar to .NET’s Task<T>, however focuses more on the “data” than the “computation.”) A family of related types were born:

    T: the result of a prompt, synchronous computation that cannot fail.
    Async<T>: the result of an asynchronous computation that cannot fail.
    Result<T>: the result of a a prompt, synchronous computation that might fail.
    AsyncResult<T>: the result of an asynchronous computation that might fail.

That last one was really just a shortcut for Async<Result<T>>.

The distinction between things that can fail and things that cannot fail is a topic for another day. In summary, however, our type system guaranteed these properties for us.

Along with this, we added the await and async keywords. A method could be marked async:

async int Foo() { ... }

All this meant was that it was allowed to await inside of it:

async int Bar() {
    int x = await Foo();
    ...
    return x * x;
}

Originally this was merely syntactic sugar for all the callback goop above, like it is in C#. Eventually, however, we went way beyond this, in the name of performance, and added lightweight coroutines and linked stacks. More below.

A caller invoking an async method was forced to choose: use await and wait for its result, or use async and launch an asynchronous operation. All asynchrony in the system was thus explicit:

int x = await Bar();        // Invoke Bar, but wait for its result.
Async<int> y = async Bar(); // Invoke Bar asynchronously; I'll wait later.
int z = await y;            // ...like now.  This waits for Bar to finish.

This also gave us a very important, but subtle, property that we didn’t realize until much later. Because in Midori the only way to “wait” for something was to use the asynchronous model, and there was no hidden blocking, our type system told us the full set of things that could “wait.” More importantly, it told us the full set of things that could not wait, which told us what was pure synchronous computation! This could be used to guarantee no code ever blocked the UI from painting and, as we’ll see below, many other powerful capabilities.

Because of the sheer magnitude of asynchronous code in the system, we embellished lots of patterns in the language that C# still doesn’t support. For example, iterators, for loops, and LINQ queries:

IAsyncEnumerable<Movie> GetMovies(string url) {
    foreach (await var movie in http.Get(url)) {
        yield return movie;
    }
}

Or, in LINQ style:

IAsyncEnumerable<Movie> GetMovies(string url) {
    return
        from await movie in http.Get(url)
        ... filters ...
        select ... movie ...;
}

The entire LINQ infrastructure participated in streaming, including resource management and backpressure.

We converted millions of lines of code from the old callback style to the new async/await one. We found plenty of bugs along the way, due to the complex control flow of the explicit callback model. Especially in loops and error handling logic, which could now use the familiar programming language constructs, rather than clumsy API versions of them.

I mentioned this was controversial. Most of the team loved the usability improvements. But it wasn’t unanimous.

Maybe the biggest problem was that it encouraged a pull-style of concurrency. Pull is where a caller awaits a callee before proceeding with its own operations. In this new model, you need to go out of your way to not do that. It’s always possible, of course, thanks to the async keyword, but there’s certainly a little more friction than the old model. The old, familiar, blocking model of waiting for things is just an await keyword away.

We offered bridges between pull and push, in the form of reactive IObservable<T>/IObserver<T> adapters. I wouldn’t claim they were very successful, however for side-effectful actions that didn’t employ dataflow, they were useful. In fact, our entire UI framework was based on the concept of functional reactive programming, which required a slight divergence from the Reactive Framework in the name of performance. But alas, this is a post on its own.

An interesting consequence was a new difference between a method that awaits before returning a T, and one that returns an Async<T> directly. This difference didn’t exist in the type system previously. This, quite frankly, annoyed the hell out of me and still does. For example:

async int Bar()  { return await Foo(); }
Async<int> Bar() { return async Foo(); }

We would like to claim the performance between these two is identical. But alas, it isn’t. The former blocks and keeps a stack frame alive, whereas the latter does not. Some compiler cleverness can help address common patterns – this is really the moral equivalent to an asynchronous tail call – however it’s not always so cut and dry.

On its own, this wasn’t a killer. It caused some anti-patterns in important areas like streams, however. Developers were prone to awaiting in areas they used to just pass around Async<T>s, leading to an accumulation of paused stack frames that really didn’t need to be there. We had good solutions to most patterns, but up to the end of the project we struggled with this, especially in the networking stack that was chasing 10GB NIC saturation at wire speed. We’ll discuss some of the techniques we employed below.

But at the end of this journey, this change was well worth it, both in the simplicity and usability of the model, and also in some of the optimization doors it opened up for us.
The Execution Model

That brings me to the execution model. We went through maybe five different models, but landed in a nice place.

A key to achieving asynchronous everything was ultra-lightweight processes. This was possible thanks to software isolated processes (SIPs), building upon the foundation of safety described in an earlier post.

The absence of shared, mutable static state helped us keep processes small. It’s surprising how much address space is burned in a typical program with tables and mutable static variables. And how much startup time can be spent initializing said state. As I mentioned earlier, we froze most statics as constants that got shared across many processes. The execution model also resulted in cheaper stacks (more on that below) which was also a key factor. The final thing here that helped wasn’t even technical, but cultural. We measured process start time and process footprint nightly in our lab and had a “ratcheting” process where every sprint we ensured we got better than last sprint. A group of us got in a room every week to look at the numbers and answer the question of why they went up, down, or stayed the same. We had this culture for performance generally, but in this case, it kept the base of the system light and nimble.

Code running inside processes could not block. Inside the kernel, blocking was permitted in select areas, but remember no user code ever ran in the kernel, so this was an implementation detail. And when I say “no blocking,” I really mean it: Midori did not have demand paging which, in a classical system, means that touching a piece of memory may physically block to perform IO. I have to say, the lack of page thrashing was such a welcome that, to this day, the first thing I do on a new Windows sytem is disable paging. I would much rather have the OS kill programs when it is close to the limit, and continue running reliably, than to deal with a paging madness.

C#’s implementation of async/await is entirely a front-end compiler trick. If you’ve ever run ildasm on the resulting assembly, you know: it lifts captured variables into fields on an object, rewrites the method’s body into a state machine, and uses Task’s continuation passing machinery to keep the iterator-like object advancing through the states.

We began this way and shared some of our key optimizations with the C# and .NET teams. Unfortunately, the result at the scale of what we had in Midori simply didn’t work.

First, remember, Midori was an entire OS written to use garbage collected memory. We learned some key lessons that were necessary for this to perform adequately. But I’d say the prime directive was to avoid superfluous allocations like the plague. Even short-lived ones. There is a mantra that permeated .NET in the early days: Gen0 collections are free. Unfortunately, this shaped a lot of .NET’s library code, and is utter hogwash. Gen0 collections introduce pauses, dirty the cache, and introduce beat frequency issues in a highly concurrent system. I will point out, however, one of the tricks to garbage collection working at the scale of Midori was precisely the fine-grained process model, where each process had a distinct heap that was independently collectible. I’ll have an entire article devoted to how we got good behavior out of our garbage collector, but this was the most important architectural characteristic.

The first key optimization, therefore, is that an async method that doesn’t await shouldn’t allocate anything.

We were able to share this experience with .NET in time for C#’s await to ship. Sadly, by then, .NET’s Task had already been made a class. Since .NET requires async method return types to be Tasks, they cannot be zero-allocation unless you go out of your way to use clumsy patterns like caching singleton Task objects.

The second key optimization was to ensure that async methods that awaited allocated as little as possible.

In Midori, it was very common for one async method to invoke another, which invoked another … and so on. If you think about what happens in the state machine model, a leaf method that blocks triggers a cascade of O(K) allocations, where K is the depth of the stack at the time of the await. This is really unfortunate.

What we ended up with was a model that only allocated when the await happened, and that allocated only once for an entire such chain of calls. We called this chain an “activity.” The top-most async demarcated the boundary of an activity. As a result, async could cost something, but await was free.

Well, that required one additional step. And this one was the biggie.

The final key optimization was to ensure that async methods imposed as little penalty as possible. This meant eliminating a few sub-optimal aspects of the state machine rewrite model. Actually, we abandoned it:

    It completely destroyed code quality. It impeded simple optimizations like inlining, because few inliners consider a switch statement with multiple state variables, plus a heap-allocated display frame, with lots of local variable copying, to be a “simple method.” We were competing with OS’s written in native code, so this matters a lot.

    It required changes to the calling convention. Namely, returns had to be Async*<T> objects, much like .NET’s Task<T>. This was a non-starter. Even though ours were structs – eliminating the allocation aspect – they were multi-words, and required that code fetch out the values with state and type testing. If my async method returns an int, I want the generated machine code to be a method that returns an int, goddamnit.

    Finally, it was common for too much heap state to get captured. We wanted the total space consumed by an awaiting activity to be as small as possible. It was common for some processes to end up with hundreds or thousands of them, in addition to some processes constantly switching between them. For footprint and cache reasons, it was important that they remain as small as the most carefully hand-crafted state machine as possible.

The model we built was one where asynchronous activities ran on linked stacks. These links could start as small as 128 bytes and grow as needed. After much experimentation, we landed on a model where link sizes doubled each time; so, the first link would be 128b, then 256b, …, on up to 8k chunks. Implementing this required deep compiler support. As did getting it to perform well. The compiler knew to hoist link checks, especially out of loops, and probe for larger amounts when it could predict the size of stack frames (accounting for inlining). There is a common problem with linking where you can end up relinking frequently, especially at the edge of a function call within a loop, however most of the above optimizations prevented this from showing up. And, even if they did, our linking code was hand-crafted assembly – IIRC, it was three instructions to link – and we kept a lookaside of hot link segments we could reuse.

There was another key innovation. Remember, I hinted earlier, we knew statically in the type system whether a function was asynchronous or not, simply by the presence of the async keyword? That gave us the ability in the compiler to execute all non-asynchronous code on classical stacks. The net result was that all synchronous code remained probe-free! Another consequence is the OS kernel could schedule all synchronous code on a set of pooled stacks. These were always warm, and resembled a classical thread pool, more than an OS scheduler. Because they never blocked, you didn’t have O(T) stacks, where T is the number of threads active in the entire system. Instead, you ended up with O(P), where P is the number of processors on the machine. Remember, eliminating demand paging was also key to achieiving this outcome. So it was really a bunch of “big bets” that added up to something that was seriously game-changing.
Message Passing

A fundamental part of the system has been missing from the conversation: message passing.

Not only were processes ultra-lightweight, they were single-threaded in nature. Each one ran an event loop and that event loop couldn’t be blocked, thanks to the non-blocking nature of the system. Its job was to execute a piece of non-blocking work until it finished or awaited, and then to fetch the next piece of work, and so on. An await that was previously waiting and became satisfied was simply scheduled as another turn of the crank.

Each such turn of the crank was called, fittingly, a “turn.”

This meant that turns could happen between asynchronous activities and at await points, nowhere else. As a result, concurrent interleaving only occurred at well-defined points. This was a giant boon to reasoning about state in the face of concurrency, however it comes with some gotchas, as we explore later.

The nicest part of this, however, was that processes suffered no shared memory race conditions.

We did have a task and data parallel framework. It leveraged the concurrency safety features of the languge I’ve mentioned previously – immutability, isolation, and readonly annotations – to ensure that this data race freedom was not violated. This was used for fine-grained computations that could use the extra compute power. Most of the system, however, gained its parallel execution through the decomposition into processes connected by message passing.

Each process could export an asynchronous interface. It looked something like this:

async interface ICalculator {
    async int Add(int x, int y);
    async int Multiply(int x, int y);
    // Etc...
}

As with most asynchronous RPC systems, from this interface was generated a server stub and client-side proxy. On the server, we would implement the interface:

class MyCalculator : ICalculator {
    async int Add(int x, int y) { return x + y; }
    async int Multiply(int x, int y) { return x * y; }
    // Etc...
}

Each server-side object could also request capabilities simply by exposing a constructor, much like the program’s main entrypoint could, as I described in the prior post. Our application model took care of activating and wiring up the server’s programs and services.

A server could also return references to other objects, either in its own process, or a distant one. The system managed the object lifetime state in coordination with the garbage collector. So, for example, a tree:

class MyTree : ITree {
    async ITree Left() { ... }
    async ITree Right() { ... }
}

As you might guess, the client-side would then get its hands on a proxy object, connected to this server object running in a process. It’s possible the server would be in the same process as the client, however typically the object was distant, because this is how processes communicated with one another:

class MyProgram {
    async void Main(IConsole console, ICalculator calc) {
        var result = await calc.Add(2, 2);
        await console.WriteLine(result);
    }
}

Imagining for a moment that the calculator was a system service, this program would communicate with that system service to add two numbers, and then print the result to the console (which itself also could be a different service).

A few key aspects of the system made message passing very efficient. First, all of the data structures necessary to talk cross-process were in user-mode, so no kernel-mode transitions were needed. In fact, they were mostly lock-free. Second, the system used a technique called “pipelining” to remove round-trips and synchronization ping-ponging. Batches of messages could be stuffed into channels before they filled up. They were delivered in chunks at-a-time. Finally, a novel technique called “three-party handoff” was used to shorten the communication paths between parties engaging in a message passing dialogue. This cut out middle-men whose jobs in a normal system would have been to simply bucket brigade the messages, adding no value, other than latency and wasted work.

Message Passing Diagram

The only types marshalable across message passing boundaries were:

    Primitive types (int, string, etc).
    Custom PODs that didn’t contain pointers (explicitly labeled marshalable).
    References to streams (see below).
    References to other async objects (e.g., our ICalculator above).
    A special SharedData object, which requires a bit more explanation.

Most of these are obvious. The SharedData thing is a little subtle, however. Midori had a fundamental philosophy of “zero-copy” woven throughout its fabric. This will be the topic of a future post. It’s the secret sauce that let us out-perform many classical systems on some key benchmarks. The idea is, however, no byte should be copied if it can be avoided. So we don’t want to marshal a byte[] by copy when sending a message between processes, for example. The SharedData was a automatic ref-counted pointer to some immutable data in a heap shared between processes. The OS kernel managed this heap memory and reclaimed it when all references dropped to zero. Because the ref-counts were automatic, programs couldn’t get it wrong. This leveraged some new features in our language, like destructors.

We also had the notion of “near objects,” which went an extra step and let you marshal references to immutable data within the same process heap. This let you marshal rich objects by-reference. For example:

// An asynchronous object in my heap:
ISpellChecker checker = ...;

// A complex immutable Document in my heap,
// perhaps using piece tables:
immutable Document doc = ...;

// Check the document by sending messages within
// my own process; no copies are necessary:
var results = await checker.Check(doc);

As you can guess, all of this was built upon a more fundamental notion of a “channel.” This is similar to what you’ll see in Occam, Go and related CSP languages. I personally found the structure and associated checking around how messages float around the system more comfortable than coding straight to the channels themselves, but your mileage may vary. The result felt similar to programming with actors, with some key differences around the relationship between process and object identity.
Streams

Our framework had two fundamental stream types: Stream held a stream of bytes and Sequence<T> held Ts. They were both forward-only (we had separate seekable classes) and 100% asynchronous.

Why two types, you wonder? They began as entirely independent things, and eventually converged to be brother and sister, sharing a lot of policy and implementation with one another. The core reason they remained distinct, however, is that it turns out when you know you’re just schlepping raw byte-streams around, you can make a lot of interesting performance improvements in the implementation, compared to a fully generic version.

For purposes of this discussion, however, just imagine that Stream and Sequence<byte> are isomorphic.

As hinted at earlier, we also had IAsyncEnumerable<T> and IAsyncEnumerator<T> types. These were the most general purpose interfaces you’d code against when wanting to consume something. Developers could, of course, implement their own stream types, especially since we had asynchronous iterators in the language. A full set of asynchronous LINQ operators worked over these interfaces, so LINQ worked nicely for consuming and composing streams and sequences.

In addition to the enumerable-based consumption techniques, all the standard peeking and batch-based APIs were available. It’s important to point out, however, that the entire streams framework built atop the zero-copy capabilities of the kernel, to avoid copying. Every time I see an API in .NET that deals with streams in terms of byte[]s makes me shed a tear. The result is our streams were actually used in very fundamental areas of the system, like the network stack itself, the filesystem the web servers, and more.

As hinted at earlier, we supported both push and pull-style concurrency in the streaming APIs. For example, we supported generators, which could either style:

// Push:
var s = new Stream(g => {
    var item = ... do some work ...;
    g.Push(item);
});

// Pull:
var s = new Stream(g => {
    var item = await ... do some work ...;
    yield return item;
});

The streaming implementation handled gory details of batching and generally ensuring streaming was as efficient as possible. A key technique was flow control, borrowed from the world of TCP. A stream producer and consumer collaborated, entirely under the hood of the abstraction, to ensure that the pipeline didn’t get too imbalanced. This worked much like TCP flow control by maintaining a so-called “window” and opening and closing it as availability came and went. Overall this worked great. For example, our realtime multimedia stack had two asynchronous pipelines, one for processing audio and the other for processing video, and merged them together, to implement A/V sync. In general, the built-in flow control mechanisms were able to keep them from dropping frames.
“Grand” Challenges

The above was a whirlwind tour. I’ve glossed over some key details, but hopefully you get the picture.

Along this journey we uncovered several “grand challenges.” I’ll never forget them, as they formed the outline of my entire yearly performance review for a good 3 years straight. I was determined to conquer them. I can’t say that our answers were perfect, but we made a gigantic dent in them.
Cancellation

The need to have cancellable work isn’t anything new. I came up with the CancellationToken abstraction in .NET, largely in response to some of the challenges we had around ambient authority with prior “implicitly scoped” attempts.

The difference in Midori was the scale. Asynchronous work was everywhere. It sprawled out across processes and, sometimes, even machines. It was incredibly difficult to chase down run-away work. My simple use-case was how to implement the browser’s “cancel” button reliably. Simply rendering a webpage involved a handful of the browser’s own processes, plus the various networking processes – including the NIC’s device driver – along with the UI stack, and more. Having the ability to instantly and reliably cancel all of this work was not just appealing, it was required.

The solution ended up building atop the foundation of CancellationToken.

They key innovation was first to rebuild the idea of CancellationToken on top of our overall message passing model, and then to weave it throughout in all the right places. For example:

    CancellationTokens could extend their reach across processes.
    Whole async objects could be wrapped in a CancellationToken, and used to trigger revocation.
    Whole async functions could be invoked with a CancellationToken, such that cancelling propagated downward.
    Areas like storage needed to manually check to ensure that state was kept consistent.

In summary, we took a “whole system” approach to the way cancellation was plumbed throughout the system, including extending the reach of cancellation across processes. I was happy with where we landedon this one.
State Management

The ever-problematic “state management” problem can be illustrated with a simple example:

async void M(State s) {
    int x = s.x;
    await ... something ...;
    assert(x == s.x);
}

The question here is, can the assertion fire?

The answer is obviously yes. Even without concurrency, reentrancy is a problem. Depending on what I do in “… something …”, the State object pointed to by s might change before returning back to us.

But somewhat subtly, even if “… something …” doesn’t change the object, we may find that the assertion fires. Consider a caller:

State s = ...;
Async<void> a = async M(s);
s.x++;
await a;

The caller retains an alias to the same object. If M’s awaiting operation must wait, control is resumed to the caller. The caller here then increments x before awaiting M’s completion. Unfortunately, when M resumes, it will discover that the value of x no longer matches s.x.

This problem manifests in other more devious ways. For example, imagine one of those server objects earlier:

class StatefulActor : ISomething {
    int state;
    async void A() {
        // Use state
    }
    async void B() {
        // Use state
    }
}

Imagining that both A and B contain awaits, they can now interleave with one another, in addition to interleaving with multiple activations of themselves. If you’re thinking this smells like a race condition, you’re right. In fact, saying that message passing systems don’t have race conditions is an outright lie. There have even been papers discussing this in the context of Erlang. It’s more correct to say our system didn’t have data race conditions.

Anyway, there be dragons here.

The solution is to steal a page from classical synchronization, and apply one of many techniques:

    Isolation.
    Standard synchronization techniques (prevent write-write or read-write hazards).
    Transactions.

By far, we preferred isolation. It turns out web frameworks offer good lessons to learn from here. Most of the time, a server object is part of a “session” and should not be aliased across multiple concurrent clients. It tended to be easy to partition state into sub-objects, and have dialogues using those. Our language annotations around mutability helped to guide this process.

A lesser regarded technique was to apply synchronization. Thankfully in our language, we knew which operations read versus wrote, and so we could use that to block dispatching messages intelligently, using standard reader-writer lock techniques. This was comfy and cozy and whatnot, but could lead to deadlocks if done incorrectly (which we did our best to detect). As you can see, once you start down this path, the world is less elegant, so we discouraged it.

Finally, transactions. We didn’t go there. Distributed transactions are evil.

In general, we tried to learn from the web, and apply architectures that worked for large-scale distributed systems. Statelessness was by far the easiest pattern. Isolation was a close second. Everything else was just a little dirty.

P.S. I will be sure to have an entire post dedicated to the language annotations.
Ordering

In a distributed system, things get unordered unless you go out of your way to preserve order. And going out of your way to preserve order removes concurrency from the system, adds book-keeping, and a ton of complexity. My biggest lesson learned here was: distributed systems are unordered. It sucks. Don’t fight it. You’ll regret trying.

Leslie Lamport has a classic must-read paper on the topic: Time, Clocks, and the Ordering of Events in a Distributed System.

But unordered events surprise developers. A good example is as follows:

// Three asynchronous objects:
IA a = ...;
IB b = ...;
IC c = ...;

// Tell b to talk to a:
var req1 = async b.TalkTo(a);

// Tell c to talk to b:
var req2 = async c.TalkTo(a);

await Async.Join(req1, req2);

If you expected that b is guaranteed to talk with a before c talks with a, you’re in for a bad day.

We offered facilities for controlling order. For example, you could flush all the messages from a channel, and await their delivery. You could, of course, always await the individual operations, but this introduces some amount of unnecessary latency due to round-tripping. We also had a “flow” abstraction that let you guarantee a sequence of asynchronous messages were delivered in order, but in the most efficient way possible.

As with state management, we found that an abundance of ordering problems was often indicative of a design problem.
Debugging

With so much work flying around in the system, debugging was a challenge in the early days.

The solution, as with many such challenges, was tooling. We taught our tools that activities were as first class as threads. We introduced causality IDs that flowed with messages across processes, so if you broke into a message dispatch in one process, you could trace back to the origin in potentially some other distant process. The default behavior for a crash was to gather this cross-process stack trace, to help figure out how you go to where you were.

Another enormous benefit of our improved execution model was that stacks were back! Yes, you actually got stack traces for asynchronous activities awaiting multiple levels deep at no extra expense. Many systems like .NET’s have to go out of their way to piece together a stack trace from disparate hunks of stack-like objects. We had that challenge across processes, but within a single process, all activities had normal stack traces with variables that were in a good state.
Resource Management

At some point, I had a key realization. Blocking in a classical system acts as a natural throttle on the amount of work that can be offered up to the system. Your average program doesn’t express all of its latent concurrency and parallelism by default. But ours did! Although that sounds like a good thing – and indeed it was – it came with a dark side. How the heck do you manage resources and schedule all that work intelligently, in the face of so much of it?

This was a loooooooong, winding road. I won’t claim we solved it. I won’t claim we even came close. I will claim we tackled it enough that the problem was less disastrous to the stability of the system than it would have otherwise been.

An analogous problem that I’ve faced in the past is with thread pools in both Windows and the .NET Framework. Given that work items might block in the thread pool, how do you decide the number of threads to keep active at once? There are always imperfect heuristics applied, and I would say we did no worse. If anything, we erred on the side of using more of the latent parallelism to saturate the available resources. It was pretty common to be running the Midori system at 100% CPU utilization, because it was doing useful stuff, which is pretty rare on PCs and traditional apps.

But the scale of our problem was much worse than anything I’d ever seen. Everything was asynchronous. Imagine an app traversing the entire filesystem, and performing a series of asynchronous operations for each file on disk. In Midori, the app, filesystem, disk drivers, etc., are all different asynchronous processes. It’s easy to envision the resulting fork bomb-like problem that results.

The solution here broke down into a two-pronged defense:

    Self-control: async code knows that it could flood the system with work, and explicitly tries not to.
    Automatic resource management: no matter what the user-written code does, the system can throttle automatically.

For obvious reasons, we preferred automatic resource management.

This took the form of the OS scheduler making decisions about which processes to visit, which turns to let run, and, in some cases, techniques like flow control as we saw above with streams. This is the area we had the most “open ended” and “unresolved” research. We tried out many really cool ideas. This included attempting to model the expected resource usage of asynchronous activities (similar to this paper on convex optimization). That turned out to be very difficult, but certainly shows some interesting long turn promise if you can couple it with adaptive techniques. Perhaps surprisingly, our most promising results came from adapting advertisement bidding algorithms to resource allocation. Coupled with an element of game theory, this approach gets very interesting. If the system charges a market value for all system resources, and all agents in the system have a finite amount of “purchasing power,” we can expect they will purchase those resources that benefit themselves the most based on the market prices available.

But automatic management wasn’t always perfect. That’s where self-control came in. A programmer could also help us out by capping the maximum number of outstanding activities, using simple techniques like “wide-loops.” A wide-loop was an asynchronous loop where the developer specified the maximum outstanding iterations. The system ensured it launched no more than this count at once. It always felt a little cheesy but, coupled with resource management, did the trick.

I would say we didn’t die from this one. We really thought we would die from this one. I would also say it was solved to my least satisfaction out of the bunch, however. It remains fertile ground for innovative systems research.
Winding Down

That was a lot to fit into one post. As you can see, we took “asynchronous everywhere” to quite the extreme.

In the meantime, the world has come a long way, much closer to this model than when we began. In Windows 8, a large focus was the introduction of asynchronous APIs, and, like with adding await to C#, we gave them our own lessons learned at the time. A little bit of what we were doing rubbed off, but certainly nothing to the level of what’s above.

The resulting system was automatically parallel in a very different way than the standard meaning. Tons of tiny processes and lots of asynchronous messages ensured the system kept making forward progress, even in the face of variable latency operations like networking. My favorite demo we ever gave, to Steve Ballmer, was a mock implementation of Skype on our own multimedia stack that wouldn’t hang even if you tried your hardest to force it.

As much as I’d like to keep going on architecture and programming model topics, I think I need to take a step back. Our compiler keeps coming up and, in many ways, it was our secret sauce. The techniques we used there enabled us to achieve all of these larger goals. Without that foundation, we’d never have had the safety or been on the same playing ground as native code. See you next time, when we nerd out a bit on compilers.

#### Safe native code

[source](http://joeduffyblog.com/2015/12/19/safe-native-code/)

In my first Midori post, I described how safety was the foundation of everything we did. I mentioned that we built an operating system out of safe code, and yet stayed competitive with operating systems like Windows and Linux written in C and C++. In many ways, system architecture played a key role, and I will continue discussing how in future posts. But, at the foundation, an optimizing compiler that often eeked out native code performance from otherwise “managed”, type- and memory-safe code, was one of our most important weapons. In this post, I’ll describe some key insights and techniques that were essential to our success.
Overview

When people think of C#, Java, and related languages, they usually think of Just-In-Time (JIT) compilation. Especially back in the mid-2000s when Midori began. But Midori was different, using more C++-like Ahead-Of-Time (AOT) compilation from the outset.

AOT compiling managed, garbage collected code presents some unique challenges compared to C and C++. As a result, many AOT efforts don’t achieve parity with their native counterparts. .NET’s NGEN technology is a good example of this. In fact, most efforts in .NET have exclusively targeted startup time; this is clearly a key metric, but when you’re building an operating system and everything on top, startup time just barely scratches the surface.

Over the course of 8 years, we were able to significantly narrow the gap between our version of C# and classical C/C++ systems, to the point where basic code quality, in both size of speed dimensions, was seldom the deciding factor when comparing Midori’s performance to existing workloads. In fact, something counter-intuitive happened. The ability to co-design the language, runtime, frameworks, operating system, and the compiler – making tradeoffs in one area to gain advantages in other areas – gave the compiler far more symbolic information than it ever had before about the program’s semantics and, so, I dare say, was able to exceed C and C++ performance in a non-trivial number of situations.

Before diving deep, I have to put in a reminder. The architectural decisions – like Async Everywhere and Zero-Copy IO (coming soon) – had more to do with us narrowing the gap at a “whole system” level. Especially the less GC-hungry way we wrote systems code. But the foundation of a highly optimizing compiler, that knew about and took advantage of safety, was essential to our results.

I would also be remiss if I didn’t point out that the world has made considerable inroads in this area alongside us. Go has straddled an elegant line between systems performance and safety. Rust is just plain awesome. The .NET Native and, related, Android Runtime projects have brought a nice taste of AOT to C# and Java in a more limited way, as a “silent” optimization technique to avoid mobile application lag caused by JITting. Lately, we’ve been working on bringing AOT to a broader .NET setting with the CoreRT project. Through that effort I hope we can bring some of the lessons learned below to a real-world setting. Due to the delicate balance around breaking changes it remains to be seen how far we can go. It took us years to get everything working harmoniously, measured in man-decades, however, so this transfer of knowledge will take time.

First thing’s first. Let’s quickly recap: What’s the difference between native and managed code, anyway?
What’s the same

I despise the false dichotomy “native and managed,” so I must apologize for using it. After reading this article, I hope to have convinced you that it’s a continuum. C++ is safer these days than ever before, and likewise, C# performant. It’s amusing how many of these lessons apply directly to the work my team is doing on Safe C++ these days.

So let’s begin by considering what’s the same.

All the basic dragon book topics apply to managed as much as they do native code.

In general, compiling code is a balancing act between, on one hand emitting the most efficient instruction sequences for the target architecture, to execute the program quickly; and on the other hand emitting the smallest encoding of instructions for the target architecture, to store the program compactly and effectively use the memory system on the target device. Countless knobs exist on your favorite compiler to dial between the two based on your scenario. On mobile, you probably want smaller code, whereas on a multimedia workstation, you probably want the fastest.

The choice of managed code doesn’t change any of this. You still want the same flexibility. And the techniques you’d use to achieve this in a C or C++ compiler are by and large the same as what you use for a safe language.

You need a great inliner. You want common subexpression elimination (CSE), constant propagation and folding, strength reduction, and an excellent loop optimizer. These days, you probably want to use static single assignment form (SSA), and some unique SSA optimizations like global value numbering (although you need to be careful about working set and compiler throughput when using SSA everywhere). You will need specialized machine dependent optimizers for the target architectures that are important to you, including register allocators. You’ll eventually want a global analyzer that does interprocedural optimizations, link-time code-generation to extend those interprocedural optimizations across passes, a vectorizer for modern processors (SSE, NEON, AVX, etc.), and most definitely profile guided optimizations (PGO) to inform all of the above based on real-world scenarios.

Although having a safe language can throw some interesting curveballs your way that are unique and interesting – which I’ll cover below – you’ll need all of the standard optimizing compiler things.

I hate to say it, but doing great at all of these things is “table stakes.” Back in the mid-2000s, we had to write everything by hand. Thankfully, these days you can get an awesome off-the-shelf optimizing compiler like LLVM that has most of these things already battle tested, ready to go, and ready for you to help improve.
What’s different

But, of course, there are differences. Many. This article wouldn’t be very interesting otherwise.

The differences are more about what “shapes” you can expect to be different in the code and data structures thrown at the optimizer. These shapes come in the form of different instruction sequences, logical operations in the code that wouldn’t exist in the C++ equivalent (like more bounds checking), data structure layout differences (like extra object headers or interface tables), and, in most cases, a larger quantity of supporting runtime data structures.

Objects have “more to them” in most managed languages, compared to frugal data types in, say, C. (Note that C++ data structures are not nearly as frugal as you might imagine, and are probably closer to C# than your gut tells you.) In Java, every object has a vtable pointer in its header. In C#, most do, although structs do not. The GC can impose extra layout restrictions, such as padding and a couple words to do its book-keeping. Note that none of this is really specific to managed languages – C and C++ allocators can inject their own words too, and of course, many C++ objects also carry vtables – however it’s fair to say that most C and C++ implementations tend to be more economical in these areas. In most cases, for cultural reasons more than hard technical ones. Add up a few thousand objects in a heap, especially when your system is built of many small processes with isolated heaps, like Midori, and it adds up quickly.

In Java, you’ve got a lot more virtual dispatch, because methods are virtual by default. In C#, thankfully, methods are non-virtual by default. (We even made classes sealed by default.) Too much virtual dispatch can totally screw inlining which is a critical optimization to have for small functions. In managed languages you tend to have more small functions for two reasons: 1) properties, and 2) higher level programmers tend to over-use abstraction.

Although it’s seldom described this formally, there’s an “ABI” (Application Binary Interface) that governs interactions between code and the runtime. The ABI is where the rubber meets the road. It’s where things like calling conventions, exception handling, and, most notably, the GC manifest in machine code. This is not unique to managed code! C++ has a “runtime” and therfore an ABI too. It’s just that it’s primarily composed of headers, libraries like allocators, and so on, that are more transparently linked into a program than with classical C# and Java virtual machines, where a runtime is non-negotiable (and in the JIT case, fairly heavy-handed). Thinking of it this way has been helpful to me, because the isomorphisms with C++ suddenly become immediately apparent.

The real biggie is array bounds checks. A traditional approach is to check that the index is within the bounds of an array before accessing it, either for loading or storing. That’s an extra field fetch, compare, and conditional branch. Branch prediction these days is quite good, however it’s just plain physics that if you do more work, you’re going to pay for it. Interestingly, the work we’re doing with C++’s array_view<T> incurs all these same costs.

Related to this, there can be null checks where they didn’t exist in C++. If you perform a method dispatch on a null object pointer in C++, for example, you end up running the function anyway. If that function tries to access this, it’s bound to AV, but in Java and .NET, the compiler is required (per specification) to explicitly check and throw an exception in these cases, before the call even occurs. These little branches can add up too. We eradicated such checks in favor of C++ semantics in optimized builds.

In Midori, we compiled with overflow checking on by default. This is different from stock C#, where you must explicitly pass the /checked flag for this behavior. In our experience, the number of surprising overflows that were caught, and unintended, was well worth the inconvenience and cost. But it did mean that our compiler needed to get really good at understanding how to eliminate unnecessary ones.

Static variables are very expensive in Java and .NET. Way more than you’d expect. They are mutable and so cannot be stored in the readonly segment of an image where they are shared across processes. And my goodness, the amount of lazy-initialization checking that gets injected into the resulting source code is beyond belief. Switching from preciseinit to beforefieldinit semantics in .NET helps a little bit, since the checks needn’t happen on every access to a static member – just accesses to the static variable in question – but it’s still disgusting compared to a carefully crafted C program with a mixture of constant and intentional global initialization.

The final major area is specific to .NET: structs. Although structs help to alleviate GC pressure and hence are a good thing for most programs, they also carry some subtle problems. The CLI specifies surprising behavior around their initialization, for example. Namely if an exception happens during construction, the struct slot must remain zero- initialized. The result is that most compilers make defensive copies. Another example is that the compiler must make a defensive copy anytime you call a function on a readonly struct. It’s pretty common for structs to be copied all over the place which, when you’re counting cycles, hurts, especially since it often means time spent in memcpy. We had a lot of techniques for addressing this and, funny enough, I’m pretty sure when all was said and done, our code quality here was better than C++’s, given all of its RAII, copy constructor, destructor, and so on, penalties.
Compilation Architecture

Our architecture involved three major components:

    C# Compiler: Performs lexing, parsing, and semantic analysis. Ultimately translates from C# textual source code into a CIL-based intermediate representation (IR).
    Bartok: Takes in said IR, does high-level MSIL-based analysis, transformations, and optimizations, and finally lowers this IR to something a bit closer to a more concrete machine representation. For example, generics are gone by the time Bartok is done with the IR.
    Phoenix: Takes in this lowered IR, and goes to town on it. This is where the bulk of the “pedal to the metal” optimizations happen. The output is machine code.

The similarities here with Swift’s compiler design, particularly SIL, are evident. The .NET Native project also mirrors this architecture somewhat. Frankly, most AOT compilers for high level languages do.

In most places, the compiler’s internal representation leveraged static single assignment form (SSA). SSA was preserved until very late in the compilation. This facilitated and improved the use of many of the classical compiler optimizations mentioned earlier.

The goals of this architecture included:

    Facilitate rapid prototyping and experimentation.
    Produce high-quality machine code on par with commerical C/C++ compilers.
    Support debugging optimized machine code for improved productivity.
    Facilitate profile-guided optimizations based on sampling and/or instrumenting code.
    Suitable for self-host:
        The resulting compiled compiler is fast enough.
        It is fast enough that the compiler developers enjoy using it.
        It is easy to debug problems when the compiler goes astray.

Finally, a brief warning. We tried lots of stuff. I can’t remember it all. Both Bartok and Phoenix existed for years before I even got involved in them. Bartok was a hotbed of research on managed languages – ranging from optimizations to GC to software transactional memory – and Phoenix was meant to replace the shipping Visual C++ compiler. So, anyway, there’s no way I can tell the full story. But I’ll do my best.
Optimizations

Let’s go deep on a few specific areas of classical compiler optimizations, extended to cover safe code.
Bounds check elimination

C# arrays are bounds checked. So were ours. Although it is important to eliminate superfluous bounds checks in regular C# code, it was even more so in our case, because even the lowest layers of the system used bounds checked arrays. For example, where in the bowels of the Windows or Linux kernel you’d see an int*, in Midori you’d see an int[].

To see what a bounds check looks like, consider a simple example:

var a = new int[100];
for (int i = 0; i < 100; i++) {
    ... a[i] ...;
}

Here’s is an example of the resulting machine code for the inner loop array access, with a bounds check:

; First, put the array length into EAX:
3B15: 8B 41 08        mov         eax,dword ptr [rcx+8]
; If EDX >= EAX, access is out of bounds; jump to error:
3B18: 3B D0           cmp         edx,eax
3B1A: 73 0C           jae         3B28
; Otherwise, access is OK; compute element's address, and assign:
3B1C: 48 63 C2        movsxd      rax,edx
3B1F: 8B 44 81 10     mov         dword ptr [rcx+rax*4+10h],r8d
; ...
; The error handler; just call a runtime helper that throws:
3B28: E8 03 E5 FF FF  call        2030

If you’re doing this bookkeeping on every loop iteration, you won’t get very tight loop code. And you’re certainly not going to have any hope of vectorizing it. So, we spent a lot of time and energy trying to eliminate such checks.

In the above example, it’s obvious to a human that no bounds checking is necessary. To a compiler, however, the analysis isn’t quite so simple. It needs to prove all sorts of facts about ranges. It also needs to know that a isn’t aliased and somehow modified during the loop body. It’s surprising how hard this problem quickly becomes.

Our system had multiple layers of bounds check eliminations.

First it’s important to note that CIL severely constraints an optimizer by being precise in certain areas. For example, accessing an array out of bounds throws an IndexOutOfRangeException, similar to Java’s ArrayOutOfBoundsException. And the CIL specifies that it shall do so at precisely the exception that threw it. As we will see later on, our error model was more relaxed. It was based fail-fast and permitted code motion that led to inevitable failures happening “sooner” than they would have otherwise. Without this, our hands would have been tied for much of what I’m about to discuss.

At the highest level, in Bartok, the IR is still relatively close to the program input. So, some simple patterns could be matched and eliminated. Before lowering further, the ABCD algorithm – a straightforward value range analysis based on SSA – then ran to eliminate even more common patterns using a more principled approach than pattern matching. We were also able to leverage ABCD in the global analysis phase too, thanks to inter-procedural length and control flow fact propagation.

Next up, the Phoenix Loop Optimizer got its hands on things. This layer did all sorts of loop optimizations and, most relevant to this section, range analysis. For example:

    Loop materialization: this analysis actually creates loops. It recognizes repeated patterns of code that would be more ideally represented as loops, and, when profitable, rewrites them as such. This includes unrolling hand-rolled loops so that a vectorizer can get its hands on them, even if they might be re-unrolled later on.
    Loop cloning, unrolling, and versioning: this analysis creates copies of loops for purposes of specialization. That includes loop unrolling, creating architectural-specific versions of a vectorized loop, and so on.
    Induction range optimization: this is the phase we are most concerned with in this section. It uses induction range analysis to remove unnecessary checks, in addition to doing classical induction variable optimizations such as widening. As a byproduct of this phase, bounds checks were eliminated and coalesced by hoisting them outside of loops.

This sort of principled analysis was more capable than what was shown earlier. For example, there are ways to write the earlier loop that can easily “trick” the more basic techniques discussed earlier:

var a = new int[100];

// Trick #1: use the length instead of constant.
for (int i = 0; i < a.length; i++) {
    a[i] = i;
}

// Trick #2: start counting at 1.
for (int i = 1; i <= a.length; i++) {
    a[i-1] = i-1;
}

// Trick #3: count backwards.
for (int i = a.length - 1; i >= 0; i--) {
    a[i] = i;
}

// Trick #4: don't use a for loop at all.
int i = 0;
next:
if (i < a.length) {
    a[i] = i;
    i++;
    goto next;
}

You get the point. Clearly at some point you can screw the optimizer’s ability to do anything, especially if you start doing virtual dispatch inside the loop body, where aliasing information is lost. And obviously, things get more difficult when the array length isn’t known statically, as in the above example of 100. All is not lost, however, if you can prove relationships between the loop bounds and the array. Much of this analysis requires special knowledge of the fact that array lengths in C# are immutable.

At the end of the day, doing a good job at optimizing here is the difference between this:

; Initialize induction variable to 0:
3D45: 33 C0           xor         eax,eax
; Put bounds into EDX:
3D58: 8B 51 08        mov         edx,dword ptr [rcx+8]
; Check that EAX is still within bounds; jump if not:
3D5B: 3B C2           cmp         eax,edx
3D5D: 73 13           jae         3D72
; Compute the element address and store into it:
3D5F: 48 63 D0        movsxd      rdx,eax
3D62: 89 44 91 10     mov         dword ptr [rcx+rdx*4+10h],eax
; Increment the loop induction variable:
3D66: FF C0           inc         eax
; If still < 100, then jump back to the loop beginning:
3D68: 83 F8 64        cmp         eax,64h
3D6B: 7C EB           jl          3D58
; ...
; Error routine:
3D72: E8 B9 E2 FF FF  call        2030

And the following, completely optimized, bounds check free, loop:

; Initialize induction variable to 0:
3D95: 33 C0           xor         eax,eax
; Compute the element address and store into it:
3D97: 48 63 D0        movsxd      rdx,eax
3D9A: 89 04 91        mov         dword ptr [rcx+rdx*4],eax
; Increment the loop induction variable:
3D9D: FF C0           inc         eax
; If still < 100, then jump back to the loop beginning:
3D9F: 83 F8 64        cmp         eax,64h
3DA2: 7C F3           jl          3D97

It’s amusing that I’m now suffering deja vu as we go through this same exercise with C++’s new array_view<T> type. Sometimes I joke with my ex-Midori colleagues that we’re destined to repeat ourselves, slowly and patiently, over the course of the next 10 years. I know that sounds arrogant. But I have this feeling on almost a daily basis.
Overflow checking

As mentioned earlier, in Midori we compiled with checked arithmetic by default (by way of C#’s /checked flag). This eliminated classes of errors where developers didn’t anticipate, and therefore code correctly for, overflows. Of course, we kept the explicit checked and unchecked scoping constructs, to override the defaults when appropriate, but this was preferable because a programmer declared her intent.

Anyway, as you might expect, this can reduce code quality too.

For comparison, imagine we’re adding two variables:

int x = ...;
int y = ...;
int z = x + y;

Now imagine x is in ECX and y is in EDX. Here is a standard unchecked add operation:

03 C2              add         ecx,edx

Or, if you want to get fancy, one that uses the LEA instruction to also store the result in the EAX register using a single instruction, as many modern compilers might do:

8D 04 11           lea         eax,[rcx+rdx]

Well, here’s the equivalent code with a bounds check inserted into it:

3A65: 8B C1              mov         eax,ecx
3A67: 03 C2              add         eax,edx
3A69: 70 05              jo          3A70
; ...
3A70: E8 B3 E5 FF FF     call        2028

More of those damn conditional jumps (JO) with error handling routines (CALL 2028).

It turns out a lot of the analysis mentioned earlier that goes into proving bounds checks redundant also apply to proving that overflow checks are redundant. It’s all about proving facts about ranges. For example, if you can prove that some check is dominated by some earlier check, and that furthermore that earlier check is a superset of the later check, then the later check is unnecessary. If the opposite is true – that is, the earlier check is a subset of the later check, then if the subsequent block postdominates the earlier one, you might move the stronger check to earlier in the program.

Another common pattern is that the same, or similar, arithmetic operation happens multiple times near one another:

int p = r * 32 + 64;
int q = r * 32 + 64 - 16;

It is obvious that, if the p assignment didn’t overflow, then the q one won’t either.

There’s another magical phenomenon that happens in real world code a lot. It’s common to have bounds checks and arithmetic checks in the same neighborhood. Imagine some code that reads a bunch of values from an array:

int data0 = data[dataOffset + (DATA_SIZE * 0)];
int data1 = data[dataOffset + (DATA_SIZE * 1)];
int data2 = data[dataOffset + (DATA_SIZE * 2)];
int data3 = data[dataOffset + (DATA_SIZE * 3)];
.. and so on ...

Well C# arrays cannot have negative bounds. If a compiler knows that DATA_SIZE is sufficiently small that an overflowed computation won’t wrap around past 0, then it can eliminate the range check in favor of the bounds check.

There are many other patterns and special cases you can cover. But the above demonstrates the power of a really good range optimizer that is integrated with loops optimization. It can cover a wide array of scenarios, array bounds and arithmetic operations included. It takes a lot of work, but it’s worth it in the end.
Inlining

For the most part, inlining is the same as with true native code. And just as important. Often more important, due to C# developers’ tendency to write lots of little methods (like property accessors). Because of many of the topics throughout this article, getting small code can be more difficult than in C++ – more branches, more checks, etc. – and so, in practice, most managed code compilers inline a lot less than native code compilers, or at least need to be tuned very differently. This can actually make or break performance.

There are also areas of habitual bloat. The way lambdas are encoded in MSIL is unintelligable to a naive backend compiler, unless it reverse engineers that fact. For example, we had an optimization that took this code:

void A(Action a) {
    a();
}

void B() {
    int x = 42;
    A(() => x++);
    ...
}

and, after inlining, was able to turn B into just:

void B() {
    int x = 43;
    ...
}

That Action argument to A is a lambda and, if you know how the C# compiler encodes lambdas in MSIL, you’ll appreciate how difficult this trick was. For example, here is the code for B:

.method private hidebysig instance void
    B() cil managed
{
    // Code size       36 (0x24)
    .maxstack  3
    .locals init (class P/'<>c__DisplayClass1' V_0)
    IL_0000:  newobj     instance void P/'<>c__DisplayClass1'::.ctor()
    IL_0005:  stloc.0
    IL_0006:  nop
    IL_0007:  ldloc.0
    IL_0008:  ldc.i4.s   42
    IL_000a:  stfld      int32 P/'<>c__DisplayClass1'::x
    IL_000f:  ldarg.0
    IL_0010:  ldloc.0
    IL_0011:  ldftn      instance void P/'<>c__DisplayClass1'::'<B>b__0'()
    IL_0017:  newobj     instance void [mscorlib]System.Action::.ctor(object,
                                                                  native int)
    IL_001c:  call       instance void P::A(class [mscorlib]System.Action)
    IL_0021:  nop
    IL_0022:  nop
    IL_0023:  ret
}

To get the magic result required constant propagating the ldftn, recognizing how delegate construction works (IL_0017), leveraging that information to inline B and eliminate the lambda/delegate altogether, and then, again mostly through constant propagation, folding the arithmetic into the constant 42 initialization of x. I always found it elegant that this “fell out” of a natural composition of multiple optimizations with separate concerns.

As with native code, profile guided optimization made our inlining decisions far more effective.
Structs

CLI structs are almost just like C structs. Except they’re not. The CLI imposes some semantics that incur overheads. These overheads almost always manifest as excessive copying. Even worse, these copies are usually hidden from your program. It’s worth noting, because of copy constructors and destructors, C++ also has some real issues here, often even worse than what I’m about to describe.

Perhaps the most annoying is that initializing a struct the CLI way requires a defensive copy. For example, consider this program, where the initialzer for S throws an exception:

class Program {
    static void Main() {
        S s = new S();
        try {
            s = new S(42);
        }
        catch {
            System.Console.WriteLine(s.value);
        }
    }
}

struct S {
    public int value;
    public S(int value) {
        this.value = value;
        throw new System.Exception("Boom");
    }
}

The program behavior here has to be that the value 0 is written to the console. In practice, that means that the assignment operation s = new S(42) must first create a new S-typed slot on the stack, construct it, and then and only then copy the value back over the s variable. For single-int structs like this one, that’s not a huge deal. For large structs, that means resorting to memcpy. In Midori, we knew what methods could throw, and which could not, thanks to our error model (more later), which meant we could avoid this overhead in nearly all cases.

Another annoying one is the following:

struct S {
    // ...
    public int Value { get { return this.value; } }
}

static readonly S s = new S();

Every single time we read from s.Value:

int x = s.Value;

we are going to get a local copy. This one’s actually visible in the MSIL. This is without readonly:

ldsflda    valuetype S Program::s
call       instance int32 S::get_Value()

And this is with it:

ldsfld     valuetype S Program::s
stloc.0
ldloca.s   V_0
call       instance int32 S::get_Value()

Notice that the compiler elected to use ldsfld followed by lodloca.s, rather than loading the address directly, by way of ldsflda in the first example. The resulting machine code is even nastier. I also can’t pass the struct around by-reference which, as I mention later on, requires copying it and again can be problematic.

We solved this in Midori because our compiler knew about methods that didn’t mutate members. All statics were immutable to begin with, so the above s wouldn’t need defensive copies. Alternatively, or in addition to this, the struct could have beem declared as immutable, as follows:

immutable struct S {
    // As above ...
}

Or because all static values were immutable anyway. Alternatively, the properties or methods in question could have been annotated as readable meaning that they couldn’t trigger mutations and hence didn’t require defensive copies.

I mentioned by-reference passing. In C++, developers know to pass large structures by-reference, either using * or &, to avoid excessive copying. We got in the habit of doing the same. For example, we had in parameters, as so:

void M(in ReallyBigStruct s) {
    // Read, but don't assign to, s ...
}

I’ll admit we probably took this to an extreme, to the point where our APIs suffered. If I could do it all over again, I’d go back and eliminate the fundamental distinction between class and struct in C#. It turns out, pointers aren’t that bad after all, and for systems code you really do want to deeply understand the distinction between “near” (value) and “far” (pointer). We did implement what amounted to C++ references in C#, which helped, but not enough. More on this in my upcoming deep dive on our programming language.
Code size

We pushed hard on code size. Even more than some C++ compilers I know.

A generic instantiation is just a fancy copy-and-paste of code with some substitutions. Quite simply, that means an explosion of code for the compiler to process, compared to what the developer actually wrote. I’ve covered many of the performance challenges with generics in the past. A major problem there is the transitive closure problem. .NET’s straightforward-looking List<T> class actually creates 28 types in its transitive closure! And that’s not even speaking to all the methods in each type. Generics are a quick way to explode code size.

I never forgot the day I refactored our LINQ implementation. Unlike in .NET, which uses extension methods, we made all LINQ operations instance methods on the base-most class in our collection type hierarchy. That meant 100-ish nested classes, one for each LINQ operation, for every single collection instantiated! Refactoring this was an easy way for me to save over 100MB of code size across the entire Midori “workstation” operating system image. Yes, 100MB!

We learned to be more thoughtful about our use of generics. For example, types nested inside an outer generic are usually not good ideas. We also aggressively shared generic instantiations, even more than what the CLR does. Namely, we shared value type generics, where the GC pointers were at the same locations. So, for example, given a struct S:

struct S {
    int Field;
}

we would share the same code representation of List<int> with List<S>. And, similarly, given:

struct S {
    object A;
    int B;
    object C;
}

struct T {
    object D;
    int E;
    object F;
}

we would share instantiations between List<S> and List<T>.

You might not realize this, but C# emits IL that ensures structs have sequential layout:

.class private sequential ansi sealed beforefieldinit S
    extends [mscorlib]System.ValueType
{
    ...
}

As a result, we couldn’t share List<S> and List<T> with some hypothetical List<U>:

struct U {
    int G;
    object H;
    object I;
}

For this, among other reasons – like giving the compiler more flexibility around packing, cache alignment, and so on – we made structs auto by default in our language. Really, sequential only matters if you’re doing unsafe code, which, in our programming model, wasn’t even legal.

We did not support reflection in Midori. In principle, we had plans to do it eventually, as a purely opt-in feature. In practice, we never needed it. What we found is that code generation was always a more suitable solution. We shaved off at least 30% of the best case C# image size by doing this. Significantly more if you factor in systems where the full MSIL is retained, as is usually the case, even for NGen and .NET AOT solutions.

In fact, we removed significant pieces of System.Type too. No Assembly, no BaseType, and yes, even no FullName. The .NET Framework’s mscorlib.dll contains about 100KB of just type names. Sure, names are useful, but our eventing framework leveraged code generation to produce just those you actually needed to be around at runtime.

At some point, we realized 40% of our image sizes were vtables. We kept pounding on this one relentlessly, and, after all of that, we still had plenty of headroom for improvements.

Each vtable consumes image space to hold pointers to the virtual functions used in dispatch, and of course has a runtime representation. Each object with a vtable also has a vtable pointer embedded within it. So, if you care about size (both image and runtime), you are going to care about vtables.

In C++, you only get a vtable if your type is polymorphic. In languages like C# and Java, on the other hand, you get a vtable even if you don’t want, need, or use it. In C#, at least, you can use a struct type to elide them. I actually love this aspect of Go, where you get a virtual dispatch- like thing, via interfaces, without needing to pay for vtables on every type; you only pay for what you use, at the point of coercing something to an interface.

Another vtable problem in C# is that all objects inherit three virtuals from System.Object: Equals, GetHashCode, and ToString. Besides the point that these generally don’t do the right thing in the right way anyways – Equals requires reflection to work on value types, GetHashCode is nondeterministic and stamps the object header (or sync- block; more on that later), and ToString doesn’t offer formatting and localization controls – they also bloat every vtable by three slots. This may not sound like much, but it’s certainly more than C++ which has no such overhead.

The main source of our remaining woes here was the assumption in C#, and frankly most OOP languages like C++ and Java, that RTTI is always available for downcasts. This was particularly painful with generics, for all of the above reasons. Although we aggressively shared instantiations, we could never quite fully fold together the type structures for these guys, even though disparate instantiations tended to be identical, or at least extraordinarily similar. If I could do it all over agan, I’d banish RTTI. In 90% of the cases, type discriminated unions or pattern matching are more appropriate solutions anyway.
Profile guided optimizations (PGO)

I’ve mentioned profile guided optimization (PGO) already. This was a critical element to “go that last mile” after mostly everything else in this article had been made competitive. This gave our browser program boosts in the neighborhood of 30-40% on benchmarks like SunSpider and Octane.

Most of what went into PGO was similar to classical native profilers, with two big differences.

First, we tought PGO about many of the unique optimizations listed throughout this article, such as asynchronous stack probing, generics instantiations, lambdas, and more. As with many things, we could have gone on forever here.

Second, we experimented with sample profiling, in addition to the ordinary instrumented profiling. This is much nicer from a developer perspective – they don’t need two builds – and also lets you collect counts from real, live running systems in the data center. A good example of what’s possible is outlined in this Google-Wide Profiling (GWP) paper.
System Architecture

The basics described above were all important. But a number of even more impactful areas required deeper architectural co-design and co-evolution with the language, runtime, framework, and operating system itself. I’ve written about the immense benefits of this sort of “whole system” approach before. It was kind of magical.
GC

Midori was garbage collected through-and-through. This was a key element of our overall model’s safety and productivity. In fact, at one point, we had 11 distinct collectors, each with its own unique characteristics. (For instance, see this study.) We had some ways to combat the usual problems, like long pause times. I’ll go through those in a future post, however. For now, let’s stick to the realm of code quality.

The first top-level decision is: conservative or precise? A conservative collector is easier to wedge into an existing system, however it can cause troubles in certain areas. It often needs to scan more of the heap to get the same job done. And it can falsely keep objects alive. We felt both were unacceptable for a systems programming environment. It was an easy, quick decision: we sought precision.

Precision costs you something in the code generators, however. A precise collector needs to get instructions where to find its root set. That root set includes field offsets in data structures in the heap, and also places on the stack or, even in some cases, registers. It needs to find these so that it doesn’t miss an object and erroneously collect it or fail to adjust a pointer during a relocation, both of which would lead to memory safety problems. There was no magic trick to making this efficient other than close integration between runtime and code generator, and being thoughtful.

This brings up the topic of cooperative versus preemptive, and the notion of GC safe-points. A GC operating in cooperative mode will only collect when threads have reached so-called “safe-points.” A GC operating in preemptive mode, on the other hand, is free to stop threads in their tracks, through preemption and thread suspension, so that it may force a collection. In general, preemptive requires more bookkeeping, because the roots must be identifiable at more places, including things that have spilled into registers. It also makes certain low-level code difficult to write, of the ilk you’ll probably find in an operating system’s kernel, because objects are subject to movement between arbitrary instructions. It’s difficult to reason about. (See this file, and its associated uses in the CLR codebase, if you don’t believe me.) As a result, we used cooperative mode as our default. We experimented with automatic safe-point probes inserted by the compiler, for example on loop back-edges, but opted to bank the code quality instead. It did mean GC “livelock” was possible, but in practice we seldom ran into this.

We used a generational collector. This has the advantage of reducing pause times because less of the heap needs to be inspected upon a given collection. It does come with one disadvantage from the code generator’s perspective, which is the need to insert write barriers into the code. If an older generation object ever points back at a younger generation object, then the collector – which would have normally preferred to limit its scope to younger generations – must know to look at the older ones too. Otherwise, it might miss something.

Write barriers show up as extra instructions after certain writes; e.g., note the call:

48 8D 49 08        lea         rcx,[rcx+8]
E8 7A E5 FF FF     call        0000064488002028

That barrier simply updates an entry in the card table, so the GC knows to look at that segment the next time it scans the heap. Most of the time this ends up as inlined assembly code, however it depends on the particulars of the situation. See this code for an example of what this looks like for the CLR on x64.

It’s difficult for the compiler to optimize these away because the need for write barriers is “temporal” in nature. We did aggressively eliminate them for stack allocated objects, however. And it’s possible to write, or transform code, into less barrier hungry styles. For example, consider two ways of writing the same API:

bool Test(out object o);
object Test(out bool b);

In the resulting Test method body, you will find a write barrier in the former, but not the latter. Why? Because the former is writing a heap object reference (of type object), and the compiler has no idea, when analyzing this method in isolation, whether that write is to another heap object. It must be conservative in its analysis and assume the worst. The latter, of course, has no such problem, because a bool isn’t something the GC needs to scan.

Another aspect of GC that impacts code quality is the optional presence of more heavyweight concurrent read and write barriers, when using concurrent collection. A concurrent GC does some collection activities concurrent with the user program making forward progress. This is often a good use of multicore processors and it can reduce pause times and help user code make more forward progress over a given period of time.

There are many challenges with building a concurrent GC, however one is that the cost of the resulting barriers is high. The original concurrent GC by Henry Baker was a copying GC and had the notion of “old” versus “new” space. All reads and writes had to be checked and, anything operation against the old space had to be forwarded to the new space. Subsequent research for the DEC Firefly used hardware memory protection to reduce the cost, but the faulting cases were still exceedingly expensive. And, worst of all, access times to the heap were unpredictable. There has been a lot of good research into solving this problem, however we abandoned copying.

Instead, we used a concurrent mark-sweep compacting collector. This means only write barriers are needed under normal program execution, however some code was cloned so that read barriers were present when programs ran in the presence of object movement. Our primary GC guy’s research was published, so you can read all about it. The CLR also has a concurrent collector, but it’s not quite as good. It uses copying to collect the youngest generation, mark-sweep for the older ones, and the mark phase is parallelized. There are unfortunately a few conditions that can lead to sequential pauses (think of this like a big “lock”), sometimes over 10 milliseconds: 1) all threads must be halted and scanned, an operation that is bounded only by the number of threads and the size of their stacks; 2) copying the youngest generation is bounded only by the size of that generation (thankfully, in normal configurations, this is small); and 3) under worst case conditions, compaction and defragmentation, even of the oldest generation, can happen.
Separate compilation

The basic model to start with is static linking. In this model, you compile everything into a single executable. The benefits of this are obvious: it’s simple, easy to comprehend, conceptually straightforward to service, and less work for the entire compiler toolchain. Honestly, given the move to Docker containers as the unit of servicing, this model makes more and more sense by the day. But at some point, for an entire operating system, you’ll want separate compilation. Not just because compile times can get quite long when statically linking an entire operating system, but also because the working set and footprint of the resulting processes will be bloated with significant duplication.

Separately compiling object oriented APIs is hard. To be honest, few people have actually gotten it to work. Problems include the fragile base class problem, which is a real killer for version resilient libraries. As a result, most real systems use a dumbed down “C ABI” at the boundary between components. This is why Windows, for example, has historically used flat C Win32 APIs and, even in the shift to more object orientation via WinRT, uses COM underneath it all. At some runtime expense, the ObjectiveC runtime addressed this challenge. As with most things in computer science, virtually all problems can be solved with an extra level of indirection; this one can be too.

The design pivot we took in Midori was that whole processes were sealed. There was no dynamic loading, so nothing that looked like classical DLLs or SOs. For those scenarios, we used the Asynchronous Everything programming model, which made it easy to dynamically connect to and use separately compiled and versioned processes.

We did, however, want separately compiled binaries, purely as a developer productivity and code sharing (working set) play. Well, I lied. What we ended up with was incrementally compiled binaries, where a change in a root node triggered a cascading recompilation of its dependencies. But for leaf nodes, such as applications, life was beautiful. Over time, we got smarter in the toolchain by understanding precisely which sorts of changes could trigger cascading invalidation of images. A function that was known to never have been inlined across modules, for example, could have its implementation – but not its signature – changed, without needing to trigger a rebuild. This is similar to the distinction between headers and objects in a classical C/C++ compilation model.

Our compilation model was very similar to C++’s, in that there was static and dynamic linking. The runtime model, of course, was quite different. We also had the notion of “library groups,” which let us cluster multiple logically distinct, but related, libraries into a single physical binary. This let us do more aggressive inter-module optimizations like inlining, devirtualization, async stack optimizations, and more.
Parametric polymorphism (a.k.a., generics)

That brings me to generics. They throw a wrench into everything.

The problem is, unless you implement an erasure model – which utterly stinks performance-wise due to boxing allocations, indirections, or both – there’s no way for you to possibly pre-instantiate all possible versions of the code ahead-of-time. For example, say you’re providing a List<T>. How do you know whether folks using your library will want a List<int>, List<string>, or List<SomeStructYouveNeverHeardOf>?

Solutions abound:

    Do not specialize. Erase everything.
    Specialize only a subset of instantiations, and create an erased instantiation for the rest.
    Specialize everything. This gives the best performance, but at some complexity.

Java uses #1 (in fact, erasure is baked into the language). Many ML compilers use #2. .NET’s NGen compilation model is sort of a variant of #2, where things that can be trivially specialized are specialized, and everything else is JIT compiled. .NET Native doesn’t yet have a solution to this problem, which means 3rd party libraries, separate compilation, and generics are a very big TBD. As with everything in Midori, we picked the hardest path, with the most upside, which meant #3. Actually I’m being a little glib; we had several ML compiler legends on the team, and #2 is fraught with peril; just dig a little into some papers on how hard (and clever) this can get. It’s difficult to know a priori which instantiations are going to be performance critical to a program. My own experience trying to get C# code into the heart of Windows back in the Longhorn days also reinforced this; we didn’t want JIT’ting and the rules for what generics you could and couldn’t use in that world were so mind boggling they eventually led to greek formulas.

Anyway, Midori’s approach turned out to be harder than it sounded at first.

Imagine you have a diamond. Library A exports a List<T> type, and libraries B and C both instantiate List<int>. A program D then consumes both B and C and maybe even passes List<T> objects returned from one to the other. How do we ensure that the versions of List<int> are compatible?

We called this problem the potentially multiply instantiated, or PMI for short, problem.

The CLR handles this problem by unifying the instantiations at runtime. All RTTI data structures, vtables, and whatnot, are built and/or aggressively patched at runtime. In Midori, on the other hand, we wanted all such data structures to be in readonly data segments and hence shareable across processes, wherever possible.

Again, everything can be solved with an indirection. But unlike solution #2 above, solution #3 permits you to stick indirections only in the rare places where you need them. And for purposes of this one, that meant RTTI and accessing static variables of just those generic types that might have been subject to PMI. First, that affected a vast subset of code (versus #2 which generally affects even loading of instance fields). Second, it could be optimized away for instantiations that were known not to be PMI, by attaching state and operations to the existing generic dictionary that was gets passed around as a hidden argument already. And finally, because of all of this, it was pay for play.

But damn was it complex.

It’s funny, but C++ RTTI for template instantiations actually suffers from many of the same problems. In fact, the Microsoft Visual C++ compiler resorts to a strcmp of the type names, to resolve diamond issues! (Thankfully there are well-known, more efficient ways to do this, which we are actively pursuing for the next release of VC++.)
Virtual dispatch

Although I felt differently when first switching from Java to C#, Midori made me love that C# made methods non-virtual by default. I’m sure we would have had to change this otherwise. In fact, we went even further and made classes sealed by default, requiring that you explicitly mark them virtual if you wanted to facilitate subclasses.

Aggressive devirtualization, however, was key to good performance. Each virtual means an indirection. And more impactfully, a lost opportunity to inline (which for small functions is essential). We of course did global intra-module analysis to devirtualize, but also extended this across modules, using whole program compilation, when multiple binaries were grouped together into a library group.

Although our defaults were right, my experience with C# developers is that they go a little hog-wild with virtuals and overly abstract code. I think the ecosystem of APIs that exploded around highly polymorphic abstractions, like LINQ and Reactive Extensions, encouraged this and instilled a bit of bad behavior (“gratuitous over-abstraction”). I guess you could make similar arguments about highly templated code in C++. As you can guess, there wasn’t very much of it in the lowest levels of our codebase – where every allocation and instruction mattered – but in higher level code, especially in applications that tended to be dominated by high-latency asynchronous operations, the overheads were acceptable and productivity benefits high. A strong culture around identifying and trimming excessive fat helped to ensure features like this were used appropriately, via code reviews, benchmarks, and aggressive static analysis checking.

Interfaces were a challenge.

There are just some poorly designed, inefficient patterns in the .NET Framework. IEnumerator<T> requires two interface dispatches simply to extract the next item! Compare that to C++ iterators which can compile down a pointer increment plus dereference. Many of these problems could be addressed simply with better library designs. (Our final design for enumeration didn’t even involve interfaces at all.)

Plus invoking a C# interface is tricky. Existing systems do not use pointer adjustment like C++ does so usually an interface dispatch requires a table search. First a level of indirection to get to the vtable, then another level to find the interface table for the interface in question. Some systems attempt to do callsite caching for monomorphic invocations; that is, caching the latest invocation in the hope that the same object kind passes through that callsite time and time again. This requires mutable stubs, however, not to mention an incredibly complex system of thunks and whatnot. In Midori, we never ever ever violated W^X; and we avoided mutable runtime data structures, because they inhibit sharing, both in terms of working set, but also amortizing TLB and data cache pressure.

Our solution took advantage of the memory ordering model earlier. We used so-called “fat” interface pointers. A fat interface pointer was two words: the first, a pointer to the object itself; the second, a pointer to the interface vtable for that object. This made conversion to interfaces slightly slower – because the interface vtable lookup had to happen – but for cases where you are invoking it one or more times, it came out a wash or ahead. Usually, significantly. Go does something like this, but it’s slightly different for two reasons. First, they generate the interface tables on the fly, because interfaces are duck typed. Second, fat interface pointers are subject to tearing and hence can violate memory safety in Go, unlike Midori thanks to our strong concurrency model.

The finally challenge in this category was generic virtual methods, or GVMs. To cut to the chase, we banned them. Even if you NGen an image in .NET, all it takes is a call to the LINQ query a.Where(...).Select(...), and you’re pulling in the JIT compiler. Even in .NET Native, there is considerable runtime data structure creation, lazily, when this happens. In short, there is no known way to AOT compile GVMs in a way that is efficient at runtime. So, we didn’t even bother offering them. This was a slightly annoying limitation on the programming model but I’d have done it all over again thanks to the efficiencies that it bought us. It really is surprising how many GVMs are lurking in .NET.
Statics

I was astonished the day I learned that 10% of our code size was spent on static initialization checks.

Many people probably don’t realize that the CLI specification offers two static initialization modes. There is the default mode and beforefieldinit. The default mode is the same as Java’s. And it’s horrible. The static initializer will be run just prior to accessing any static field on that type, any static method on that type, any instance or virtual method on that type (if it’s a value type), or any constructor on that type. The “when” part doesn’t matter as much as what it takes to make this happen; all of those places now need to be guarded with explicit lazy initialization checks in the resulting machine code!

The beforefieldinit relaxation is weaker. It guarantees the initializer will run sometime before actually accessing a static field on that type. This gives the compiler a lot of leeway in deciding on this placement. Thankfully the C# compiler will pick beforefieldinit automatically for you should you stick to using field initializers only. Most people don’t realize the incredible cost of choosing instead to use a static constructor, however, especially for value types where suddenly all method calls now incur initialization guards. It’s just the difference between:

struct S {
    static int Field = 42;
}

and:

struct S {
    static int Field;
    static S() {
        Field = 42;
    }
}

Now imagine the struct has a property:

struct S {
    // As above...
    int InstanceField;
    public int Property { get { return InstanceField; } }
}

Here’s the machine code for Property if S has no static initializer, or uses beforefieldinit (automatically injected by C# in the the field initializer example above):

; The struct is one word; move its value into EAX, and return it:
8B C2                mov         eax,edx
C3                   ret

And here’s what happens if you add a class constructor:

; Big enough to get a frame:
56                   push        rsi
48 83 EC 20          sub         rsp,20h
; Load the field into ESI:
8B F2                mov         esi,edx
; Load up the cctor's initialization state:
48 8D 0D 02 D6 FF FF lea         rcx,[1560h]
48 8B 09             mov         rcx,qword ptr [rcx]
BA 03 00 00 00       mov         edx,3
; Invoke the conditional initialization helper:
E8 DD E0 FF FF       call        2048
; Move the field from ESI into EAX, and return it:
8B C6                mov         eax,esi
48 83 C4 20          add         rsp,20h
5E                   pop         rsi

On every property access!

Of course, all static members still incur these checks, even if beforefieldinit is applied.

Although C++ doesn’t suffer this same problem, it does have mind-bending initialization ordering semantics. And, like C# statics, C++11 introduced thread-safe initialization, by way of the “magic statics” feature.

We virtually eliminated this entire mess in Midori.

I mentioned offhandedly earlier that Midori had no mutable statics. More accurately, we extended the notion of const to cover any kind of object. This meant that static values were evaluated at compile-time, written to the readonly segment of the resulting binary image, and shared across all processes. More importantly for code quality, all runtime initialization checks were removed, and all static accesses simply replaced with a constant address.

There were still mutable statics at the core of the system – in the kernel, for example – but these did not make their way up into user code. And because they were few and far between, we did not rely on the classical C#-style lazy initialization checks for them. They were manually initialized on system startup.

As I said earlier, a 10% reduction in code size, and lots of speed improvements. It’s hard to know exactly how much saved this was than a standard C# program because by the time we made the change, developers were well aware of the problems and liberally applied our [BeforeFieldInit] attribute all over their types, to avoid some of the overheads. So the 10% number is actually a lower bound on the savings we realized throughout this journey.
Async model

I already wrote a lot about our async model. I won’t rehash all of that here. I will reiterate one point: the compiler was key to making linked stacks work.

In a linked stacks model, the compiler needs to insert probes into the code that check for available stack space. In the event there isn’t enough to perform some operation – make a function call, dynamically allocate on the stack, etc. – the compiler needs to arrange for a new link to get appended, and to switch to it. Mostly this amounts to some range checking, a conditional call to a runtime function, and patching up RSP. A probe looked something like:

; Check amount of stack space:
    lea     rax, [rsp-250h]
    cmp     rax, qword ptr gs:[0]
    ja      prolog
; If insufficient stack, link a new segment:
    mov     eax, 10029h
    call    ?g_LinkNewStackTrampoline
prolog:
; The real code goes here...

Needless to say, you want to probe as little as possible, for two reasons. First, they incur runtime expense. Second, they chew up code size. There are a few techniques we used to eliminate probes.

The compiler of course knew how to compute stack usage of functions. As a result, it could be smart about the amount of memory to probe for. We incorporated this knowledge into our global analyzer. We could coalesce checks after doing code motion and inlining. We hoisted checks out of loops. For the most part, we optimized for eliminating checks, sometimes at the expense of using a little more stack.

The most effective technique we used to eliminate probes was to run synchronous code on a classical stack, and to teach our compiler to elide probes altogether for them. This took advantage of our understanding of async in the type system. Switching between the classical stack and back again again amounted to twiddling RSP:

; Switch to the classical stack:
move    rsp, qword ptr gs:[10h]
sub     rsp, 20h

; Do some work (like interop w/ native C/C++ code)...

; Now switch back:
lea     rsp, [rbp-50h]

I know Go abandoned linked stacks because of these switches. At first they were pretty bad for us, however after about a man year or two of effort, the switching time faded away into the sub-0.5% noise.
Memory ordering model

Midori’s stance on safe concurrency had truly one amazing benefit: you get a sequentially consistent memory ordering model for free. You may wish to read that again. Free!

Why is this so? First, Midori’s process model ensured single-threaded execution by default. Second, any fine-grained parallelism inside of a process was governed by a finite number of APIs, all of which were race-free. The lack of races meant we could inject a fence at fork and join points, selectively, without a developer needing to care or know.

Obviously this had incredible benefits to developer productivity. The fact that Midori programmers never got bitten by memory reordering problems was certainly one of my proudest outcomes of the project.

But it also meant the compiler was free to make more aggressive code motion optimizations, without any sacrifices to this highly productive programming model. In other words, we got the best of both worlds.

A select few kernel developers had to think about the memory ordering model of the underlying machine. These were the people implementing the async model itself. For that, we eliminated C#’s notion of volatile – which is utterly broken anyway – in favor of something more like C++ atomics. That model is quite nice for two reasons. First, what kind of fence you need is explicit for every read and write, where it actually matters. (ences affect the uses of a variable, not its declaration. Second, the explicit model tells the compiler more information about what optimizations can or cannot take place, again at a specific uses, where it matters most.
Error model

Our error model journey was a long one and will be the topic of a future post. In a nutshell, however, we experimented with two ends of the spectrum – exceptions and return codes – and lots of points in betweeen.

Here is what we found from a code quality perspective.

Return codes are nice because the type system tells you an error can happen. A developer is thus forced to deal with them (provided they don’t ignore return values). Return codes are also simple, and require far less “runtime magic” than exceptions or related mechanisms like setjmp/longjmp. So, lots to like here.

From a code quality persective, however, return codes suck. They force you to execute instructions in hot paths that wouldn’t have otherwise been executed, including when errors aren’t even happening. You need to return a value from your function – occupying register and/or stack space – and callers need to perform branches to check the results. Granted, we hope that these are predicted correctly, but the reality is, you’re just doing more work.

Untyped exceptions suck when you’re trying to build a reliable system. Operating systems need to be reliable. Not knowing that there’s a hidden control flow path when you’re calling a function is, quite simply, unacceptable. They also require heavier weight runtime support to unwind stacks, search for handlers, and so on. It’s also a real pain in the arse to model exceptional control flow in the compiler. (If you don’t believe me, just read through this mail exchange). So, lots to hate here.

Typed exceptions – I got used to not saying checked exceptions for fear of hitting Java nerves – address some of these shortcomings, but come with their own challenges. Again, I’ll save detailed analysis for my future post.

From a code quality perspective, exceptions can be nice. First, you can organize code segments so that the “cold” handlers aren’t dirtying your ICACHE on successful pathways. Second, you don’t need to perform any extra work during the normal calling convention. There’s no wrapping of values – so no extra register or stack pressure – and there’s no branching in callers. There can be some downsides to exceptions, however. In an untyped model, you must assume every function can throw, which obviously inhibits your ability to move code around.

Our model ended up being a hybrid of two things:

    Fail-fast for programming bugs.
    Typed exceptions for dynamically recoverable errors.

I’d say the ratio of fail-fast to typed exceptions usage ended up being 10:1. Exceptions were generally used for I/O and things that dealt with user data, like the shell and parsers. Contracts were the biggest source of fail-fast.

The result was the best possible configuration of the above code quality attributes:

    No calling convention impact.
    No peanut butter associated with wrapping return values and caller branching.
    All throwing functions were known in the type system, enabling more flexible code motion.
    All throwing functions were known in the type system, giving us novel EH optimizations, like turning try/finally blocks into straightline code when the try could not throw.

A nice accident of our model was that we could have compiled it with either return codes or exceptions. Thanks to this, we actually did the experiment, to see what the impact was to our system’s size and speed. The exceptions-based system ended up being roughly 7% smaller and 4% faster on some key benchmarks.

At the end, what we ended up with was the most robust error model I’ve ever used, and certainly the most performant one.
Contracts

As implied above, Midori’s programming language had first class contracts:

void Push(T element)
    requires element != null
    ensures this.Count == old.Count + 1
{
        ...
}

The model was simple:

    By default, all contracts are checked at runtime.
    The compiler was free to prove contracts false, and issue compile-time errors.
    The compiler was free to prove contracts true, and remove these runtime checks.

We had conditional compilation modes, however I will skip these for now. Look for an upcoming post on our language.

In the early days, we experimented with contract analyzers like MSR’s Clousot, to prove contracts. For compile-time reasons, however, we had to abandon this approach. It turns out compilers are already very good at doing simple constraint solving and propagation. So eventually we just modeled contracts as facts that the compiler knew about, and let it insert the checks wherever necessary.

For example, the loop optimizer complete with range information above can already leverage checks like this:

void M(int[] array, int index) {
    if (index >= 0 && index < array.Length) {
        int v = array[index];
        ...
    }
}

to eliminate the redundant bounds check inside the guarded if statement. So why not also do the same thing here?

void M(int[] array, int index)
        requires index >= 0 && index < array.Length {
    int v = array[index];
    ...
}

These facts were special, however, when it comes to separate compilation. A contract is part of a method’s signature, and our system ensured proper subtyping substitution, letting the compiler do more aggressive optimizations at separately compiled boundaries. And it could do these optimizations faster because they didn’t depend on global analysis.
Objects and allocation

In a future post, I’ll describe in great detail our war with the garbage collector. One technique that helped us win, however, was to aggressively reduce the size and quantity of objects a well-behaving program allocated on the heap. This helped with overall working set and hence made programs smaller and faster.

The first technique here was to shrink object sizes.

In C# and most Java VMs, objects have headers. A standard size is a single word, that is, 4 bytes on 32-bit architectures and 8 bytes on 64-bit. This is in addition to the vtable pointer. It’s typically used by the GC to mark objects and, in .NET, is used for random stuff, like COM interop, locking, memozation of hash codes, and more. (Even the source code calls it the “kitchen sink”.)

Well, we ditched both.

We didn’t have COM interop. There was no unsafe free-threading so there was no locking (and locking on random objects is a bad idea anyway). Our Object didn’t define a GetHashCode. Etc. This saved a word per object with no discernable loss in the programming model (actually, to the contrary, it was improved), which is nothing to shake a stick at.

At that point, the only overhead per object was the vtable pointer. For structs, of course there wasn’t one (unless they were boxed). And we did our best to eliminate all of them. Sadly, due to RTTI, it was difficult to be aggressive. I think this is another area where I’d go back and entirely upend the C# type system, to follow a more C, C++, or even maybe Go-like, model. In the end, however, I think we did get to be fairly competitive with your average C++ program.

There were padding challenges. Switching the struct layout from C#’s current default of sequential, to our preferred default of auto, certainly helped. As did optimizations like the well-known C++ empty base optimization.

We also did aggressive escape analysis in order to more efficiently allocate objects. If an object was found to be stack-confined, it was allocated on the stack instead of the heap. Our initial implementation of this moved somewhere in the neighborhood of 10% static allocations from the heap to the stack, and let us be far more aggressive about pruning back the size of objects, eliminating vtable pointers and entire unused fields. Given how conservative this analysis had to be, I was pretty happy with these results.

We offered a hybrid between C++ references and Rust borrowing if developers wanted to give the compiler a hint while at the same time semantically enforcing some level of containment. For example, say I wanted to allocate a little array to share with a callee, but know for sure the callee does not remember a reference to it. This was as simple as saying:

void Caller() {
    Callee(new[] { 0, 1, ..., 9 });
}

void Callee(int[]& a) {
    ... guaranteed that `a` does not escape ...
}

The compiler used the int[]& information to stack allocate the array and, often, eliminate the vtable for it entirely. Coupled with the sophisticated elimination of bounds checking, this gave us something far closer to C performance.

Lambdas/delegates in our system were also structs, so did not require heap allocation. The captured display frame was subject to all of the above, so frequently we could stack allocate them. As a result, the following code was heap allocation-free; in fact, thanks to some early optimizations, if the callee was inlined, it ran as though the actual lambda body was merely expanded as a sequence of instructions, with no call over head either!

void Caller() {
    Callee(() => ... do something ... );
}

void Callee(Action& callback) {
    callback();
}

In my opinion, this really was the killer use case for the borrowing system. Developers avoided lambda-based APIs in the early days before we had this feature for fear of allocations and inefficiency. After doing this feature, on the other hand, a vibrant ecosystem of expressive lambda-based APIs flourished.
Throughput

All of the above have to do with code quality; that is, the size and speed of the resulting code. Another important dimension of compiler performance, however, is throughput; that is, how quickly you can compile the code. Here too a language like C# comes with some of its own challenges.

The biggest challenge we encountered has less to do with the inherently safe nature of a language, and more to do with one very powerful feature: parametric polymorphism. Or, said less pretentiously, generics.

I already mentioned earlier that generics are just a convenient copy-and-paste mechanism. And I mentioned some challenges this poses for code size. It also poses a problem for throughput, however. If a List<T> instantiation creates 28 types, each with its own handful of methods, that’s just more code for the compiler to deal with. Separate compilation helps, however as also noted earlier, generics often flow across module boundaries. As a result, there’s likely to be a non-trivial impact to compile time. Indeed, there was.

In fact, this is not very different from where most C++ compilers spend the bulk of their time. In C++, it’s templates. More modern C++ code-bases have similar problems, due to heavy use of templated abstractions, like STL, smart pointers, and the like. Many C++ code-bases are still just “C with classes” and suffer this problem less.

As I mentioned earlier, I wish we had banished RTTI. That would have lessened the generics problem. But I would guess generics still would have remained our biggest throughput challenge at the end of the day.

The funny thing – in a not-so-funny kind of way – is that you can try to do analysis to prune the set of generics and, though it is effective, this analysis takes time. The very thing you’re trying to save.

A metric we got in the habit of tracking was how much slower AOT compiling a program was than simply C# compiling it. This was a totally unfair comparison, because the C# compiler just needs to lower to MSIL whereas an AOT compler needs to produce machine code. It’d have been fairer to compare AOT compiling to JIT compiling. But no matter, doing a great job on throughput is especially important for a C# audience. The expectation of productivity was quite high. This was therefore the key metric we felt customers would judge us on, and so we laser-focused on it.

In the early days, the number was ridiculously bad. I remember it being 40x slower. After about a year and half with intense focus we got it down to 3x for debug builds and 5x for optimized builds. I was very happy with this!

There was no one secret to achieving this. Mostly it had to do with just making the compiler faster like you would any program. Since we built the compiler using Midori’s toolchain, however – and compiled it using itself – often this was done by first making Midori better, which then made the the compiler faster. It was a nice virtuous loop. We had real problems with string allocations which informed what to do with strings in our programming model. We found crazy generics instantiation closures which forced us to eliminate them and build tools to help find them proactively. Etc.
Culture

A final word before wrapping up. Culture was the most important aspect of what we did. Without the culture, such an amazing team wouldn’t have self-selected, and wouldn’t have relentlessly pursued all of the above achievements. I’ll devote an entire post to this. However, in the context of compilers, two things helped:

    We measured everything in the lab. “If it’s not in the lab, it’s dead to me.”
    We reviewed progress early and often. Even in areas where no progress was made. We were habitually self-critical.

Every sprint, we had a so-called “CQ Review” (where CQ stands for “code quality”). The compiler team prepared for a few days, by reviewing every benchmark – ranging from the lowest of microbenchmarks to compiling and booting all of Windows – and investigating any changes. All expected wins were confirmed (we called this “confirming your kill”), any unexpected regressions were root cause analyzed (and bugs filed), and any wins that didn’t materialize were also analyzed and reported on so that we could learn from it. We even stared at numbers that didn’t change, and asked ourselves, why didn’t they change. Was it expected? Do we feel bad about it and, if so, how will we change next sprint? We reviewed our competitors’ latest compiler drops and monitored their rate of change. And so on.

This process was enormously healthy. Everyone was encouraged to be self-critical. This was not a “witch hunt”; it was an opportunity to learn as a team how to do better at achieving our goals.

Post-Midori, I have kept this process. I’ve been surprised at how contentious this can be with some folks. They get threatened and worry their lack of progress makes them look bad. They use “the numbers aren’t changing because that’s not our focus right now” as justification for getting out of the rhythm. In my experience, so long as the code is changing, the numbers are changing. It’s best to keep your eye on them lest you get caught with your pants around your ankles many months later when it suddenly matters most. The discipline and constant drumbeat are the most important parts of these reviews, so skipping even just one can be detrimental, and hence was verboten.

This process was as much our secret sauce as anything else was.
Wrapping Up

Whew, that was a lot of ground to cover. I hope at the very least it was interesting, and I hope for the incredible team who built all of this that I did it at least a fraction of justice. (I know I didn’t.)

This journey took us over a decade, particularly if you account for the fact that both Bartok and Phoenix had existed for many years even before Midori formed. Merely AOT compiling C#, and doing it well, would have netted us many of the benefits above. But to truly achieve the magical native-like performance, and indeed even exceed it in certain areas, required some key “whole system” architectural bets. I hope that some day we can deliver safety into the world at this level of performance. Given the state of security all-up in the industry, mankind seriously needs it.

I’ve now touched on our programming language enough that I need to go deep on it. Tune in next time!

#### The error model

[source](http://joeduffyblog.com/2016/02/07/the-error-model/)

Midori was written in an ahead-of-time compiled, type-safe language based on C#. Aside from our microkernel, the whole system was written in it, including drivers, the domain kernel, and all user code. I’ve hinted at a few things along the way and now it’s time to address them head-on. The entire language is a huge space to cover and will take a series of posts. First up? The Error Model. The way errors are communicated and dealt with is fundamental to any language, especially one used to write a reliable operating system. Like many other things we did in Midori, a “whole system” approach was necessary to getting it right, taking several iterations over several years. I regularly hear from old teammates, however, that this is the thing they miss most about programming in Midori. It’s right up there for me too. So, without further ado, let’s start.
Introduction

The basic question an Error Model seeks to answer is: how do “errors” get communicated to programmers and users of the system? Pretty simple, no? So it seems.

One of the biggest challenges in answering this question turns out to be defining what an error actually is. Most languages lump bugs and recoverable errors into the same category, and use the same facilities to deal with them. A null dereference or out-of-bounds array access is treated the same way as a network connectivity problem or parsing error. This consistency may seem nice at first glance, but it has deep-rooted issues. In particular, it is misleading and frequently leads to unreliable code.

Our overall solution was to offer a two-pronged error model. On one hand, you had fail-fast – we called it abandonment – for programming bugs. And on the other hand, you had statically checked exceptions for recoverable errors. The two were very different, both in programming model and the mechanics behind them. Abandonment unapologetically tore down the entire process in an instant, refusing to run any user code while doing so. (Remember, a typical Midori program had many small, lightweight processes.) Exceptions, of course, facilitated recovery, but had deep type system support to aid checking and verification.

This journey was long and winding. To tell the tale, I’ve broken this post into six major areas:

    Ambitions and Learnings
    Bugs Aren’t Recoverable Errors!
    Reliability, Fault-Tolerance, and Isolation
    Bugs: Abandonment, Assertions, and Contracts
    Recoverable Errors: Type-Directed Exceptions
    Retrospective and Conclusions

In hindsight, certain outcomes seem obvious. Especially given modern systems languages like Go and Rust. But some outcomes surprised us. I’ll cut to the chase wherever I can but I’ll give ample back-story along the way. We tried out plenty of things that didn’t work, and I suspect that’s even more interesting than where we ended up when the dust settled.
Ambitions and Learnings

Let’s start by examining our architectural principles, requirements, and learnings from existing systems.
Principles

As we set out on this journey, we called out several requirements of a good Error Model:

    Usable. It must be easy for developers to do the “right” thing in the face of error, almost as if by accident. A friend and colleague famously called this falling into the The Pit of Success. The model should not impose excessive ceremony in order to write idiomatic code. Ideally it is cognitively familiar to our target audience.

    Reliable. The Error Model is the foundation of the entire system’s reliability. We were building an operating system, after all, so reliability was paramount. You might even have accused us as obsessively pursuing extreme levels of it. Our mantra guiding much of the programming model development was “correct by construction.”

    Performant. The common case needs to be extremely fast. That means as close to zero overhead as possible for success paths. Any added costs for failure paths must be entirely “pay-for-play.” And unlike many modern systems that are willing to overly penalize error paths, we had several performance-critical components for which this wasn’t acceptable, so errors had to be reasonably fast too.

    Concurrent. Our entire system was distributed and highly concurrent. This raises concerns that are usually afterthoughts in other Error Models. They needed to be front-and-center in ours.

    Diagnosable. Debugging failures, either interactively or after-the-fact, needs to be productive and easy.

    Composable. At the core, the Error Model is a programming language feature, sitting at the center of a developer’s expression of code. As such, it had to provide familiar orthogonality and composability with other features of the system. Integrating separately authored components had to be natural, reliable, and predictable.

It’s a bold claim, however I do think what we ended up with succeeded across all dimensions.
Learnings

Existing Error Models didn’t meet the above requirements for us. At least not fully. If one did well on a dimension, it’d do poorly at another. For instance, error codes can have good reliability, but many programmers find them error prone to use; further, it’s easy to do the wrong thing – like forget to check one – which clearly violates the “pit of success” requirement.

Given the extreme level of reliability we sought, it’s little surprise we were dissatisfied with most models.

If you’re optimizing for ease-of-use over reliability, as you might in a scripting language, your conclusions will differ significantly. Languages like Java and C# struggle because they are right at the crossroads of scenarios – sometimes being used for systems, sometimes being used for applications – but overall their Error Models were very unsuitable for our needs.

Finally, also recall that this story began in the mid-2000s timeframe, before Go, Rust, and Swift were available for our consideration. These three languages have done some great things with Error Models since then.
Error Codes

Error codes are arguably the simplest Error Model possible. The idea is very basic and doesn’t even require language or runtime support. A function just returns a value, usually an integer, to indicate success or failure:

int foo() {
    // <try something here>
    if (failed) {
        return 1;
    }
    return 0;
}

This is the typical pattern, where a return of 0 means success and non-zero means failure. A caller must check it:

int err = foo();
if (err) {
    // Error!  Deal with it.
}

Most systems offer constants representing the set of error codes rather than magic numbers. There may or may not be functions you can use to get extra information about the most recent error (like errno in standard C and GetLastError in Win32). A return code really isn’t anything special in the language – it’s just a return value.

C has long used error codes. As a result, most C-based ecosystems do. More low-level systems code has been written using the return code discipline than any other. Linux does, as do countless mission-critical and realtime systems. So it’s fair to say they have an impressive track record going for them!

On Windows, HRESULTs are equivalent. An HRESULT is just an integer “handle” and there are a bunch of constants and macros in winerror.h like S_OK, E_FAULT, and SUCCEEDED(), that are used to create and check values. The most important code in Windows is written using a return code discipline. No exceptions are to be found in the kernel. At least not intentionally.

In environments with manual memory management, deallocating memory on error is uniquely difficult. Return codes can make this (more) tolerable. C++ has more automatic ways of doing this using RAII, but unless you buy into the C++ model whole hog – which a fair number of systems programmers don’t – then there’s no good way to incrementally use RAII in your C programs.

More recently, Go has chosen error codes. Although Go’s approach is similar to C’s, it has been modernized with much nicer syntax and libraries.

Many functional languages use return codes disguised in monads and named things like Option<T>, Maybe<T>, or Error<T>, which, when coupled with a dataflow-style of programming and pattern matching, feel far more natural. This approach removes several major drawbacks to return codes that we’re about to discuss, especially compared to C. Rust has largely adopted this model but has dome some exciting things with it for systems programmers.

Despite their simplicity, return codes do come with some baggage; in summary:

    Performance can suffer.
    Programming model usability can be poor.
    The biggie: You can accidentally forget to check for errors.

Let’s discuss each one, in order, with examples from the languages cited above.
Performance

Error codes fail the test of “zero overhead for common cases; pay for play for uncommon cases”:

    There is calling convention impact. You now have two values to return (for non-void returning functions): the actual return value and the possible error. This burns more registers and/or stack space, making calls less efficient. Inlining can of course help to recover this for the subset of calls that can be inlined.

    There are branches injected into callsites anywhere a callee can fail. I call costs like this “peanut butter,” because the checks are smeared across the code, making it difficult to measure the impact directly. In Midori we were able to experiment and measure, and confirm that yes, indeed, the cost here is nontrivial. There is also a secondary effect which is, because functions contain more branches, there is more risk of confusing the optimizer.

This might be surprising to some people, since undoubtedly everyone has heard that “exceptions are slow.” It turns out that they don’t have to be. And, when done right, they get error handling code and data off hot paths which increases I-cache and TLB performance, compared to the overheads above, which obviously decreases them.

Many high performance systems have been built using return codes, so you might think I’m nitpicking. As with many things we did, an easy criticism is that we took too extreme an approach. But the baggage gets worse.
Forgetting to Check Them

It’s easy to forget to check a return code. For example, consider a function:

int foo() { ... }

Now at the callsite, what if we silently ignore the returned value entirely, and just keep going?

foo();
// Keep going -- but foo might have failed!

At this point, you’ve masked a potentially critical error in your program. This is easily the most vexing and damaging problem with error codes. As I will show later, option types help to address this for functional languages. But in C-based languages, and even Go with its modern syntax, this is a real issue.

This problem isn’t theoretical. I’ve encountered numerous bugs caused by ignoring return codes and I’m sure you have too. Indeed, in the development of this very Error Model, my team encountered some fascinating ones. For example, when we ported Microsoft’s Speech Server to Midori, we found that 80% of Taiwan Chinese (zh-tw) requests were failing. Not failing in a way the developers immediately saw, however; instead, clients would get a gibberish response. At first, we thought it was our fault. But then we discovered a silently swallowed HRESULT in the original code. Once we got it over to Midori, the bug was thrown into our faces, found, and fixed immediately after porting. This experience certainly informed our opinion about error codes.

It’s surprising to me that Go made unused imports an error, and yet missed this far more critical one. So close!

It’s true you can add a static analysis checker, or maybe an “unused return value” warning as most commercial C++ compilers do. But once you’ve missed the opportunity to add it to the core of the language, as a requirement, none of those techniques will reach critical mass due to complaints about noisy analysis.

For what it’s worth, forgetting to use return values in our language was a compile time error. You had to explicitly ignore them; early on we used an API for this, but eventually devised language syntax – the equivalent of >/dev/null:

ignore foo();

We didn’t use error codes, however the inability to accidentally ignore a return value was important for the overall reliability of the system. How many times have you debugged a problem only to find that the root cause was a return value you forgot to use? There have even been security exploits where this was the root cause. Letting developers say ignore wasn’t bulletproof, of course, as they could still do the wrong thing. But it was at least explicit and auditable.
Programming Model Usability

In C-based languages with error codes, you end up writing lots of hand-crafted if checks everywhere after function calls. This can be especially tedious if many of your functions fail which, in C programs where allocation failures are also communicated with return codes, is frequently the case. It’s also clumsy to return multiple values.

A warning: this complaint is subjective. In many ways, the usability of return codes is actually elegant. You reuse very simple primitives – integers, returns, and if branches – that are used in myriad other situations. In my humble opinion, errors are an important enough aspect of programming that the language should be helping you out.

Go has a nice syntactic shortcut to make the standard return code checking slightly more pleasant:

if err := foo(); err != nil {
    // Deal with the error.
}

Notice that we’ve invoked foo and checked whether the error is non-nil in one line. Pretty neat.

The usability problems don’t stop there, however.

It’s common that many errors in a given function should share some recovery or remediation logic. Many C programmers use labels and gotos to structure such code. For example:

int error;

// ...

error = step1();
if (error) {
    goto Error;
}

// ...

error = step2();
if (error) {
    goto Error;
}

// ...

// Normal function exit.
return 0;

// ...
Error:
// Do something about `error`.
return error;

Needless to say, this is the kind of code only a mother could love.

In languages like D, C#, and Java, you have finally blocks to encode this “before scope exits” pattern more directly. Similarly, Microsoft’s proprietary extensions to C++ offer __finally, even if you’re not fully buying into RAII and exceptions. And D provides scope and Go offers defer. All of these help to eradicate the goto Error pattern.

Next, imagine my function wants to return a real value and the possibility of an error? We’ve burned the return slot already so there are two obvious possibilities:

    We can use the return slot for one of the two values (commonly the error), and another slot – like a pointer parameter – for the other of the two (commonly the real value). This is the common approach in C.

    We can return a data structure that carries the possibility of both in its very structure. As we will see, this is common in functional languages. But in a language like C, or Go even, that lacks parametric polymorphism, you lose typing information about the returned value, so this is less common to see. C++ of course adds templates, so in principle it could do this, however because it adds exceptions, the ecosystem around return codes is lacking.

In support of the performance claims above, imagine what both of these do to your program’s resulting assembly code.
Returning Values “On The Side”

An example of the first approach in C looks like this:

int foo(int* out) {
    // <try something here>
    if (failed) {
        return 1;
    }
    *out = 42;
    return 0;
}

The real value has to be returned “on the side,” making callsites clumsy:

int value;
int ret = foo(&value);
if (ret) {
    // Error!  Deal with it.
}
else {
    // Use value...
}

In addition to being clumsy, this pattern perturbs your compiler’s definite assignment analysis which impairs your ability to get good warnings about things like using uninitialized values.

Go also takes aim at this problem with nicer syntax, thanks to multi-valued returns:

func foo() (int, error) {
    if failed {
        return 0, errors.New("Bad things happened")
    }
    return 42, nil
}

And callsites are much cleaner as a result. Combined with the earlier feature of single-line if checking for errors – a subtle twist, since at first glance the value return wouldn’t be in scope, but it is – this gets a touch nicer:

if value, err := foo(); err != nil {
    // Error!  Deal with it.
} else {
    // Use value ...
}

Notice that this also helps to remind you to check the error. It’s not bulletproof, however, because functions can return an error and nothing else, at which point forgetting to check it is just as easy as it is in C.

As I mentioned above, some would argue against me on the usability point. Especially Go’s designers, I suspect. A big appeal to Go using error codes is as a rebellion against the overly complex languages in today’s landscape. We have lost a lot of what makes C so elegant – that you can usually look at any line of code and guess what machine code it translates into. I won’t argue against these points. In fact, I vastly prefer Go’s model over both unchecked exceptions and Java’s incarnation of checked exceptions. Even as I write this post, having written lots of Go lately, I look at Go’s simplicity and wonder, did we go too far with all the try and requires and so on that you’ll see shortly? I’m not sure. Go’s error model tends to be one of the most divisive aspect of the language; it’s probably largely because you can’t be sloppy with errors as in most languages, however programmers really did enjoy writing code in Midori’s. In the end, it’s hard to compare them. I’m convinced both can be used to write reliable code.
Return Values in Data Structures

Functional languages address many of the usability challenges by packaging up the possibility of either a value or an error, into a single data structure. Because you’re forced to pick apart the error from the value if you want to do anything useful with the value at the callsite – which, thanks to a dataflow style of programming, you probably will – it’s easy to avoid the killer problem of forgetting to check for errors.

For an example of a modern take on this, check out Scala’s Option type. The unfortunate news is that some languages, like those in the ML family and even Scala (thanks to its JVM heritage), mix this elegant model with the world of unchecked exceptions. This taints the elegance of the monadic data structure approach.

Haskell does something even cooler and gives the illusion of exception handling while still using error values and local control flow:

    There is an old dispute between C++ programmers on whether exceptions or error return codes are the right way. Niklas Wirth considered exceptions to be the reincarnation of GOTO and thus omitted them in his languages. Haskell solves this problem a diplomatic way: Functions return error codes, but the handling of error codes does not uglify the code.

The trick here is to support all the familiar throw and catch patterns, but using monads rather than control flow.

Although Rust also uses error codes it is also in the style of the functional error types. For example, imagine we are writing a function named bar in Go: we’d like to call foo, and then simply propagate the error to our caller if it fails:

func bar() error {
    if value, err := foo(); err != nil {
        return err
    } else {
        // Use value ...
    }
}

The longhand version in Rust isn’t any more concise. It might, however, send C programmers reeling with its foreign pattern matching syntax (a real concern but not a dealbreaker). Anyone comfortable with functional programming, however, probably won’t even blink, and this approach certainly serves as a reminder to deal with your errors:

fn bar() -> Result<(), Error> {
    match foo() {
        Ok(value) => /* Use value ... */,
        Err(err) => return Err(err)
    }
}

But it gets better. Rust has a try! macro that reduces boilerplate like the most recent example to a single expression:

fn bar() -> Result<(), Error> {
    let value = try!(foo);
    // Use value ...
}

This leads us to a beautiful sweet spot. It does suffer from the performance problems I mentioned earlier, but does very well on all other dimensions. It alone is an incomplete picture – for that, we need to cover fail-fast (a.k.a. abandonment) – but as we will see, it’s far better than any other exception-based model in widespread use today.
Exceptions

The history of exceptions is fascinating. During this journey I spent countless hours retracing the industry’s steps. That includes reading some of the original papers – like Goodenough’s 1975 classic, Exception Handling: Issues and a Proposed Notation – in addition to looking at the approaches of several languages: Ada, Eiffel, Modula-2 and 3, ML, and, most inspirationally, CLU. Many papers do a better job than I can summarizing the long and arduous journey, so I won’t do that here. Instead, I’ll focus on what works and what doesn’t work for building reliable systems.

Reliability is the most important of our requirements above when developing the Error Model. If you can’t react appropriately to failures, your system, by definition, won’t be very reliable. Operating systems generally speaking need to be reliable. Sadly, the most commonplace model – unchecked exceptions – is the worst you can do in this dimension.

For these reasons, most reliable systems use return codes instead of exceptions. They make it possible to locally reason about and decide how best to react to error conditions. But I’m getting ahead of myself. Let’s dig in.
Unchecked Exceptions

A quick recap. In an unchecked exceptions model, you throw and catch exceptions, without it being part of the type system or a function’s signature. For example:

// Foo throws an unhandled exception:
void Foo() {
    throw new Exception(...);
}

// Bar calls Foo, and handles that exception:
void Bar() {
    try {
        Foo();
    }
    catch (Exception e) {
        // Handle the error.
    }
}

// Baz also calls Foo, but does not handle that exception:
void Baz() {
    Foo(); // Let the error escape to our callers.
}

In this model, any function call – and sometimes any statement – can throw an exception, transferring control non-locally somewhere else. Where? Who knows. There are no annotations or type system artifacts to guide your analysis. As a result, it’s difficult for anyone to reason about a program’s state at the time of the throw, the state changes that occur while that exception is propagated up the call stack – and possibly across threads in a concurrent program – and the resulting state by the time it gets caught or goes unhandled.

It’s of course possible to try. Doing so requires reading API documentation, doing manual audits of the code, leaning heavily on code reviews, and a healthy dose of luck. The language isn’t helping you out one bit here. Because failures are rare, this tends not to be as utterly disastrous as it sounds. My conclusion is that’s why many people in the industry think unchecked exceptions are “good enough.” They stay out of your way for the common success paths and, because most people don’t write robust error handling code in non-systems programs, throwing an exception usually gets you out of a pickle fast. Catching and then proceeding often works too. No harm, no foul. Statistically speaking, programs “work.”

Maybe statistical correctness is okay for scripting languages, but for the lowest levels of an operating system, or any mission critical application or service, this isn’t an appropriate solution. I hope this isn’t controversial.

.NET makes a bad situation even worse due to asynchronous exceptions. C++ has so-called “asynchronous exceptions” too: these are failures that are triggered by hardware faults, like access violations. It gets really nasty in .NET, however. An arbitrary thread can inject a failure at nearly any point in your code. Even between the RHS and LHS of an assignment! As a result, things that look atomic in source code aren’t. I wrote about this 10 years ago and the challenges still exist, although the risk has lessened as .NET generally learned that thread aborts are problematic. The new CoreCLR even lacks AppDomains, and the new ASP.NET Core 1.0 stack certainly doesn’t use thread aborts like it used to. But the APIs are still there.

There’s a famous interview with Anders Hejlsberg, C#’s chief designer, called The Trouble with Checked Exceptions. From a systems programmer’s perspective, much of it leaves you scratching your head. No statement affirms that the target customer for C# was the rapid application developer more than this:

    Bill Venners: But aren’t you breaking their code in that case anyway, even in a language without checked exceptions? If the new version of foo is going to throw a new exception that clients should think about handling, isn’t their code broken just by the fact that they didn’t expect that exception when they wrote the code?

    Anders Hejlsberg : No, because in a lot of cases, people don’t care. They’re not going to handle any of these exceptions. There’s a bottom level exception handler around their message loop. That handler is just going to bring up a dialog that says what went wrong and continue. The programmers protect their code by writing try finally’s everywhere, so they’ll back out correctly if an exception occurs, but they’re not actually interested in handling the exceptions.

This reminds me of On Error Resume Next in Visual Basic, and the way Windows Forms automatically caught and swallowed errors thrown by the application, and attempted to proceed. I’m not blaming Anders for his viewpoint here; heck, for C#’s wild popularity, I’m convinced it was the right call given the climate at the time. But this sure isn’t the way to write operating system code.

C++ at least tried to offer something better than unchecked exceptions with its throw exception specifications. Unfortunately, the feature relied on dynamic enforcement which sounded its death knell instantaneously.

If I write a function void f() throw(SomeError), the body of f is still free to invoke functions that throw things other than SomeError. Similarly, if I state that f throws no exceptions, using void f() throw(), it’s still possible to invoke things that throw. To implement the stated contract, therefore, the compiler and runtime must ensure that, should this happen, std::unexpected is called to rip the process down in response.

I’m not the only person to recognize this design was a mistake. Indeed, throw is now deprecated. A detailed WG21 paper, Deprecating Exception Specifications, describes how C++ ended up here, and has this to offer in its opening statement:

    Exception specifications have proven close to worthless in practice, while adding a measurable overhead to programs.

The authors list three reasons for deprecating throw. Two of the three reasons were a result of the dynamic choice: runtime checking (and its associated opaque failure mode) and runtime performance overheads. The third reason, lack of composition in generic code, could have been dealt with using a proper type system (admittedly at an expense).

But the worst part is that the cure relies on yet another dynamically enforced construct – the noexcept specifier – which, in my opinion, is just as bad as the disease.

“Exception safety” is a commonly discussed practice in the C++ community. This approach neatly classifies how functions are intended to behave from a caller’s perspective with respect to failure, state transitions, and memory management. A function falls into one of four kinds: no-throw means forward progress is guaranteed and no exceptions will emerge; strong safety means that state transitions happen atomically and a failure will not leave behind partially committed state or broken invariants; basic safety means that, though a function might partially commit state changes, invariants will not be broken and leaks are prevented; and finally, no safety means anything’s possible. This taxonomy is quite helpful and I encourage anyone to be intentional and rigorous about error behavior, either using this approach or something similar. Even if you’re using error codes. The problem is, it’s essentially impossible to follow these guidelines in a system using unchecked exceptions, except for leaf node data structures that call a small and easily auditable set of other functions. Just think about it: to guarantee strong safety everywhere, you would need to consider the possibility of all function calls throwing, and safeguard the surrounding code accordingly. That either means programming defensively, trusting another function’s documented English prose (that isn’t being checked by a computer), getting lucky and only calling noexcept functions, or just hoping for the best. Thanks to RAII, the leak-freedom aspect of basic safety is easier to attain – and pretty common these days thanks to smart pointers – but even broken invariants are tricky to prevent. The article Exception Handling: A False Sense of Security sums this up well.

For C++, the real solution is easy to predict, and rather straightforward: for robust systems programs, don’t use exceptions. That’s the approach Embedded C++ takes, in addition to numerous realtime and mission critical guidelines for C++, including NASA’s Jet Propulsion Laboratory’s. C++ on Mars sure ain’t using exceptions anytime soon.

So if you can safely avoid exceptions and stick to C-like return codes in C++, what’s the beef?

The entire C++ ecosystem uses exceptions. To obey the above guidance, you must avoid significant parts of the language and, it turns out, significant chunks of the library ecosystem. Want to use the Standard Template Library? Too bad, it uses exceptions. Want to use Boost? Too bad, it uses exceptions. Your allocator likely throws bad_alloc. And so on. This even causes insanity like people creating forks of existing libraries that eradicates exceptions. The Windows kernel, for instance, has its own fork of the STL that doesn’t use exceptions. This bifurcation of the ecosystem is neither pleasant nor practical to sustain.

This mess puts us in a bad spot. Especially because many languages use unchecked exceptions. It’s clear that they are ill-suited for writing low-level, reliable systems code. (I’m sure I will make a few C++ enemies by saying this so bluntly.) After writing code in Midori for years, it brings me tears to go back and write code that uses unchecked exceptions; even simply code reviewing is torture. But “thankfully” we have checked exceptions from Java to learn and borrow from … Right?
Checked Exceptions

Ah, checked exceptions. The rag doll that nearly every Java programmer, and every person who’s observed Java from an arm’s length distance, likes to beat on. Unfairly so, in my opinion, when you compare it to the unchecked exceptions mess.

In Java, you know mostly what a method might throw, because a method must say so:

void foo() throws FooException, BarException {
    ...
}

Now a caller knows that invoking foo could result in either FooException or BarException being thrown. At callsites a programmer must now decide: 1) propagate thrown exceptions as-is, 2) catch and deal with them, or 3) somehow transform the type of exception being thrown (possibly even “forgetting” the type altogether). For instance:

// 1) Propagate exceptions as-is:
void bar() throws FooException, BarException {
    foo();
}

// 2) Catch and deal with them:
void bar() {
    try {
        foo();
    }
    catch (FooException e) {
        // Deal with the FooException error conditions.
    }
    catch (BarException e) {
        // Deal with the BarException error conditions.
    }
}

// 3) Transform the exception types being thrown:
void bar() throws Exception {
    foo();
}

This is getting much closer to something we can use. But it fails on a few accounts:

    Exceptions are used to communicate unrecoverable bugs, like null dereferences, divide-by-zero, etc.

    You don’t actually know everything that might be thrown, thanks to our little friend RuntimeException. Because Java uses exceptions for all error conditions – even bugs, per above – the designers realized people would go mad with all those exception specifications. And so they introduced a kind of exception that is unchecked. That is, a method can throw it without declaring it, and so callers can invoke it seamlessly.

    Although signatures declare exception types, there is no indication at callsites what calls might throw.

    People hate them.

That last one is interesting, and I shall return to it later when describing the approach Midori took. In summary, peoples’ distaste for checked exceptions in Java is largely derived from, or at least significantly reinforced by, the other three bullets above. The resulting model seems to be the worst of both worlds. It doesn’t help you to write bulletproof code and it’s hard to use. You end up writing down a lot of gibberish in your code for little perceived benefit. And versioning your interfaces is a pain in the ass. As we’ll see later, we can do better.

That versioning point is worth a ponder. If you stick to a single kind of throw, then the versioning problem is no worse than error codes. Either a function fails or it doesn’t. It’s true that if you design version 1 of your API to have no failure mode, and then want to add failures in version 2, you’re screwed. As you should be, in my opinion. An API’s failure mode is a critical part of its design and contract with callers. Just as you wouldn’t change the return type of an API silently without callers needing to know, you shouldn’t change its failure mode in a semantically meaningful way. More on this controversial point later on.

CLU has an interesting approach, as described in this crooked and wobbly scan of a 1979 paper by Barbara Liskov, Exception Handling in CLU. Notice that they focus a lot on “linguistics”; in other words, they wanted a language that people would love. The need to check and repropagate all errors at callsites felt a lot more like return values, yet the programming model had that richer and slightly declarative feel of what we now know as exceptions. And most importantly, signals (their name for throw) were checked. There were also convenient ways to terminate the program should an unexpected signal occur.
Universal Problems with Exceptions

Most exception systems get a few major things wrong, regardless of whether they are checked or unchecked.

First, throwing an exception is usually ridiculously expensive. This is almost always due to the gathering of a stack trace. In managed systems, gathering a stack trace also requires groveling metadata, to create strings of function symbol names. If the error is caught and handled, however, you don’t even need that information at runtime! Diagnostics are better implemented in the logging and diagnostics infrastructure, not the exception system itself. The concerns are orthogonal. Although, to really nail the diagnostics requirement above, something needs to be able to recover stack traces; never underestimate the power of printf debugging and how important stack traces are to it.

Next, exceptions can significantly impair code quality. I touched on this topic in my last post, and there are good papers on the topic in the context of C++. Not having static type system information makes it hard to model control flow in the compiler, which leads to overly conservative optimizers.

Another thing most exception systems get wrong is encouraging too coarse a granularity of handling errors. Proponents of return codes love that error handling is localized to a specific function call. (I do too!) In exception handling systems, it’s all too easy to slap a coarse-grained try/catch block around some huge hunk of code, without carefully reacting to individual failures. That produces brittle code that’s almost certainly wrong; if not today, then after the inevitable refactoring that will occur down the road. A lot of this has to do with having the right syntaxes.

Finally, control flow for throws is usually invisible. Even with Java, where you annotate method signatures, it’s not possible to audit a body of code and see precisely where exceptions come from. Silent control flow is just as bad as goto, or setjmp/longjmp, and makes writing reliable code very difficult.
Where Are We?

Before moving on, let’s recap where we are:

Good-Bad-Ugly

Wouldn’t it be great if we could take all of The Goods and leave out The Bads and The Uglies?

This alone would be a great step forward. But it’s insufficient. This leads me to our first big “ah-hah” moment that shaped everything to come. For a significant class of error, none of these approaches are appropriate!
Bugs Aren’t Recoverable Errors!

A critical distinction we made early on is the difference between recoverable errors and bugs:

    A recoverable error is usually the result of programmatic data validation. Some code has examined the state of the world and deemed the situation unacceptable for progress. Maybe it’s some markup text being parsed, user input from a website, or a transient network connection failure. In these cases, programs are expected to recover. The developer who wrote this code must think about what to do in the event of failure because it will happen in well-constructed programs no matter what you do. The response might be to communicate the situation to an end-user, retry, or abandon the operation entirely, however it is a predictable and, frequently, planned situation, despite being called an “error.”

    A bug is a kind of error the programmer didn’t expect. Inputs weren’t validated correctly, logic was written wrong, or any host of problems have arisen. Such problems often aren’t even detected promptly; it takes a while until “secondary effects” are observed indirectly, at which point significant damage to the program’s state might have occurred. Because the developer didn’t expect this to happen, all bets are off. All data structures reachable by this code are now suspect. And because these problems aren’t necessarily detected promptly, in fact, a whole lot more is suspect. Depending on the isolation guarantees of your language, perhaps the entire process is tainted.

This distinction is paramount. Surprisingly, most systems don’t make one, at least not in a principled way! As we saw above, Java, C#, and dynamic languages just use exceptions for everything; and C and Go use return codes. C++ uses a mixture depending on the audience, but the usual story is a project picks a single one and uses it everywhere. You usually don’t hear of languages suggesting two different techniques for error handling, however.

Given that bugs are inherently not recoverable, we made no attempt to try. All bugs detected at runtime caused something called abandonment, which was Midori’s term for something otherwise known as “fail-fast”.

Each of the above systems offers abandonment-like mechanisms. C# has Environment.FailFast; C++ has std::terminate; Go has panic; Rust has panic!; and so on. Each rips down the surrounding context abruptly and promptly. The scope of this context depends on the system – for example, C# and C++ terminate the process, Go the current Goroutine, and Rust the current thread, optionally with a panic handler attached to salvage the process.

Although we did use abandonment in a more disciplined and ubiquitous way than is common, we certainly weren’t the first to recognize this pattern. This Haskell essay, articulates this distinction quite well:

    I was involved in the development of a library that was written in C++. One of the developers told me that the developers are divided into the ones who like exceptions and the other ones who prefer return codes. As it seem to me, the friends of return codes won. However, I got the impression that they debated the wrong point: Exceptions and return codes are equally expressive, they should however not be used to describe errors. Actually the return codes contained definitions like ARRAY_INDEX_OUT_OF_RANGE. But I wondered: How shall my function react, when it gets this return code from a subroutine? Shall it send a mail to its programmer? It could return this code to its caller in turn, but it will also not know how to cope with it. Even worse, since I cannot make assumptions about the implementation of a function, I have to expect an ARRAY_INDEX_OUT_OF_RANGE from every subroutine. My conclusion is that ARRAY_INDEX_OUT_OF_RANGE is a (programming) error. It cannot be handled or fixed at runtime, it can only be fixed by its developer. Thus there should be no according return code, but instead there should be asserts.

Abandoning fine grained mutable shared memory scopes is suspect – like Goroutines or threads or whatever – unless your system somehow makes guarantees about the scope of the potential damage done. However, it’s great that these mechanisms are there for us to use! It means using an abandonment discipline in these languages is indeed possible.

There are architectural elements necessary for this approach to succeed at scale, however. I’m sure you’re thinking “If I tossed the entire process each time I had a null dereference in my C# program, I’d have some pretty pissed off customers”; and, similarly, “That wouldn’t be reliable at all!” Reliability, it turns out, might not be what you think.
Reliability, Fault-Tolerance, and Isolation

Before we get any further, we need to state a central belief: Shi Failure Happens.
To Build a Reliable System

Common wisdom is that you build a reliable system by systematically guaranteeing that failure can never happen. Intuitively, that makes a lot of sense. There’s one problem: in the limit, it’s impossible. If you can spend millions of dollars on this property alone – like many mission critical, realtime systems do – then you can make a significant dent. And perhaps use a language like SPARK (a set of contract-based extensions to Ada) to formally prove the correctness of each line written. However, experience shows that even this approach is not foolproof.

Rather than fighting this fact of life, we embraced it. Obviously you try to eliminate failures where possible. The error model must make them transparent and easy to deal with. But more importantly, you architect your system so that the whole remains functional even when individual pieces fail, and then teach your system to recover those failing pieces gracefully. This is well known in distributed systems. So why is it novel?

At the center of it all, an operating system is just a distributed network of cooperating processes, much like a distributed cluster of microservices or the Internet itself. The main differences include things like latency; what levels of trust you can establish and how easily; and various assumptions about locations, identity, etc. But failure in highly asynchronous, distributed, and I/O intensive systems is just bound to happen. My impression is that, largely because of the continued success of monolithic kernels, the world at large hasn’t yet made the leap to “operating system as a distributed system” insight. Once you do, however, a lot of design principles become apparent.

As with most distributed systems, our architecture assumed process failure was inevitable. We went to great length to defend against cascading failures, journal regularly, and to enable restartability of programs and services.

You build things differently when you go in assuming this.

In particular, isolation is critical. Midori’s process model encouraged lightweight fine-grained isolation. As a result, programs and what would ordinarily be “threads” in modern operating systems were independent isolated entities. Safeguarding against failure of one such connection is far easier than when sharing mutable state in an address space.

Isolation also encourages simplicity. Butler Lampson’s classic Hints on Computer System Design explores this topic. And I always loved this quote from Hoare:

    The unavoidable price of reliability is simplicity. (C. Hoare).

By keeping programs broken into smaller pieces, each of which can fail or succeed on its own, the state machines within them stay simpler. As a result, recovering from failure is easier. In our language, the points of possible failure were explicit, further helping to keep those internal state machines correct, and pointing out those connections with the messier outside world. In this world, the price of individual failure is not nearly as dire. I can’t over-emphasize this point. None of the language features I describe later would have worked so well without this architectural foundation of cheap and ever-present isolation.

Erlang has been very successful at building this property into the language in a fundamental way. It, like Midori, leverages lightweight processes connected by message passing, and encourages fault-tolerant architectures. A common pattern is the “supervisor,” where some processes are responsible for watching and, in the event of failure, restarting other processes. This article does a terrific job articulating this philosophy – “let it crash” – and recommended techniques for architecting reliable Erlang programs in practice.

The key thing, then, is not preventing failure per se, but rather knowing how and when to deal with it.

Once you’ve established this architecture, you beat the hell out of it to make sure it works. For us, this meant week-long stress runs, where processes would come and go, some due to failures, to ensure the system as a whole kept making good forward progress. This reminds me of systems like Netflix’s Chaos Monkey which just randomly kills entire machines in your cluster to ensure the service as a whole stays healthy.

I expect more of the world to adopt this philosophy as the shift to more distributed computing happens. In a cluster of microservices, for example, the failure of a single container is often handled seamlessly by the enclosing cluster management software (Kubernetes, Amazon EC2 Container Service, Docker Swarm, etc). As a result, what I describe in this post is possibly helpful for writing more reliable Java, Node.js/JavaScript, Python, and even Ruby services. The unfortunate news is you’re likely going to be fighting your languages to get there. A lot of code in your process is going to work real damn hard to keep limping along when something goes awry.
Abandonment

Even when processes are cheap and isolated and easy to recreate, it’s still reasonable to think that abandoning an entire process in the face of a bug is an overreaction. Let me try to convince you otherwise.

Proceeding in the face of a bug is dangerous when you’re trying to build a robust system. If a programmer didn’t expect a given situation that’s arisen, who knows whether the code will do the right thing anymore. Critical data structures may have been left behind in an incorrect state. As an extreme (and possibly slightly silly) example, a routine that is meant to round your numbers down for banking purposes might start rounding them up.

And you might be tempted to whittle down the granularity of abandonment to something smaller than a process. But that’s tricky. To take an example, imagine a thread in your process encounters a bug, and fails. This bug might have been triggered by some state stored in a static variable. Even though some other thread might appear to have been unaffected by the conditions leading to failure, you cannot make this conclusion. Unless some property of your system – isolation in your language, isolation of the object root-sets exposed to independent threads, or something else – it’s safest to assume that anything other than tossing the entire address space out the window is risky and unreliable.

Thanks to the lightweight nature of Midori processes, abandoning a process was more like abandoning a single thread in a classical system than a whole process. But our isolation model let us do this reliably.

I’ll admit the scoping topic is a slippery slope. Maybe all the data in the world has become corrupt, so how do you know that tossing the process is even enough?! There is an important distinction here. Process state is transient by design. In a well designed system it can be thrown away and recreated on a whim. It’s true that a bug can corrupt persistent state, but then you have a bigger problem on your hands – a problem that must be dealt with differently.

For some background, we can look to fault-tolerant systems design. Abandonment (fail-fast) is already a common technique in that realm, and we can apply much of what we know about these systems to ordinary programs and processes. Perhaps the most important technique is regularly journaling and checkpointing precious persistent state. Jim Gray’s 1985 paper, Why Do Computers Stop and What Can Be Done About It?, describes this concept nicely. As programs continue moving to the cloud, and become aggressively decomposed into smaller independent services, this clear separation of transient and persistent state is even more important. As a result of these shifts in how software is written, abandonment is far more achievable in modern architectures than it once was. Indeed, abandonment can help you avoid data corruption, because bugs detected before the next checkpoint prevent bad state from ever escaping.

Bugs in Midori’s kernel were handled differently. A bug in the microkernel, for instance, is an entirely different beast than a bug in a user-mode process. The scope of possible damage was greater, and the safest response was to abandon an entire “domain” (address space). Thankfully, most of what you’d think of being classic “kernel” functionality – the scheduler, memory manager, filesystem, networking stack, and even device drivers – was run instead in isolated processes in user-mode where failures could be contained in the usual ways described above.
Bugs: Abandonment, Assertions, and Contracts

A number of kinds of bugs in Midori might trigger abandonment:

    An incorrect cast.
    An attempt to dereference a null pointer.
    An attempt to access an array outside of its bounds.
    Divide-by-zero.
    An unintended mathematical over/underflow.
    Out-of-memory.
    Stack overflow.
    Explicit abandonment.
    Contract failures.
    Assertion failures.

Our fundamental belief was that each is a condition the program cannot recover from. Let’s discuss each one.
Plain Old Bugs

Some of these situations are unquestionably indicative of a program bug.

An incorrect cast, attempt to dereference null, array out-of-bounds access, or divide-by-zero are clearly problems with the program’s logic, in that it attempted an undeniably illegal operation. As we will see later, there are ways out (e.g., perhaps you want NaN-style propagation for DbZ). But by default we assume it’s a bug.

Most programmers were willing to accept this without question. And dealing with them as bugs this way brought abandonment to the inner development loop where bugs during development could be found and fixed fast. Abandonment really did help to make people more productive at writing code. This was a surprise to me at first, but it makes sense.

Some of these situations, on the other hand, are subjective. We had to make a decision about the default behavior, often with controversy, and sometimes offer programmatic control.
Arithmetic Over/Underflow

Saying an unintended arithmetic over/underflow represents a bug is certainly a contentious stance. In an unsafe system, however, such things frequently lead to security vulnerabilities. I encourage you to review the National Vulnerability Database to see the sheer number of these.

In fact, the Windows TrueType Font parser, which we ported to Midori (with gains in performance), has suffered over a dozen of them in the past few years alone. (Parsers tend to be farms for security holes like this.)

This has given rise to packages like SafeInt, which essentially moves you away from your native language’s arithmetic operations, in favor of checked library ones.

Most of these exploits are of course also coupled with an access to unsafe memory. You could reasonably argue therefore that overflows are innocuous in a safe language and therefore should be permitted. It’s pretty clear, however, based on the security experience, that a program often does the wrong thing in the face of an unintended over/underflow. Simply put, developers frequently overlook the possibility, and the program proceeds to do unplanned things. That’s the definition of a bug which is precisely what abandonment is meant to catch. The final nail in the coffin on this one is that philisophically, when there was any question about correctness, we tended to err on the side of explicit intent.

Hence, all unannotated over/underflows were considered bugs and led to abandonment. This was similar to compiling C# with the /checked switch, except that our compiler aggressively optimized redundant checks away. (Since few people ever think to throw this switch in C#, the code-generators don’t do nearly as aggressive a job in removing the inserted checks.) Thanks to this language and compiler co-development, the result was far better than what most C++ compilers will produce in the face of SafeInt arithmetic. Also as with C#, the unchecked scoping construct could be used where over/underflow was intended.

Although the initial reactions from most C# and C++ developers I’ve spoken to about this idea are negative about it, our experience was that 9 times out of 10, this approach helped to avoid a bug in the program. That remaining 1 time was usually an abandonment sometime late in one of our 72 hour stress runs – in which we battered the entire system with browsers and multimedia players and anything else we could do to torture the system – when some harmless counter overflowed. I always found it amusing that we spent time fixing these instead of the classical way products mature through the stress program, which is to say deadlocks and race conditions. Between you and me, I’ll take the overflow abandonments!
Out-of-Memory and Stack Overflow

Out-of-memory (OOM) is complicated. It always is. And our stance here was certainly contentious also.

In environments where memory is manually managed, error code-style of checking is the most common approach:

X* x = (X*)malloc(...);
if (!x) {
    // Handle allocation failure.
}

This has one subtle benefit: allocations are painful, require thought, and therefore programs that use this technique are often more frugal and deliberate with the way they use memory. But it has a huge downside: it’s error prone and leads to huge amounts of frequently untested code-paths. And when code-paths are untested, they usually don’t work.

Developers in general do a terrible job making their software work properly right at the edge of resource exhaustion. In my experience with Windows and the .NET Framework, this is where egregious mistakes get made. And it leads to ridiculously complex programming models, like .NET’s so-called Constrained Execution Regions. A program limping along, unable to allocate even tiny amounts of memory, can quickly become the enemy of reliability. Chris Brumme’s wondrous Reliability post describes this and related challenges in all its gory glory.

Parts of our system were of course “hardened” in a sense, like the lowest levels of the kernel, where abandonment’s scope would be necessarily wider than a single process. But we kept this to as little code as possible.

For the rest? Yes, you guessed it: abandonment. Nice and simple.

It was surprising how much of this we got away with. I attribute most of this to the isolation model. In fact, we could intentionally let a process suffer OOM, and ensuing abandonment, as a result of resource management policy, and still remain confident that stability and recovery were built in to the overall architecture.

It was possible to opt-in to recoverable failure for individual allocations if you really wanted. This was not common in the slightest, however the mechanisms to support it were there. Perhaps the best motivating example is this: imagine your program wants to allocate a buffer of 1MB in size. This situation is different than your ordinary run-of-the-mill sub-1KB object allocation. A developer may very well be prepared to think and explicitly deal with the fact that a contiguous block of 1MB in size might not be available, and deal with it accordingly. For example:

var bb = try new byte[1024*1024] else catch;
if (bb.Failed) {
    // Handle allocation failure.
}

Stack overflow is a simple extension of this same philosophy. Stack is just a memory-backed resource. In fact, thanks to our asynchronous linked stacks model, running out of stack was physically identical to running out of heap memory, so the consistency in how it was dealt with was hardly surprising to developers. Many systems treat stack overflow this way these days.
Assertions

An assertion was a manual check in the code that some condition held true, triggering abandonment if it did not. As with most systems, we had both debug-only and release code assertions, however unlike most other systems, we had more release ones than debug. In fact, our code was peppered liberally with assertions. Most methods had multiple.

This kept with the philosophy that it’s better to find a bug at runtime than to proceed in the face of one. And, of course, our backend compiler was taught how to optimize them aggressively as with everything else. This level of assertion density is similar to what guidelines for highly reliable systems suggest. For example, from NASA’s paper, The Power of Ten -Rules for Developing Safety Critical Code:

    Rule: The assertion density of the code should average to a minimum of two assertions per function. Assertions are used to check for anomalous conditions that should never happen in real-life executions. Assertions must always be side-effect free and should be defined as Boolean tests.

    Rationale: Statistics for industrial coding efforts indicate that unit tests often find at least one defect per 10 to 100 lines of code written. The odds of intercepting defects increase with assertion density. Use of assertions is often also recommended as part of strong defensive coding strategy.

To indicate an assertion, you simply called Debug.Assert or Release.Assert:

void Foo() {
    Debug.Assert(something); // Debug-only assert.
    Release.Assert(something); // Always-checked assert.
}

We also implemented functionality akin to __FILE__ and __LINE__ macros like in C++, in addition to __EXPR__ for the text of the predicate expression, so that abandonments due to failed assertions contained useful information.

In the early days, we used different “levels” of assertions than these. We had three levels, Contract.Strong.Assert, Contract.Assert, and Contract.Weak.Assert. The strong level meant “always checked,” the middle one meant “it’s up to the compiler,” and the weak one meant “only checked in debug mode.” I made the controversial decision to move away from this model. In fact, I’m pretty sure 49.99% of the team absolutely hated my choice of terminology (Debug.Assert and Release.Assert), but I always liked them because it’s pretty unambiguous what they do. The problem with the old taxonomy was that nobody ever knew exactly when the assertions would be checked; confusion in this area is simply not acceptable, in my opinion, given how important good assertion discipline is to the reliability of one’s program.

As we moved contracts to the language (more on that soon), we tried making assert a keyword too. However, we eventually switched back to using APIs. The primary reason was that assertions were not part of an API’s signature like contracts are; and given that assertions could easily be implemented as a library, it wasn’t clear what we gained from having them in the language. Furthermore, policies like “checked in debug” versus “checked in release” simply didn’t feel like they belonged in a programming language. I’ll admit, years later, I’m still on the fence about this.
Contracts

Contracts were the central mechanism for catching bugs in Midori. Despite us beginning with Singularity, which used Sing#, a variant of Spec#, we quickly moved away to vanilla C# and had to rediscover what we wanted. We ultimately ended up in a very different place after living with the model for years.

All contracts and assertions were proven side-effect free thanks to our language’s understanding of immutability and side-effects. This was perhaps the biggest area of language innovation, so I’ll be sure to write a post about it soon.

As with other areas, we were inspired and influenced by many other systems. Spec# is the obvious one. Eiffel was hugely influential especially as there are many published case studies to learn from. Research efforts like Ada-based SPARK and proposals for realtime and embedded systems too. Going deeper into the theoretical rabbit’s hole, programming logic like Hoare’s axiomatic semantics provide the foundation for all of it. For me, however, the most philosophical inspiration came from CLU’s, and later Argus’s, overall approach to error handling.
Preconditions and Postconditions

The most basic form of contract is a method precondition. This states what conditions must hold for the method to be dispatched. This is most often used to validate arguments. Sometimes it’s used to validate the state of the target object, however this was generally frowned upon, since modality is a tough thing for programmers to reason about. A precondition is essentially a guarantee the caller provides to the callee.

In our final model, a precondition was stated using the requires keyword:

void Register(string name)
    requires !string.IsEmpty(name) {
    // Proceed, knowing the string isn't empty.
}

A slightly less common form of contract is a method postcondition. This states what conditions hold after the method has been dispatched. This is a guarantee the callee provides to the caller.

In our final model, a postcondition was stated using the ensures keyword:

void Clear()
    ensures Count == 0 {
    // Proceed; the caller can be guaranteed the Count is 0 when we return.
}

It was also possible to mention the return value in the postcondition, through the special name return. Old values – such as necessary for mentioning an input in a post-condition – could be captured through old(..); for example:

int AddOne(int value)
    ensures return == old(value)+1 {
    ...
}

Of course, pre- and postconditions could be mixed. For example, from our ring buffer in the Midori kernel:

public bool PublishPosition()
    requires RemainingSize == 0
    ensures UnpublishedSize == 0 {
    ...
}

This method could safely execute its body knowing that RemainingSize is 0 and callers could safely execute after the return knowing that UnpublishedSize is also 0.

If any of these contracts are found to be false at runtime, abandonment occurs.

This is an area where we differ from other efforts. Contracts have recently became popular as an expression of program logics used in advanced proof techniques. Such tools prove truths or falsities about stated contracts, often using global analysis. We took a simpler approach. By default, contracts are checked at runtime. If a compiler could prove truth or falsehood at compile-time, it was free to elide runtime checks or issue a compile-time error, respectively.

Modern compilers have constraint-based analyses that do a good job at this, like the range analysis I mentioned in my last post. These propagate facts and use them to optimize code already. This includes eliminating redundant checks: either explicitly encoded in contracts, or in normal program logic. And they are trained to perform these analyses in reasonable amounts of time, lest programmers switch to a different, faster compiler. The theorem proving techniques simply did not scale for our needs; our core system module took over a day to analyze using the best in breed theorem proving analysis framework!

Furthermore, the contracts a method declared were part of its signature. This meant they would automatically show up in documentation, IDE tooltips, and more. A contract was as important as a method’s return and argument types. Contracts really were just an extension of the type system, using arbitrary logic in the language to control the shape of exchange types. As a result, all the usual subtyping requirements applied to them. And, of course, this facilitated modular local analysis which could be done in seconds using standard optimizing compiler techniques.

90-something% of the typical uses of exceptions in .NET and Java became preconditions. All of the ArgumentNullException, ArgumentOutOfRangeException, and related types and, more importantly, the manual checks and throws were gone. Methods are often peppered with these checks in C# today; there are thousands of these in .NET’s CoreFX repo alone. For example, here is System.IO.TextReader’s Read method:

/// <summary>
/// ...
/// </summary>
/// <exception cref="ArgumentNullException">Thrown if buffer is null.</exception>
/// <exception cref="ArgumentOutOfRangeException">Thrown if index is less than zero.</exception>
/// <exception cref="ArgumentOutOfRangeException">Thrown if count is less than zero.</exception>
/// <exception cref="ArgumentException">Thrown if index and count are outside of buffer's bounds.</exception>
public virtual int Read(char[] buffer, int index, int count) {
    if (buffer == null) {
        throw new ArgumentNullException("buffer");
    }
    if (index < 0) {
        throw new ArgumentOutOfRangeException("index");
    }
    if (count < 0) {
        throw new ArgumentOutOfRangeException("count");
    }
    if (buffer.Length - index < count) {
        throw new ArgumentException();
    }
    ...
}

This is broken for a number of reasons. It’s laboriously verbose, of course. All that ceremony! But we have to go way out of our way to document the exceptions when developers really ought not to ever catch them. Instead, they should find the bug during development and fix it. All this exception nonsense encourages very bad behavior.

If we use Midori-style contracts, on the other hand, this collapses to:

/// <summary>
/// ...
/// </summary>
public virtual int Read(char[] buffer, int index, int count)
    requires buffer != null
    requires index >= 0
    requires count >= 0
    requires buffer.Length - index >= count {
    ...
}

There are a few appealing things about this. First, it’s more concise. More importantly, however, it self-describes the contract of the API in a way that documents itself and is easy to understand by callers. Rather than requiring programmers to express the error condition in English, the actual expressions are available for callers to read, and tools to understand and leverage. And it uses abandonment to communicate failure.

I should also mention we had plenty of contracts helpers to help developers write common preconditions. The above explicit range checking is very messy and easy to get wrong. Instead, we could have written:

public virtual int Read(char[] buffer, int index, int count)
    requires buffer != null
    requires Range.IsValid(index, count, buffer.Length) {
    ...
}

And, totally aside from the conversation at hand, coupled with two advanced features – arrays as slices and non-null types – we could have reduced the code to the following, while preserving the same guarantees:

public virtual int Read(char[] buffer) {
    ...
}

But I’m jumping way ahead …
Humble Beginnings

Although we landed on the obvious syntax that is very Eiffel- and Spec#-like – coming full circle – as I mentioned earlier, we really didn’t want to change the language at the outset. So we actually began with a simple API approach:

public bool PublishPosition() {
    Contract.Requires(RemainingSize == 0);
    Contract.Ensures(UnpublishedSize == 0);
    ...
}

There are a number of problems with this approach, as the .NET Code Contracts effort discovered the hard way.

First, contracts written this way are part of the API’s implementation, whereas we want them to be part of the signature. This might seem like a theoretical concern but it is far from being theoretical. We want the resulting program to contain built-in metadata so tools like IDEs and debuggers can display the contracts at callsites. And we want tools to be in a position to auto-generate documentation from the contracts. Burying them in the implementation doesn’t work unless you somehow disassemble the method to extract them later on (which is a hack).

This also makes it tough to integrate with a backend compiler which we found was necessary for good performance.

Second, you might have noticed an issue with the call to Contract.Ensures. Since Ensures is meant to hold on all exit paths of the function, how would we implement this purely as an API? The answer is, you can’t. One approach is rewriting the resulting MSIL, after the language compiler emitted it, but that’s messy as all heck. At this point, you begin to wonder, why not simply acknowledge that this is a language expressivity and semantics issue, and add syntax?

Another area of perpetual struggle for us was whether contracts are conditional or not. In many classical systems, you’d check contracts in debug builds, but not the fully optimized ones. For a long time, we had the same three levels for contracts that we did assertions mentioned earlier:

    Weak, indicated by Contract.Weak.*, meaning debug-only.
    Normal, indicated simply by Contract.*, leaving it as an implementation decision when to check them.
    Strong, indicated by Contract.Strong.*, meaning always checked.

I’ll admit, I initially found this to be an elegant solution. Unfortunately, over time we found that there was constant confusion about whether “normal” contracts were on in debug, release, or all of the above (and so people misused weak and strong accordingly). Anyway, when we began integrating this scheme into the language and backend compiler toolchain, we ran into substantial issues and had to backpedal a little bit.

First, if you simply translated Contract.Weak.Requires to weak requires and Contract.Strong.Requires to strong requires, in my opinion, you end up with a fairly clunky and specialized language syntax, with more policy than made me comfortable. It immediately calls out for parameterization and substitutability of the weak/strong policies.

Next, this approach introduces a sort of new mode of conditional compilation that, to me, felt awkward. In other words, if you want a debug-only check, you can already say something like:

#if DEBUG
    requires X
#endif

Finally – and this was the nail in the coffin for me – contracts were supposed to be part of an API’s signature. What does it even mean to have a conditional contract? How is a tool supposed to reason about it? Generate different documentation for debug builds than release builds? Moreover, as soon as you do this, you lose a critical guarantee, which is that code doesn’t run if its preconditions aren’t met.

As a result, we nuked the entire conditional compilation scheme.

We ended up with a single kind of contract: one that was part of an API’s signature and checked all the time. If a compiler could prove the contract was satisfied at compile-time – something we spent considerable energy on – it was free to elide the check altogether. But code was guaranteed it would never execute if its preconditions weren’t satisfied. For cases where you wanted conditional checks, you always had the assertion system (described above).

I felt better about this bet when we deployed the new model and found that lots of people had been misusing the “weak” and “strong” notions above out of confusion. Forcing developers to make the decision led to healthier code.
Future Directions

A number of areas of development were at varying stages of maturity when our project wound down.
Invariants

We experimented a lot with invariants. Anytime we spoke to someone versed in design-by-contract, they were borderline appalled that we didn’t have them from day one. To be honest, our design did include them from the outset. But we never quite got around to finishing the implementation and deploying it. This was partly just due to engineering bandwidth, but also because some difficult questions remained. And honestly the team was almost always satisfied with the combination of pre- and post-conditions plus assertions. I suspect that in the fullness of time we’d have added invariants for completeness, but to this day some questions remain for me. I’d need to see it in action for a while.

The approach we had designed was where an invariant becomes a member of its enclosing type; for example:

public class List<T> {
    private T[] array;
    private int count;
    private invariant index >= 0 && index < array.Length;
...
}

Notice that the invariant is marked private. An invariant’s accessibility modifier controlled which members the invariant was required to hold for. For example, a public invariant only had to hold at the entry and exit of functions with public accessibility; this allowed for the common pattern of private functions temporarily violating invariants, so long as public entrypoints preserved them. Of course, as in the above example, a class was free to declare a private invariant too, which was required to hold at all function entries and exits.

I actually quite liked this design, and I think it would have worked. The primary concern we all had was the silent introduction of checks all over the place. To this day, that bit still makes me nervous. For example, in the List<T> example, you’d have the index >= 0 && index < array.Length check at the beginning and end of every single function of the type. Now, our compiler eventually got very good at recognizing and coalescing redundant contract checks; and there were ample cases where the presence of a contract actually made code quality better. However, in the extreme example given above, I’m sure there would have been a performance penalty. That would have put pressure on us changing the policy for when invariants are checked, which would have possibly complicated the overall contracts model.

I really wish we had more time to explore invariants more deeply. I don’t think the team sorely missed not having them – certainly I didn’t hear much complaining about their absence (probably because the team was so performance conscious) – but I do think invariants would have been a nice icing to put on the contracts cake.
Advanced Type Systems

I always liked to say that contracts begin where the type system leaves off. A type system allows you to encode attributes of variables using types. A type limits the expected range values that a variable might hold. A contract similarly checks the range of values that a variable holds. The difference? Types are proven at compile-time through rigorous and composable inductive rules that are moderately inexpensive to check local to a function, usually, but not always, aided by developer-authored annotations. Contracts are proven at compile-time where possible and at runtime otherwise, and as a result, permit far less rigorous specification using arbitrary logic encoded in the language itself.

Types are preferable, because they are guaranteed to be compile-time checked; and guaranteed to be fast to check. The assurances given to the developer are strong and the overall developer productivity of using them is better.

Limitations in a type system are inevitable, however; a type system needs to leave some wiggle room, otherwise it quickly grows unwieldly and unusable and, in the extreme, devolves into bi-value bits and bytes. On the other hand, I was always disappointed by two specific areas of wiggle room that required the use of contracts:

    Nullability.
    Numeric ranges.

Approximately 90% of our contracts fell into these two buckets. As a result, we seriously explored more sophisticated type systems to classify the nullability and ranges of variables using the type system instead of contracts.

To make it concrete, this was the difference between this code which uses contracts:

public virtual int Read(char[] buffer, int index, int count)
    requires buffer != null
    requires index >= 0
    requires count >= 0
    requires buffer.Length - index < count {
    ...
}

And this code which didn’t need to, and yet carried all the same guarantees, checked statically at compile-time:

public virtual int Read(char[] buffer) {
    ...
}

Placing these properties in the type system significantly lessens the burden of checking for error conditions. Lets say that for any given 1 producer of state there are 10 consumers. Rather than having each of those 10 defend themselves against error conditions, we can push the responsibility back onto that 1 producer, and either require a single assertion that coerces the type, or even better, that the value is stored into the right type in the first place.
Non-Null Types

The first one’s really tough: guaranteeing statically that variables do not take on the null value. This is what Tony Hoare has famously called his “billion dollar mistake”. Fixing this for good is a righteous goal for any language and I’m happy to see newer language designers tackling this problem head-on.

Many areas of the language fight you every step of the way on this one. Generics, zero-initialization, constructors, and more. Retrofitting non-null into an existing language is tough!
The Type System

In a nutshell, non-nullability boiled down to some simple type system rules:

    All unadorned types T were non-null by default.
    Any type could be modified with a ?, as in T?, to mark it nullable.
    null is an illegal value for variables of non-null types.
    T implicitly converts to T?. In a sense, T is a subtype of T? (although not entirely true).
    Operators exist to convert a T? to a T, with runtime checks that abandoned on null.

Most of this is probably “obvious” in the sense that there aren’t many choices. The name of the game is systematically ensuring all avenues of null are known to the type system. In particular, no null can ever “sneakily” become the value of a non-null T type; this meant addressing zero-initialization, perhaps the hardest problem of all.
The Syntax

Syntactically, we offered a few ways to accomplish #5, converting from T? to T. Of course, we discouraged this, and preferred you to stay in “non-null” space as long as possible. But sometimes it’s simply not possible. Multi-step initialization happens from time to time – especially with collections data structures – and had to be supported.

Imagine for a moment we have a map:

Map<int, Customer> customers = ...;

This tells us three things by construction:

    The Map itself is not null.
    The int keys inside of it will not be null.
    The Customer values inside of it will also not be null.

Let’s now say that the indexer actually returns null to indicate the key was missing:

public TValue? this[TKey key] {
    get { ... }
}

Now we need some way of checking at callsites whether the lookup succeeded. We debated many syntaxes.

The easiest we landed on was a guarded check:

Customer? customer = customers[id];
if (customer != null) {
    // In here, `customer` is of non-null type `Customer`.
}

I’ll admit, I was always on the fence about the “magical” type coercions. It annoyed me that it was hard to figure out what went wrong when it failed. For example, it didn’t work if you compared c to a variable that held the null value, only the literal null. But the syntax was easy to remember and usually did the right thing.

These checks dynamically branch to a different piece of logic if the value is indeed null. Often you’d want to simply assert that the value is non-null and abandon otherwise. There was an explicit type-assertion operator to do that:

Customer? maybeCustomer = customers[id];
Customer customer = notnull(maybeCustomer);

The notnull operator turned any expression of type T? into an expression of type T.
Generics

Generics are hard, because there are multiple levels of nullability to consider. Consider:

class C {
    public T M<T>();
    public T? N<T>();
}

var a = C.M<object>();
var b = C.M<object?>();
var c = C.N<object>();
var d = C.N<object?>();

The basic question is, what are the types of a, b, c, and d?

I think we made this one harder initially than we needed to largely because C#’s existing nullable is a pretty odd duck and we got distracted trying to mimic it too much. The good news is we finally found our way, but it took a while.

To illustrate what I mean, let’s go back to the example. There are two camps:

    The .NET camp: a is object; b, c, and d are object?.
    The functional language camp: a is object; b and c are object?; d is object??.

In other words, the .NET camp thinks you should collapse any sequence of 1 or more ?s into a single ?. The functional language camp – who understands the elegance of mathematical composition – eschews the magic and lets the world be as it is. We eventually realized that the .NET route is incredibly complex, and requires runtime support.

The functional language route does bend your mind slightly at first. For example, the map example from earlier:

Map<int, Customer?> customers = ...;
Customer?? customer = customers[id];
if (customer != null) {
    // Notice, `customer` is still `Customer?` in here, and could still be `null`!
}

In this model, you need to peel off one layer of ? at a time. But honestly, when you stop to think about it, that makes sense. It’s more transparent and reflects precisely what’s going on under here. Best not to fight it.

There’s also the question of implementation. The easiest implementation is to expand T? into some “wrapper type,” like Maybe<T>, and then inject the appropriate wrap and unwrap operations. Indeed, that’s a reasonable mental model for how the implementation works. There are two reasons this simple model doesn’t work, however.

First, for reference type T, T? must not carry a wasteful extra bit; a pointer’s runtime representation can carry null as a value already, and for a systems language, we’d like to exploit this fact and store T? as efficiently as T. This can be done fairly easily by specializing the generic instantiation. But this does mean that non-null can no longer simply be a front-end trick. It requires back-end compiler support.

(Note that this trick is not so easy to extend to T??!)

Second, Midori supported safe covariant arrays, thanks to our mutability annotations. If T and T? have a different physical representation, however, then converting T[] to T?[] is a non-transforming operation. This was a minor blemish, particularly since covariant arrays become far less useful once you plug the safety holes they already have.

Anyway, we eventually burned the ships on .NET Nullable<T> and went with the more composable multi-? design.
Zero-Initialization

Zero-initialization is a real pain in the butt. To tame it meant:

    All non-null fields of a class must be initialized at construction time.
    All arrays of non-null elements must be fully initialized at construction time.

But it gets worse. In .NET, value types are implicitly zero-initialized. The initial rule was therefore:

    All fields of a struct must be nullable.

But that stunk. It infected the whole system with nullable types immediately. My hypothesis was that nullability only truly works if nullable is the uncommon (say 20%) case. This would have destroyed that in an instant.

So we went down the path of eliminating automatic zero-initialization semantics. This was quite a large change. (C# 6 went down the path of allowing structs to provide their own zero-arguments constructors and eventually had to back it out due to the sheer impact this had on the ecosystem.) It could have been made to work but veered pretty far off course, and raised some other problems that we probably got too distracted with. If I could do it all over again, I’d just eliminate the value vs. reference type distinction altogether in C#. The rationale for that’ll become clearer in an upcoming post on battling the garbage collector.
The Fate of Non-Null Types

We had a solid design, and several prototypes, but never deployed this one across the entire operating system. The reason why was tied up in our desired level of C# compatibility. To be fair, I waffled on this one quite a bit, and I suppose it was ultimately my decision. In the early days of Midori, we wanted “cognitive familiarity.” In the later days of the project, we actually considered whether all of the features could be done as “add on” extensions to C#. It was that later mindset that prevented us from doing non-null types in earnest. My belief to this day is that additive annotations just won’t work; Spec# tried this with ! and the polarity always felt inverted. Non-null needs to be the default for this to have the impact we desired.

One of my biggest regrets is that we waited so long on non-null types. We only explored it in earnest once contracts were a known quantity, and we noticed the thousands of requires x != nulls all over the place. It would have been complex and expensive, however this would have been a particularly killer combination if we nuked the value type distinction at the same time. Live and learn!

If we shipped our language as a standalone thing, different from C# proper, I’m convinced this would have made the cut.
Range Types

We had a design for adding range types to C#, but it always remained one step beyond my complexity limit.

The basic idea is that any numeric type can be given a lower and upper bound type parameter. For example, say you had an integer that could only hold the numbers 0 through 1,000,000, exclusively. It could be stated as int<0..1000000>. Of course, this points out that you probably should be using a uint instead and the compiler would warn you. In fact, the full set of numbers could be conceptually represented as ranges in this way:

typedef byte number<0..256>;
typedef sbyte number<-128..128>;
typedef short number<-32768..32768>;
typedef ushort number<0..65536>;
typedef int number<-2147483648..2147483648>;
typedef uint number<0..4294967295>;
// And so on ...

The really “cool” – but scary complicated – part is to then use dependent types to permit symbolic range parameters. For example, say I have an array and want to pass an index whose range is guaranteed to be in-bounds. Normally I’d write:

T Get(T[] array, int index)
        requires index >= 0 && index < array.Length {
    return array[index];
}

Or maybe I’d use a uint to eliminate the first half of the check:

T Get(T[] array, uint index)
        index < array.Length {
    return array[index];
}

Given range types, I can instead associate the upper bound of the number’s range with the array length directly:

T Get(T[] array, number<0, array.Length> index) {
    return array[index];
}

Of course, there’s no guarantee the compiler will eliminate the bounds check, if you somehow trip up its alias analysis. But we would hope that it does no worse a job with these types than with normal contracts checks. And admittedly this approach is a more direct encoding of information in the type system.

Anyway, I still chalk this one up to a cool idea, but one that’s still in the realm of “nice to have but not critical.”

The “not critical” aspect is especially true thanks to slices being first class in the type system. I’d say 66% or more of the situations where range checks were used would have been better written using slices. I think mainly people were still getting used to having them and so they’d write the standard C# thing rather than just using a slice. I’ll cover slices in an upcoming post, but they removed the need for writing range checks altogether in most code.
Recoverable Errors: Type-Directed Exceptions

Abandonment isn’t the only story, of course. There are still plenty of legitimate situations where an error the programmer can reasonably recover from occurs. Examples include:

    File I/O.
    Network I/O.
    Parsing data (e.g., a compiler parser).
    Validating user data (e.g., a web form submission).

In each of these cases, you usually don’t want to trigger abandonment upon encountering a problem. Instead, the program expects it to occur from time to time, and needs to deal with it by doing something reasonable. Often by communicating it to someone: the user typing into a webpage, the administrator of the system, the developer using a tool, etc. Of course, abandonment is one method call away if that’s the most appropriate action to take, but it’s often too drastic for these situations. And, especially for IO, it runs the risk of making the system very brittle. Imagine if the program you’re using decided to wink out of existence every time your network connection dropped a packet!
Enter Exceptions

We used exceptions for recoverable errors. Not the unchecked kind, and not quite the Java checked kind, either.

First thing’s first: although Midori had exceptions, a method that wasn’t annotated as throws could never throw one. Never ever ever. There were no sneaky RuntimeExceptions like in Java, for instance. We didn’t need them anyway, because the same situations Java used runtime exceptions for were instead using abandonment in Midori.

This led to a magical property of the result system. 90-something% of the functions in our system could not throw exceptions! By default, in fact, they could not. This was a stark contrast to systems like C++ where you must go out of your way to abstain from exceptions and state that fact using noexcept. APIs could still fail due to abandonment, of course, but only when callers fail meet the stated contract, similar to passing an argument of the wrong type.

Our choice of exceptions was controversial at the outset. We had a mixture of imperative, procedural, object oriented, and functional language perspective on the team. The C programmers wanted to use error codes and were worried we would recreate the Java, or worse, C# design. The functional perspective would be to use dataflow for all errors, but exceptions were very control-flow-oriented. In the end, I think what we chose was a nice compromise between all of the available recoverable error models available to us. As we’ll see later, we did offer a mechanism for treating errors as first class values for that rare case where a more dataflow style of programming was what the developer wanted.

Most importantly, however, we wrote a lot of code in this model, and it worked very well for us. Even the functional language guys came around eventually. As did the C programmers, thanks to some cues we took from return codes.
Language and Type System

At some point, I made a controversial observation and decision. Just as you wouldn’t change a function’s return type with the expectation of zero compatibility impact, you should not be changing a function’s exception type with such an expectation. In other words, an exception, as with error codes, is just a different kind of return value!

This has been one of the parroted arguments against checked exceptions. My answer may sound trite, but it’s simple: too bad. You’re in a statically typed programming language, and the dynamic nature of exceptions is precisely the reason they suck. We sought to address these very problems, so therefore we embraced it, embellished strong typing, and never looked back. This alone helped to bridge the gap between error codes and exceptions.

Exceptions thrown by a function became part of its signature, just as parameters and return values are. Remember, due to the rare nature of exceptions compared to abandonment, this wasn’t as painful as you might think. And a lot of intuitive properties flowed naturally from this decision.

The first thing is the Liskov substitution principle. In order to avoid the mess that C++ found itself in, all “checking” has to happen statically, at compile time. As a result, all of those performance problems mentioned in the WG21 paper were not problems for us. This type system must be bulletproof, however, with no backdoors to defeat it. Because we needed to address those performance challenges by depending on throws annotations in our optimizing compiler, type safety hinged on this property.

We tried many many different syntaxes. Before we committed to changing the language, we did everything with C# attributes and static analysis. The user experience wasn’t very good and it’s hard to do a real type system that way. Furthermore, it felt too bolted on. We experimented with approaches from the Redhawk project – what eventually became .NET Native and CoreRT – however, that approach also didn’t leverage the language and relied instead on static analysis, though it shares many similar principles with our final solution.

The basic gist of the final syntax was to simply state a method throws as a single bit:

void Foo() throws {
    ...
}

(For many years, we actually put the throws at the beginning of the method, but that read wrong.)

At this point, the issue of substitutability is quite simple. A throws function cannot take the place of a non- throws function (illegal strengthening). A non-throws function, on the other hand, can take the place of a throws function (legal weakening). This obviously impacts virtual overrides, interface implementation, and lambdas.

Of course, we did the expected co- and contravariance substitution bells and whistles. For example, if Foo were virtual and you overrode it but didn’t throw exceptions, you didn’t need to state the throws contract. Anybody invoking such a function virtually, of course, couldn’t leverage this but direct calls could.

For example, this is legal:

class Base {
    public virtual void Foo() throws {...}
}

class Derived : Base {
    // My particular implementation doesn't need to throw:
    public override void Foo() {...}
}

and callers of Derived could leverage the lack of throws; whereas this is wholly illegal:

class Base {
    public virtual void Foo () {...}
}

class Derived : Base {
    public override void Foo() throws {...}
}

Encouraging a single failure mode was quite liberating. A vast amount of the complexity that comes with Java’s checked exceptions evaporated immediately. If you look at most APIs that fail, they have a single failure mode anyway (once all bug failure modes are done with abandonment): IO failed, parsing failed, etc. And many recovery actions a developer tends to write don’t actually depend on the specifics of what exactly failed when, say, doing an IO. (Some do, and for those, the keeper pattern is often the better answer; more on this topic shortly.) Most of the information in modern exceptions are not actually there for programmatic use; instead, they are for diagnostics.

We stuck with just this “single failure mode” for 2-3 years. Eventually I made the controversial decision to support multiple failure modes. It wasn’t common, but the request popped up reasonably often from teammates, and the scenarios seemed legitimate and useful. It did come at the expense of type system complexity, but only in all the usual subtyping ways. And more sophisticated scenarios – like aborts (more on that later) – required that we do this.

The syntax looked like this:

int Foo() throws FooException, BarException {
    ...
}

In a sense, then, the single throws was a shortcut for throws Exception.

It was very easy to “forget” the extra detail if you didn’t care. For example, perhaps you wanted to bind a lambda to the above Foo API, but didn’t want callers to care about FooException or BarException. That lambda must be marked throws, of course, but no more detail was necessary. This turned out to be a very common pattern: An internal system would use typed exceptions like this for internal control flow and error handling, but translate all of them into just plain throws at the public boundary of the API, where the extra detail wasn’t required.

All of this extra typing added great power to recoverable errors. But if contracts outnumbered exceptions by 10:1, then simple throws exceptional methods outnumbered multi-failure-mode ones by another 10:1.

At this point, you may be wondering, what differentiated this from Java’s checked exceptions?

    The fact that the lion’s share of errors were expressed using abandonment meant most APIs didn’t throw.

    The fact that we encouraged a single mode of failure simplified the entire system greatly. Moreover, we made it easy to go from the world of multiple modes, to just a single and back again.

The rich type system support around weakening and strengthening also helped, as did something else we did to that helped bridge the gap between return codes and exceptions, improved code maintainability, and more …
Easily Auditable Callsites

At this point in the story, we still haven’t achieved the full explicit syntax of error codes. The declarations of functions say whether they can fail (good), but callers of those functions still inherit silent control flow (bad).

This brings about something I always loved about our exceptions model. A callsite needs to say try:

int value = try Foo();

This invokes the function Foo, propagates its error if one occurs, and assigns the return value to value otherwise.

This has a wonderful property: all control flow remains explicit in the program. You can think of try as a kind of conditional return (or conditional throw if you prefer). I freaking loved how much easier this made code reviewing error logic! For example, imagine a long function with a few trys inside of it; having the explicit annotation made the points of failure, and therefore control flow, as easy to pick out as return statements:

void doSomething() throws {
    blah();
    var x = blah_blah(blah());
    var y = try blah(); // <-- ah, hah! something that can fail!
    blahdiblahdiblahdiblahdi();
    blahblahblahblah(try blahblah()); // <-- another one!
    and_so_on(...);
}

If you have syntax highlighting in your editor, so the trys are bold and blue, it’s even better.

This delivered many of the strong benefits of return codes, but without all the baggage.

(Both Rust and Swift now support a similar syntax. I have to admit I’m sad we didn’t ship this to the general public years ago. Their implementations are very different, however consider this a huge vote of confidence in their syntax.)

Of course, if you are trying a function that throws like this, there are two possibilities:

    The exception escapes the calling function.
    There is a surrounding try/catch block that handles the error.

In the first case, you are required to declare that your function throws too. It is up to you whether to propagate strong typing information should the callee declare it, or simply leverage the single throws bit, of course.

In the second case, we of course understood all the typing information. As a result, if you tried to catch something that wasn’t declared as being thrown, we could give you an error about dead code. This was yet another controversial departure from classical exceptions systems. It always bugged me that catch (FooException) is essentially hiding a dynamic type test. Would you silently permit someone to call an API that returns just object and automatically assign that returned value to a typed variable? Hell no! So we didn’t let you do that with exceptions either.

Here too CLU influenced us. Liskov talks about this in A History of CLU:

    CLU’s mechanism is unusual in its treatment of unhandled exceptions. Most mechanisms pass these through: if the caller does not handle an exception raised by a called procedure, the exception is propagated to its caller, and so on. We rejected this approach because it did not fit our ideas about modular program construction. We wanted to be able to call a procedure knowing just its specification, not its implementation. However, if exceptions are propagated automatically, a procedure may raise an exception not described in its specification.

Although we discouraged wide try blocks, this was conceptually a shortcut for propagating an error code. To see what I mean, consider what you’d do in a system with error codes. In Go, you might say the following:

if err := doSomething(); err != nil {
    return err
}

In our system, you say:

try doSomething();

But we used exceptions, you might say! It’s completely different! Sure, the runtime systems differ. But from a language “semantics” perspective, they are isomorphic. We encouraged people to think in terms of error codes and not the exceptions they knew and loved. This might seem funny: Why not just use return codes, you might wonder? In an upcoming section, I will describe the true isomorphism of the situation to try to convince you of our choice.
Syntactic Sugar

We also offered some syntactic sugar for dealing with errors. The try/catch block scoping construct is a bit verbose, especially if you’re following our intended best practices of handling errors as locally as possible. It also still retains a bit of that unfortunate goto feel for some, especially if you are thinking in terms of return codes. That gave way to a type we called Result<T>, which was simply either a T value or an Exception.

This essentially bridged from the world of control-flow to the world of dataflow, for scenarios in which the latter was more natural. Both certainly had their place, although most developers preferred the familiar control flow syntax.

To illustrate common usage, imagine you want to log all errors that occur, before repropagating the exception. Though this is a common pattern, using try/catch blocks feels a little too control flow heavy for my taste:

int v;
try {
    v = try Foo();
    // Maybe some more stuff...
}
catch (Exception e) {
    Log(e);
    rethrow;
}
// Use the value `v`...

The “maybe some more stuff” bit entices you to squeeze more than you should into the try block. Compare this to using Result<T>, leading to a more return-code feel and more convenient local handling:

Result<int> value = try Foo() else catch;
if (value.IsFailure) {
    Log(value.Exception);
    throw value.Exception;
}
// Use the value `value.Value`...

The try ... else construct also permitted you to substitute your own value instead, or even trigger abandonment, in response to failure:

int value1 = try Foo() else 42;
int value2 = try Foo() else Release.Fail();

We also supported NaN-style propagation of dataflow errors by lifting access to Ts members out of the Result<T>. For example, let’s say I have two Result<int>s and want to add them together. I can do so:

Result<int> x = ...;
Result<int> y = ...;
Result<int> z = x + y;

Notice that third line, where we added the two Result<int>s together, yielding a – that’s right – third Result<T>. This is the NaN-style dataflow propagation, similar to C#’s new .? feature.

This approach blends what I found to be an elegant mixture of exceptions, return codes, and dataflow error propagation.
Implementation

The model I just described doesn’t have to be implemented with exceptions. It’s abstract enough to be reasonably implemented using either exceptions or return codes. This isn’t theoretical. We actually tried it. And this is what led us to choose exceptions instead of return codes for performance reasons.

To illustrate how the return code implementation might work, imagine some simple transformations:

int foo() throws {
    if (...p...) {
        throw new Exception();
    }
    return 42;
}

becomes:

Result<int> foo() {
    if (...p...) {
        return new Result<int>(new Exception());
    }
    return new Result<int>(42);
}

And code like this:

int x = try foo();

becomes something more like this:

int x;
Result<int> tmp = foo();
if (tmp.Failed) {
    throw tmp.Exception;
}
x = tmp.Value;

An optimizing compiler can represent this more efficiently, eliminating excessive copying. Especially with inlining.

If you try to model try/catch/finally this same way, probably using goto, you’ll quickly see why compilers have a hard time optimizing in the presence of unchecked exceptions. All those hidden control flow edges!

Either way, this exercise very vividly demonstrates the drawbacks of return codes. All that goop – which is meant to be rarely needed (assuming, of course, that failure is rare) – is on hot paths, mucking with your program’s golden path performance. This violates one of our most important principles.

I described the results of our dual mode experiment in my last post. In summary, the exceptions approach was 7% smaller and 4% faster as a geomean across our key benchmarks, thanks to a few things:

    No calling convention impact.
    No peanut butter associated with wrapping return values and caller branching.
    All throwing functions were known in the type system, enabling more flexible code motion.
    All throwing functions were known in the type system, giving us novel EH optimizations, like turning try/finally blocks into straightline code when the try could not throw.

There were other aspects of exceptions that helped with performance. I already mentioned that we didn’t grovel the callstack gathering up metadata as most exceptions systems do. We left diagnostics to our diagnostics subsystem. Another common pattern that helped, however, was to cache exceptions as frozen objects, so that each throw didn’t require an allocation:

const Exception retryLayout = new Exception();
...
throw retryLayout;

For systems with high rates of throwing and catching – as in our parser, FRP UI framework, and other areas – this was important to good performance. And this demonstrates why we couldn’t simply take “exceptions are slow” as a given.
Patterns

A number of useful patterns came up that we embellished in our language and libraries.
Concurrency

Back in 2007, I wrote this note about concurrency and exceptions. I wrote it mainly from the perspective of parallel, shared memory computations, however similar challenges exist in all concurrent orchestration patterns. The basic issue is that the way exceptions are implemented assumes single, sequential stacks, with single failure modes. In a concurrent system, you have many stacks and many failure modes, where 0, 1, or many may happen “at once.”

A simple improvement that Midori made was simply ensuring all Exception-related infrastructure handled cases with multiple inner errors. At least then a programmer wasn’t forced to decide to toss away 1/N’th of the failure information, as most exceptions systems encourage today. More than that, however, our scheduling and stack crawling infrastructure fundamentally knew about cactus-style stacks, thanks to our asynchronous model, and what to do with them.

At first, we didn’t support exceptions across asynchronous boundaries. Eventually, however, we extended the ability to declare throws, along with optional typed exceptions clauses, across asynchronous process boundaries. This brought a rich, typed programming model to the asynchronous actors programming model and felt like a natural extension. This borrowed a page from CLU’s successor, Argus.

Our diagnostics infrastructure embellished this to give developers debugging experiences with full-blown cross-process causality in their stack views. Not only are stacks cactuses in a highly concurrent system, but they are often smeared across process message passing boundaries. Being able to debug the system this way was a big time-saver.
Aborts

Sometimes a subsystem needs to “get the hell out of Dodge.” Abandonment is an option, but only in response to bugs. And of course nobody in the process can stop it in its tracks. What if we want to back out the callstack to some point, know that no-one on the stack is going to stop us, but then recover and keep going within the same process?

Exceptions were close to what we wanted here. But unfortunately, code on the stack can catch an in-flight exception, thereby effectively suppressing the abort. We wanted something unsuppressable.

Enter aborts. We invented aborts mainly in support of our UI framework which used Functional Reactive Programming (FRP), although the pattern came up in a few spots. As an FRP recalculation was happening, it’s possible that events would enter the system, or new discoveries got made, that invalidate the current recalculation. If that happened – typically deep within some calculation whose stack was an interleaving of user and system code – the FRP engine needed to quickly get back to top of its stack where it could safely begin a recalculation. Thanks to all of that user code on the stack being functionally pure, aborting it mid-stream was easy. No errant side-effects would be left behind. And all engine code that was traversed was audited and hardened thoroughly, thanks to typed exceptions, to ensure invariants were maintained.

The abort design borrows a page from the capability playbook. First, we introduce a base type called AbortException. It may be used directly or subclassed. One of these is special: nobody can catch-and-ignore it. The exception is reraised automatically at the end of any catch block that attempts to catch it. We say that such exceptions are undeniable.

But someone’s got to catch an abort. The whole idea is to exit a context, not tear down the entire process a la abandonment. And here’s where capabilities enter the picture. Here’s the basic shape of AbortException:

public immutable class AbortException : Exception {
    public AbortException(immutable object token);
    public void Reset(immutable object token);
    // Other uninteresting members omitted...
}

Notice that, at the time of construction, an immutable token is provided; in order to suppress the throw, Reset is called, and a matching token must be provided. If the token doesn’t match, abandonment occurs. The idea is that the throwing and intended catching parties of an abort are usually the same, or at least in cahoots with one another, such that sharing the token securely with one another is easy to do. This is a great example of objects as unforgeable capabilities in action.

And yes, an arbitrary piece of code on the stack can trigger an abandonment, but such code could already do that by simply dereferencing null. This technique prohibits executing in the aborting context when it might not have been ready for it.

Other frameworks have similar patterns. The .NET Framework has ThreadAbortException which is also undeniable unless you invoke Thread.ResetAbort; sadly, because it isn’t capability-based, a clumsy combination of security annotations and hosting APIs are required to stop unintended swallowing of aborts. More often, this goes unchecked.

Thanks to exceptions being immutable, and the token above being immutable, a common pattern was to cache these guys in static variables and use singletons. For example:

class MyComponent {
    const object abortToken = new object();
    const AbortException abortException = new AbortException(abortToken);

    void Abort() throws AbortException {
        throw abortException;
    }

    void TopOfTheStack() {
        while (true) {
            // Do something that calls deep into some callstacks;
            // deep down it might Abort, which we catch and reset:
            let result = try ... else catch<AbortException>;
            if (result.IsFailed) {
                result.Exception.Reset(abortToken);
            }
        }
    }
}

This pattern made aborts very efficient. An average FRP recalculation aborted multiple times. Remember, FRP was the backbone of all UI in the system, so the slowness often attributed to exceptions was clearly not acceptable. Even allocating an exception object would have been unfortunate, due to the ensuing GC pressure.
Opt-in “Try” APIs

I mentioned a number of operations that abandoned upon failure. That included allocating memory, performing arithmetic operations that overflowed or divided-by-zero, etc. In a few of these instances, a fraction of the uses are appropriate for dynamic error propagation and recovery, rather than abandonment. Even if abandonment is better in the common case.

This turned out to be a pattern. Not terribly common, but it came up. As a result, we had a whole set of arithmetic APIs that used a dataflow-style of propagation should overflow, NaN, or any number of things happen.

I also already mentioned a concrete instance of this earlier, which is the ability to try new an allocation, when OOM yields a recoverable error rather than abandonment. This was super uncommon, but could crop up if you wanted to, say, allocate a large buffer for some multimedia operation.
Keepers

The last pattern I’ll cover is called the keeper pattern.

In a lot of ways, the way recoverable exceptions are handled is “inside out.” A bunch of code is called, passing arguments down the callstack, until finally some code is reached that deems that state unacceptable. In the exceptions model, control flow is then propagated back up the callstack, unwinding it, until some code is found that handles the error. At that point if the operation is to be retried, the sequence of calls must be reissued, etc.

An alternative pattern is to use a keeper. The keeper is an object that understands how to recover from errors “in situ,” so that the callstack needn’t be unwound. Instead, the code that would have otherwise thrown an exception consults the keeper, who instructs the code how to proceed. A nice aspect of keepers is that often, when done as a configured capability, surrounding code doesn’t even need to know they exist – unlike exceptions which, in our system, had to be declared as part of the type system. Another aspect of keepers is that they are simple and cheap.

Keepers in Midori could be used for prompt operations, but more often spanned asynchronous boundaries.

The canonical example of a keeper is one guarding filesystem operations. Accessing files and directories on a file system typically has failure modes such as:

    Invalid path specification.
    File not found.
    Directory not found.
    File in use.
    Insufficient privileges.
    Media full.
    Media write-protected.

One option is to annotate each filesystem API with a throws clause for each. Or, like Java, to create an IOException hierarchy with each of these as subclasses. An alternative is to use a keeper. This ensures the overall application doesn’t need to know or care about IO errors, permitting recovery logic to be centralized. Such a keeper interface might look like this:

async interface IFileSystemKeeper {
    async string InvalidPathSpecification(string path) throws;
    async string FileNotFound(string path) throws;
    async string DirectoryNotFound(string path) throws;
    async string FileInUse(string path) throws;
    async Credentials InsufficientPrivileges(Credentials creds, string path) throws;
    async string MediaFull(string path) throws;
    async string MediaWriteProtected(string path) throws;
}

The idea is that, in each case, the relevant inputs are provided to the keeper when failure occurs. The keeper is then permitted to perform an operation, possibly asynchronous, to recover. In many cases, the keeper can optionally return updated arguments for the operation. For example, InsufficientPrivileges could return alternative Credentials to use. (Maybe the program prompted the user and she switched to an account with write access.) In each case shown, the keeper could throw an exception if it didn’t want to handle the error, although this part of the pattern was optional.

Finally, I should note that Windows’s Structured Exception Handling (SEH) system supports “continuable” exceptions which are conceptually attempting to achieve this same thing. They let some code decide how to restart the faulting computation. Unfortunately, they’re done using ambient handlers on the callstack, rather than first class objects in the language, and so are far less elegant – and significantly more error prone – than the keepers pattern.
Future Directions: Effect Typing

Most people asked us about whether having async and throws as type system attributes bifurcated the entire universe of libraries. The answer was “No, not really.” But it sure was painful in highly polymorphic library code.

The most jarring example was combinators like map, filter, sort, etc. In those cases, you often have arbitrary functions and want the async and throws attributes of those functions to “flow through” transparently.

The design we had to solve this was to let you parameterize over effects. For instance, here is a universal mapping function, Map, that propagates the async or throws effect of its func parameter:

U[] Map<T, U, effect E>(T[] ts, Func<T, U, E> func) E {
    U[] us = new U[ts.Length];
    for (int i = 0; i < ts.Length; i++) {
        us[i] = effect(E) func(ts[i]);
    }
    return us;
}

Notice here that we’ve got an ordinary generic type, E, except that its declaration is prefixed by the keyword effect. We then use E symbolically in place of the effects list of the Map signature, in addition to using it in the “propagate” position via effect(E) when invoking func. It’s a pretty trivial exercise in substitution, replacing E with throws and effect(E) with try, to see the logical transformation.

A legal invocation might be:

int[] xs = ...;
string[] ys = try Map<int, string, throws>(xs, x => ...);

Notice here that the throws flows through, so that we can pass a callback that throws exceptions.

As a total aside, we discussed taking this further, and allowing programmers to declare arbitrary effects. I’ve hypothesized about such a type system previously. We were concerned, however, that this sort of higher order programming might be gratuitously clever and hard to understand, no matter how powerful. The simple model above probably would’ve been a sweet spot and I think we’d have done it given a few more months.
Retrospective and Conclusions

We’ve reached the end of this particular journey. As I said at the outset, a relatively predictable and tame outcome. But I hope all that background helped to take you through the evolution as we sorted through the landscape of errors.

In summary, the final model featured:

    An architecture that assumed fine-grained isolation and recoverability from failure.
    Distinguishing between bugs and recoverable errors.
    Using contracts, assertions, and, in general, abandonment for all bugs.
    Using a slimmed down checked exceptions model for recoverable errors, with a rich type system and language syntax.
    Adopting some limited aspects of return codes – like local checking – that improved reliability.

And, though this was a multi-year journey, there were areas of improvement we were actively working on right up until our project’s untimely demise. I classified them differently because we didn’t have enough experience using them to claim success. I would have hoped we’d have tidied up most of them and shipped them if we ever got that far. In particular, I’d have liked to put this one into the final model category:

    Leveraging non-null types by default to eliminate a large class of nullability annotations.

Abandonment, and the degree to which we used it, was in my opinion our biggest and most successful bet with the Error Model. We found bugs early and often, where they are easiest to diagnose and fix. Abandonment-based errors outnumbered recoverable errors by a ratio approaching 10:1, making checked exceptions rare and tolerable to the developer.

Although we never had a chance to ship this, we have since brought some of these lessons learned to other settings.

During the Microsoft Edge browser rewrite from Internet Explorer, for example, we adopted abandonment in a few areas. The key one, applied by a Midori engineer, was OOM. The old code would attempt to limp along as I described earlier and almost always did the wrong thing. My understanding is that abandonment has found numerous lurking bugs, as was our experience regularly in Midori when porting existing codebases. The great thing too is that abandonment is more of an architectural discipline that can be adopted in existing code-bases ranging in programming languages.

The architectural foundation of fine-grained isolation is critical, however many systems have an informal notion of this architecture. A reason why OOM abandonment works well in a browser is that most browsers devote separate processes to individual tabs already. Browsers mimic operating systems in many ways and here too we see this playing out.

More recently, we’ve been exploring proposals to bring some of this discipline – including contracts – to C++. There are also concrete proposals to bring some of these features to C# too. We are actively iterating on a proposal that would bring some non-null checking to C#. I have to admit, I wish all of those proposals the best, however nothing will be as bulletproof as an entire stack written in the same error discipline. And remember, the entire isolation and concurrency model is essential for abandonment at scale.

I am hopeful that continued sharing of knowledge will lead to even more wide-scale adoption some of these ideas.

And, of course, I’ve mentioned that Go, Rust, and Swift have given the world some very good systems-appropriate error models in the meantime. I might have some minor nits here and there, but the reality is that they’re worlds beyond what we had in the industry at the time we began the Midori journey. It’s a good time to be a systems programmer!

Next time I’ll talk more about the language. Specifically, we’ll see how Midori was able to tame the garbage collector using a magical elixir of architecture, language support, and libraries. I hope to see you again soon!

#### Performance culture

[source](http://joeduffyblog.com/2016/04/10/performance-culture/)



In this essay, I’ll talk about “performance culture.” Performance is one of the key pillars of software engineering, and is something that’s hard to do right, and sometimes even difficult to recognize. As a famous judge once said, “I know it when I see it.” I’ve spoken at length about performance and culture independently before, however the intersection of the two is where things get interesting. Teams who do this well have performance ingrained into nearly all aspects of how the team operates from the start, and are able to proactively deliver loveable customer experiences that crush the competition. There’s no easy cookie-cutter recipe for achieving a good performance culture, however there are certainly some best practices you can follow to plant the requisite seeds into your team. So, let’s go!
Introduction

Why the big focus on performance, anyway?

Partly it’s my background. I’ve worked on systems, runtimes, compilers, … things that customers expect to be fast. It’s always much easier to incorporate goals, metrics, and team processes at the outset of such a project, compared to attempting to recover it later on. I’ve also worked on many teams, some that have done amazing at this, some that have done terribly, and many in between. The one universal truth is that the differentiating factor is always culture.

Partly it’s because, no matter the kind of software, performance is almost always worse than our customers would like it to be. This is a simple matter of physics: it’s impossible to speed up all aspects of a program, given finite time, and the tradeoffs involved between size, speed, and functionality. But I firmly believe that on the average teams spend way less attention to developing a rigorous performance culture. I’ve heard the “performance isn’t a top priority for us” statement many times only to later be canceled out by a painful realization that without it the product won’t succeed.

And partly it’s just been top of mind for all of us in DevDiv, as we focus on .NET core performance, ASP.NET scalability, integrating performance-motivated features into C# and the libraries, making Visual Studio faster, and more. It’s particularly top of mind for me, as I’ve been comparing our experiences to my own in Midori (which heavily inspired this blog post).
Diagnosis and The Cure

How can you tell whether your performance culture is on track? Well, here are some signs that it’s not:

    Answering the question, “how is the product doing on my key performance metrics,” is difficult.
    Performance often regresses and team members either don’t know, don’t care, or find out too late to act.
    Blame is one of the most common responses to performance problems (either people, infrastructure, or both).
    Performance tests swing wildly, cannot be trusted, and are generally ignored by most of the team.
    Performance is something one, or a few, individuals are meant to keep an eye on, instead of the whole team.
    Performance issues in production are common, and require ugly scrambles to address (and/or cannot be reproduced).

These may sound like technical problems. It may come as a surprise, however, that they are primarily human problems.

The solution isn’t easy, especially once your culture is in the weeds. It’s always easier to not dig a hole in the first place than it is to climb out of one later on. But the first rule when you’re in a hole is to stop digging! The cultural transformation must start from the top – management taking an active role in performance, asking questions, seeking insights, demanding rigor – while it simultaneously comes from the bottom – engineers actively seeking to understand performance of the code they are writing, ruthlessly taking a zero-tolerance stance on regressions, and being ever-self-critical and on the lookout for proactive improvements.

This essay will describe some ways to ensure this sort of a culture, in addition to some best practices I’ve found help to increase its effectiveness once you have one in place. A lot of it may seem obvious, but believe me, it’s pretty rare to see everything in here working in harmony in practice. But when it is, wow, what a difference it can make.

A quick note on OSS software. I wrote this essay from the perspective of commercial software development. As such, you’ll see the word “management” a lot. Many of the same principles work in OSS too. So, if you like, anytime you see “management,” mentally transform it into “management or the project’s committers.”
It Starts, and Ends, with Culture

The key components of a healthy performance culture are:

    Performance is part of the daily dialogue and “buzz” within the team. Everybody plays a role.
    Management must care – truly, not superficially – about good performance, and understand what it takes.
    Engineers take a scientific, data-driven, inquisitive approach to performance. (Measure, measure, measure!)
    Robust engineering systems are in place to track goals, past and present performance, and to block regressions.

I’ll spend a bit of time talking about each of these roughly in turn.
Dialogue, Buzz, and Communication

The entire team needs to be on the hook for performance.

In many teams where I’ve seen this go wrong, a single person is anointed the go-to performance guy or gal. Now, that’s fine and can help the team scale, can be useful when someone needs to spearhead an investigation, and having a vocal advocate of performance is great, but it must not come at the expense of the rest of the team’s involvement.

This can lead to problems similar to those Microsoft use to have with the “test” discipline; engineers learned bad habits by outsourcing the basic quality of their code, assuming that someone else would catch any problems that arise. The same risks are present when there’s a central performance czar: engineers on the team won’t write performance tests, won’t proactively benchmark, won’t profile, won’t ask questions about the competitive standing of the product, and generally won’t do all the things you need all of the engineers doing to build a healthy performance culture.

Magical things happen when the whole team is obsessed about performance. The hallways are abuzz with excitement, as news of challenges and improvements spreads organically. “Did you see Martin’s hashtable rebalancing change that reduced process footprint by 30%?” “Jared just checked in a feature that lets you stack allocate arrays. I was thinking of hacking the networking stack this weekend to use it – care to join in?” Impromptu whiteboard sessions, off-the-cuff ideation, group learning. It’s really awesome to see. The excitement and desire to win propels the team forward, naturally, and without relying on some heavyweight management “stick.”

I hate blame and I hate defensiveness. My number one rule is “no jerks,” so naturally all critiques must be delivered in the most constructive and respectful way. I’ve found a high occurrence of blame, defensiveness, and intellectual dishonesty in teams that do poorly on performance, however. Like jerks, these are toxic to team culture and must be weeded out aggressively. It can easily make or break your ability to develop the right performance culture. There’s nothing wrong with saying we need to do better on some key metric, especially if you have some good ideas on how to do so!

In addition to the ad-hoc communication, there of course needs to be structured communication also. I’ll describe some techniques later on. But getting a core group of people in a room regularly to discuss the past, present, and future of performance for a particular area of the product is essential. Although the organic conversations are powerful, everyone gets busy, and it’s important to schedule time as a reminder to keep pushing ahead.
Management: More Carrots, Fewer Sticks

In every team with a poor performance culture, it’s management’s fault. Period. End of conversation.

Engineers can and must make a difference, of course, but if the person at the top and everybody in between aren’t deeply involved, budgeting for the necessary time, and rewarding the work and the superstars, the right culture won’t take hold. A single engineer alone can’t possibly infuse enough of this culture into an entire team, and most certainly not if the entire effort is running upstream against the management team.

It’s painful to watch managers who don’t appreciate performance culture. They’ll often get caught by surprise and won’t realize why – or worse, think that this is just how engineering works. (“We can’t predict where performance will matter in advance!”) Customers will complain that the product doesn’t perform as expected in key areas and, realizing it’s too late for preventative measures, a manager whose team has a poor performance culture will start blaming things. Guess what? The blame game culture spreads like wildfire, the engineers start doing it too, and accountability goes out the window. Blame doesn’t solve anything. Blaming is what jerks do.

Notice I said management must be “deeply involved”: this isn’t some superficial level of involvement. Sure, charts with greens, reds, and trendlines probably need to be floating around, and regular reviews are important. I suppose you could say that these are pointy-haired manager things. (Believe me, however they do help.) A manager must go deeper than this, however, proactively and regularly reviewing the state of performance across the product, alongside the other basic quality metrics and progress on features. It’s a core tenet of the way the team does its work. It must be treated as such. A manager must wonder about the competitive landscape and ask the team good, insightful questions that get them thinking.

Performance doesn’t come for free. It costs the team by forcing them to slow down at times, to spend energy on things other than cranking out features, and hence requires some amount of intelligent tradeoff. How much really depends on the scenario. Managers need to coach the team to spend the right ratio of time. Those who assume it will come for free usually end up spending 2-5x the amount it would have taken, just at an inopportune time later on (e.g., during the endgame of shipping the product, in production when trying to scale up from 1,000 customers to 100,000, etc).

A mentor of mine used to say “You get from your teams what you reward.” It’s especially true with performance and the engineering systems surrounding them. Consider two managers:

    Manager A gives lip service to performance culture. She, however, packs every sprint schedule with a steady stream of features – “we’ve got to crush competitor Z and must reach feature parity!” – with no time for breaks in-between. She spends all-hands team meetings praising new features, demos aplenty, and even gives out a reward to an engineer at each one for “the most groundbreaking feature.” As a result, her team cranks out features at an impressive clip, delivers fresh demos to the board every single time, and gives the sales team plenty of ammo to pursue new leads. There aren’t performance gates and engineers generally don’t bother to think much about it.

    Manager B takes a more balanced approach. She believes that given the competitive landscape, and the need to impress customers and board members with whizbang demos, new features need to keep coming. But she is also wary of building up too much debt in areas like performance, reliability, and quality for areas she expects to stick. So she intentionally puts her foot on the brake and pushes the team just as hard on these areas as she does features. She demands good engineering systems and live flighting of new features with performance telemetry built-in, for example. This requires that she hold board members and product managers at bay, which is definitely unpopular and difficult. In addition to a reward for “the most groundbreaking feature” award at each all-hands, she shows charts of performance progress and delivers a “performance ninja” award too, to the engineer who delivered the most impactful performance improvement. Note that engineering systems improvements also qualify!

Which manager do you think is going to ship a quality product, on time, that customers are in love with? My money is on Manager B. Sometimes you’ve got to slow down to speed up.

Microsoft is undergoing two interesting transitions recently that are related to this point: on one hand, the elimination of “test” as a discipline mentioned earlier; and, on the other hand, a renewed focus on engineering systems. It’s been a bumpy ride. Surprisingly, one of the biggest hurdles to get over wasn’t with the individual engineers at all – it was the managers! “Development managers” in the old model got used to focusing on features, features, features, and left most of the engineering systems work to contractors, and most of the quality work to testers. As a result, they were ill-prepared to recognize and reward the kind of work that is essential to building a great performance culture. The result? You guessed it: a total lack of performance culture. But, more subtly, you also ended up with “leadership holes”; until recently, there were virtually no high-ranking engineers working on the mission-critical engineering systems that make the entire team more productive and capable. Who wants to make a career out of the mere grunt work assigned to contractors and underappreciated by management? Again, you get what you reward.

There’s a catch-22 with early prototyping where you don’t know if the code is going to survive at all, and so the temptation is to spend zero time on performance. If you’re hacking away towards a minimum viable product (MVP), and you’re a startup burning cash, it’s understandable. But I strongly advise against this. Architecture matters, and some poorly made architectural decisions made at the outset can lay the foundation for an entire skyscraper of ill-performing code atop. It’s better to make performance part of the feasibility study and early exploration.

Finally, to tie up everything above, as a manager of large teams, I think it’s important to get together regularly – every other sprint or two – to review performance progress with the management team. This is in addition to the more fine-grained engineer, lead, and architect level pow-wows that happen continuously. There’s a bit of a “stick” aspect of such a review, but it’s more about celebrating the team’s self-driven accomplishments, and keeping it on management’s radar. Such reviews should be driven from the lab and manually generated numbers should be outlawed.

Which brings me to …
Process and Infrastructure

“Process and infrastructure” – how boring!

Good infrastructure is a must. A team lacking the above cultural traits won’t even stop to invest in infrastructure; they will simply live with what should be an infuriating lack of rigor. And good process must ensure effective use of this infrastructure. Here is the bare minimum in my book:

    All commits must pass a set of gated performance tests beforehand.
    Any commits that slip past this and regress performance are reverted without question. I call this the zero tolerance rule.
    Continuous performance telemetry is reported from the lab, flighting, and live environments.
    This implies that performance tests and infrastructure have a few important characteristics:
        They aren’t noisy.
        They measure the “right” thing.
        They can be run in a “reasonable” amount of time.

I have this saying: “If it’s not automated, it’s dead to me.”

This highlights the importance of good infrastructure and avoids the dreaded “it worked fine on my computer” that everybody, I’m sure, has encountered: a test run on some random machine – under who knows what circumstances – is quoted to declare success on a benchmark… only to find out some time later that the results didn’t hold. Why is this?

There are countless possibilities. Perhaps a noisy process interfered, like AntiVirus, search indexing, or the application of operating system updates. Maybe the developer accidentally left music playing in the background on their multimedia player. Maybe the BIOS wasn’t properly adjusted to disable dynamic clock scaling. Perhaps it was due to an innocent data-entry error when copy-and-pasting the numbers into a spreadhseet. Or maybe the numbers for two comparison benchmarks came from two, incomparable machine configurations. I’ve seen all of these happen in practice.

In any manual human activity, mistakes happen. These days, I literally refuse to look at or trust any number that didn’t come from the lab. The solution is to automate everything and focus your energy on making the automation infrastructure as damned good as possible. Pay some of your best people to make this rock solid for the rest of the team. Encourage everybody on the team to fix broken windows, and take a proactive approach to improving the infrastructure. And reward it heartily. You might have to go a little slower, but it’ll be worth it, trust me.
Test Rings

I glossed over a fair bit above when I said “all commits must pass a set of performance tests,” and then went on to talk about how a checkin might “slip past” said tests. How is this possible?

The reality is that it’s usually not possible to run all tests and find all problems before a commit goes in, at least not within a reasonable amount of time. A good performance engineering system should balance the productivity of speedy codeflow with the productivity and assurance of regression prevention.

A decent approach for this is to organize tests into so-called “rings”:

    An inner ring containing tests that all developers on the team measure before each commit.
    An inner ring containing tests that developers on your particular sub-team measure before each commit.
    An inner ring containing tests that developers run at their discretion before each commit.
    Any number of successive rings outside of this:
        Gates for each code-flow point between branches.
        Post-commit testing – nightly, weekly, etc. – based on time/resource constraints.
        Pre-release verification.
        Post-release telemetry and monitoring.

As you can see, there’s a bit of flexibility in how this gets structured in practice. I wish I could lie and say that it’s a science, however it’s an art that requires intelligently trading off many factors. This is a constant source of debate and one that the management team should be actively involved in.

A small team might settle on one standard set of benchmarks across the whole team. A larger team might need to split inner ring tests along branching lines. And no matter the size, we would expect the master/main branch to enforce the most important performance metrics for the whole team, ensuring no code ever flows in that damages a core scenario.

In some cases, we might leave running certain pre-commit tests to the developer’s discretion. (Note, this does not mean running pre-commit tests altogether is optional – only a particular set of them!) This might be the case if, for example, the test covered a lesser-used component and we know the nightly tests would catch any post-commit regression. In general, when you have a strong performance culture, it’s okay to trust judgement calls sometimes. Trust but verify.

Let’s take a few concrete examples. Performance tests often range from micro to macro in size. These typically range from easier to harder to pinpoint the source of a regression, respectively. (Micro measures just one thing, and so fluctuations tend to be easier to understand, whereas macro measures an entire system, where fluctuations tend to take a bit of elbow grease to track down.) A web server team might include a range of micro and macro tests in the innermost pre-commit suite of tests: number of bytes allocated per requests (micro), request response time (micro), … perhaps a half dozen other micro-to-midpoint benchmarks …, and TechEmpower (macro), let’s say. Thanks to lab resources, test parallelism, and the awesomeness of GitHub webhooks, let’s say these all complete in 15 minutes, nicely integrated into your pull request and code review processes. Not too bad. But this clearly isn’t perfect coverage. Maybe every night, TechEmpower is run for 4 hours, to measure performance over a longer period of time to identify leaks. It’s possible a developer could pass the pre-commit tests, and then fail this longer test, of course. Hence, the team lets developers run this test on-demand, so a good doobie can avoid getting egg on his or her face. But alas, mistakes happen, and again there isn’t a culture of blame or witchhunting; it is what it is.

This leads me to back to the zero tolerance rule.

Barring exceptional circumstances, regressions should be backed out immediately. In teams where I’ve seen this succeed, there were no questions asked, and no IOUs. As soon as you relax this stance, the culture begins to break down. Layers of regressions pile on top of one another and you end up ceding ground permanently, no matter the best intentions of the team. The commit should be undone, the developer should identify the root cause, remedy it, ideally write a new test if appropriate, and then go through all the hoops again to submit the checkin, this time ensuring good performance.
Measurement, Metrics, and Statistics

Decent engineers intuit. Good engineers measure. Great engineers do both.

Measure what, though?

I put metrics into two distinct categories:

    Consumption metrics. These directly measure the resources consumed by running a test.
    Observational metrics. These measure the outcome of running a test, observationally, using metrics “outside” of the system.

Examples of consumption metrics are hardware performance counters, such as instructions retired, data cache misses, instruction cache misses, TLB misses, and/or context switches. Software performance counters are also good candidates, like number of I/Os, memory allocated (and collected), interrupts, and/or number of syscalls. Examples of observational metrics include elapsed time and cost of running the test as billed by your cloud provider. Both are clearly important for different reasons.

Seeing a team measure time and time alone literally brings me to tears. It’s a good measure of what an end-user will see – and therefore makes a good high-level test – however it is seriously lacking in the insights it can give you. And if there’s no visibility into variance, it can be borderline useless.

Consumption metrics are obviously much more helpful to an engineer trying to understand why something changed. In our above web server team example, imagine request response time regressed by 30%. All the test report tells us is the time. It’s true, a developer can then try to reproduce the scenario locally, and manually narrow down the cause, however can be tedious, takes time, and is likely imperfect due to differences in lab versus local hardware. What if, instead, both instructions retired and memory allocated were reported alongside the regression in time? From this, it could be easy to see that suddenly 256KB of memory was being allocated per request that wasn’t there before. Being aware of recent commits, this could make it easy for an engineer to quickly pinpoint and back out the culprit in a timely manner before additional commits pile on top, further obscuring the problem. It’s like printf debugging.

Speaking of printf debugging, telemetry is essential for long-running tests. Even low-tech approaches like printfing the current set of metrics every so often (e.g., every 15 seconds), can help track down where something went into the weeds simply by inspecting a database or logfile. Imagine trying to figure out where the 4-hour web server test went off the rails at around the 3 1/2 hour mark. This can can be utterly maddening without continuous telemetry! Of course, it’s also a good idea to go beyond this. The product should have a built-in way to collect this telemtry out in the wild, and correlate it back to key metrics. StatsD is a fantastic option.

Finally, it’s important to measure these metrics as scientifically as possible. That includes tracking standard deviation, coefficient of variation (CV), and geomean, and using these to ensure tests don’t vary wildly from one run to the next. (Hint: commits that tank CV should be blocked, just as those that tank the core metric itself.) Having a statistics wonk on your team is also a good idea!
Goals and Baselines

Little of the above matters if you lack goals and baselines. For each benchmark/metric pair, I recommend recognizing four distinct concepts in your infrastructure and processes:

    Current: the current performance (which can span multiple metrics).
    Baseline: the threshold the product must stay above/below, otherwise tests fail.
    Sprint Goal: where the team must get to before the current sprint ends.
    Ship Goal: where the team must get to in order to ship a competitive feature/scenario.

Assume a metric where higher is better (like throughput); then it’s usually the case that Ship Goal >= Sprint Goal >= Current >= Baseline. As wins and losses happen, continual adjustments should be made.

For example, a “baseline ratcheting” process is necessary to lock in improvements. A reasonable approach is to ratchet the baseline automatically to within some percentage of the current performance, ideally based on standard deviation and/or CV. Another approach is to require that developers do it manually, so that all ratcheting is intentional and accounted for. And interestingly, you may find it helpful to ratchet in the other direction too. That is, block commits that improve performance dramatically and yet do not ratchet the baseline. This forces engineers to stop and think about whether performance changes were intentional – even the good ones! A.k.a., “confirm your kill.”

It’s of course common that sprint goals remain stable from one sprint to the next. All numbers can’t be improving all the time. But this system also helps to ensure that the team doesn’t backslide on prior achievements.

I’ve found it useful to organize sprint goals behind themes. Make this sprint about “server performance.” Or “shake out excessive allocations.” Or something else that gives the team a sense of cohesion, shared purpose, and adds a little fun into the mix. As managers, we often forget how important fun is. It turns out performance can be the greatest fun of all; it’s hugely measurable – which engineers love – and, speaking for myself, it’s a hell of a time to pull out the scythe and start whacking away! It can even be a time to learn as a team, and to even try out some fun, new algorithmic techniques, like bloom filters.

Not every performance test needs this level of rigor. Any that are important enough to automatically run pre-commit most certainly demand it. And probably those that are run daily or monthly. But managing all these goals and baselines and whatnot can get really cumbersome when there are too many of them. This is a real risk especially if you’re tracking multiple metrics for each of your benchmarks.

This is where the idea of “key performance indicators” (KPIs) becomes very important. These are the performance metrics important enough to track at a management level, to the whole team how healthy the overall product is at any given time. In my past team who built an operating system and its components, this included things like process startup time, web server throughput, browser performance on standard industry benchmarks, and number of frames dropped in our realtime audio/video client, including multiple metrics apiece plus the abovementioned statistics metrics. These were of course in the regularly running pre- and post-commit test suites, but rolling them up in one place, and tracking against the goals, was a hugely focusing exercise.
In Summary

This post just scratches the surface of how to do good performance engineering, but I hope you walk away with at least one thing: doing performance well is all about having a great performance culture.

This culture needs to be infused throughout the entire organization, from management down to engineers, and everybody in between. It needs to be transparent, respectful, aggressive, data-driven, self-critical, and relentlessly ambitious. Great infrastructure and supporting processes are a must, and management needs to appreciate and reward these, just as they would feature work (and frequently even more). Only then will the self-reinforcing flywheel get going.

Setting goals, communicating regularly, and obsessively tracking goals and customer-facing metrics is paramount.

It’s not easy to do everything I’ve written in this article. It’s honestly very difficult to remember to slow down and be disciplined in these areas, and it’s easy to trick yourself into thinking running as fast as possible and worrying about performance later is the right call. Well, I’m sorry to tell you, sometimes it is. You’ve got to use your intuition and your gut, however, in my experience, we tend to undervalue performance considerably compared to features.

If you’re a manager, your team will thank you for instilling a culture like this, and you’ll be rewarded by shipping better performing software on schedule. If you’re an engineer, I guarantee you’ll spend far less time scrambling, more time being proactive, and more time having fun, in a team obsessed over customer performance. I’d love to hear what you think and your own experiences establishing a performance culture.

#### 15 years of concurrency

[source](http://joeduffyblog.com/2016/11/30/15-years-of-concurrency/)



In a Tale of Three Safeties, we discussed three kinds of safety: type, memory, and concurrency. In this follow-on article, we will dive deeper into the last, and perhaps the most novel yet difficult, one. Concurrency-safety led me to the Midori project in the first place, having spent years on .NET and C++ concurrency models leading up to joining. We built some great things that I’m very proud of during this time. Perhaps more broadly interesting, however, are the reflections on this experience after a few years away from the project.

I’ve tried to write this article about 6 times since earlier this year, and I’m thrilled to finally share it. I hope that it’s useful to anyone interested in the field, and especially anybody who is actively innovating in this area. Although the code samples and lessons learned are deeply rooted in C#, .NET, and the Midori project, I have tried to generalize the ideas so they are easily consumable regardless of programming language. I hope you enjoy!
Background

For most of the 2000s, my job was figuring out how to get concurrency into the hands of developers, starting out as a relatively niche job on the CLR team at Microsoft.
Niche Beginnings

Back then, this largely entailed building better versions of the classic threading, locking, and synchronization primitives, along with attempts to solidify best practices. For example, we introduced a thread-pool to .NET 1.1, and used that experience to improve the scalability of the Windows kernel, its scheduler, and its own thread-pool. We had this crazy 128-processor NUMA machine that kept us busy with all sorts of esoteric performance challenges. We developed rules for how to do concurrency right – lock leveling, and so on – and experimented with static analysis. I even wrote a book about it.

Why concurrency in the first place?

In short, it was enormously challenging, technically-speaking, and therefore boatloads of fun.

I had always been a languages wonk. So, I was naturally fascinated by the decades of deep work in academia, including programming language and runtime symbiosis (especially Cilk and NESL), advanced type systems, and even specialized parallel hardware architectures (especially radical ones like the Connection Machine, and MIMD supercomputers, that innovated beyond our trustworthy pal, von Neumann).

Although some very large customers actually ran symmetric multiprocessor (SMP) servers – yes, we actually used to call them that – I wouldn’t say that concurrency was a very popular area to specialize in. And certainly any mention of those cool “researchy” sources would have gotten an odd glance from my peers and managers. Nevertheless, I kept at it.

Despite having fun, I wouldn’t say the work we did during this period was immensely impactful to the casual observer. We raised the abstractions a little bit – so that developers could schedule logical work items, think about higher levels of synchronization, and so on – but nothing game-changing. Nonetheless, this period was instrumental to laying the foundation, both technically and socially, for what was to come later on, although I didn’t know it at the time.
No More Free Lunch; Enter Multicore

Then something big happened.

In 2004, Intel and AMD approached us about Moore’s Law, notably its imminent demise. Power wall challenges would seriously curtail the ever-increasing year-over-year clock speed improvements that the industry had grown accustomed to.

Suddenly management cared a whole lot more about concurrency. Herb Sutter’s 2005 “Free Lunch is Over” article captured the fever pitch. If we couldn’t enable developers to write massively parallel software – something that was historically very difficult and unlikely to happen without significantly lower barriers to entry – both Microsoft and Intel’s businesses, and mutually beneficial business models, were in trouble. If the hardware didn’t get faster in the usual ways, software couldn’t automatically get better, and people would have less reason to buy new hardware and software. An end to the Wintel era and Andy and Bill’s Law, “What Andy giveth, Bill taketh away”.

Or, so the thinking went.

This is when the term “multicore” broke into the mainstream, and we began envisioning a world with 1,024 core processors and even more forward-looking “manycore” architectures that took a page from DSPs, mixing general purpose cores with specialized ones that could offload heavy-duty functions like encryption, compression, and the like.

As an aside, with 10 years of hindsight, things didn’t unfold exactly as we thought they would. We don’t run PCs with 1,024 traditional cores, although our GPUs have blown way past that number, and we do see more heterogeneity than ever before, especially in the data center where FPGAs are now offloading critical tasks like encryption and compression.

The real big miss, in my opinion, was mobile. This was precisely when the thinking around power curves, density, and heterogeneity should have told us that mobile was imminent, and in a big way. Instead of looking to beefier PCs, we should have been looking to PCs in our pockets. Instead, the natural instinct was to cling to the past and “save” the PC business. This is a classical innovator’s dilemma although it sure didn’t seem like one at the time. And of course PCs didn’t die overnight, so the innovation here was not wasted, it just feels imbalanced against the backdrop of history. Anyway, I digress.
Making Concurrency Easier

As a concurrency geek, this was the moment I was waiting for. Almost overnight, finding sponsors for all this innovative work I had been dreaming about got a lot easier, because it now had a real, and very urgent, business need.

In short, we needed to:

    Make it easier to write parallel code.
    Make it easier to avoid concurrency pitfalls.
    Make both of these things happen almost “by accident.”

We already had threads, thread-pools, locks, and basic events. Where to go from here?

Three specific projects were hatched around this point and got an infusion of interest and staffing.
Software Transactional Memory

Ironically, we began with safety first. This foreshadows the later story, because in general, safety took a serious backseat until I was able to pick it back up in the context of Midori.

Developers already had several mechanisms for introducing concurrency, and yet struggled to write correct code. So we sought out those higher level abstractions that could enable correctness as if by accident.

Enter software transactional memory (STM). An outpouring of promising research had been coming out in the years since Herlihy and Moss’s seminal 1993 paper and, although it wasn’t a panacea, a number of us became enamored with its ability to raise the abstraction level.

STM let you write things like this, and get automatic safety:

void Transfer(Account from, Account to, int amt) {
    atomic {
        from.Withdraw(amt);
        to.Deposit(amt);
    }
}

Look ma, no locks!

STM could handle all of the decisions transparently like figuring out how coarse- or fine-grained synchronization to use, the contention policies around that synchronization, deadlock detection and prevention, and guarantee that you didn’t forget to lock when accessing a shared data structure. All behind a tantalizingly simple keyword, atomic.

STM also came with simple, more declarative, coordination mechanisms, like orElse. So, although the focus was on eliminating the need to manually manage locking, it also helped evolve synchronization between threads.

Unfortunately, after a few years of prototyping deep runtime, OS, and even hardware support, we abandoned the efforts. My brief summary is that it’s more important to encourage good concurrency architecture than it is to make poor ones “just work”, although I have written more details here and here. It was this higher level architecture that we should focus on solving first and foremost and, after the dust settled, see what gaps remained. It wasn’t even clear that STM would be the correct tool for the job once we got to that point. (In hindsight, I do think it’s one of the very many reasonable tools in the toolbelt, although with more distributed application architectures on the rise, it’s a dangerous thing to give to people.)

Our STM efforts weren’t a complete failure, however. It was during this time that I began experimenting with type systems for safe concurrency. Moreover, bits and pieces ended up incorporated into Intel’s Haswell processor as the Transactional Synchronization Extensions (TSX) suite of instructions, delivering the capability to leverage speculative lock elision for ultra-cheap synchronization and locking operations. And again, I worked with some amazing people during this time.
Parallel Language Integrated Query (PLINQ)

Alongside STM, I’d been prototyping a “skunkworks” data parallel framework, on nights and weekends, to leverage our recent work in Language Integrated Query (LINQ).

The idea behind parallel LINQ (PLINQ) was to steal a page from three well-researched areas:

    Parallel databases, which already parallelized SQL queries on users’ behalves without them needing to know about it, often with impressive results.

    Declarative and functional languages, which often used list comprehensions to express higher-level language operations that could be aggressively optimized, including parallelism. For this, I deepened my obsession with Haskell, and was inspired by APL.

    Data parallelism, which had quite a lengthy history in academia and even some more mainstream incarnations, most notably OpenMP.

The idea was pretty straightforward. Take existing LINQ queries, which already featured operations like maps, filters, and aggregations – things that were classically parallelizable in both languages and databases – and auto-parallelize them. Well, it couldn’t be implicit, because of side-effects. But all it took was a little AsParallel to enable:

// Sequential:
var q = (from x in xs
         where p(x)
         select f(x)).Sum();

// Parallel:
var q = (from x in xs.AsParallel()
         where p(x)
         select f(x)).Sum();

This demonstrates one of the great things about data parallelism. It can scale with the size of your inputs: either data quantity, expense of the operations against that data, or both. And when expressed in a sufficiently high-level language, like LINQ, a developer needn’t worry about scheduling, picking the right number of tasks, or synchronization.

This is essentially MapReduce, on a single machine, across many processors. Indeed, we later collaborated with MSR on a project called DryadLINQ which not only ran such queries across many processors, but also distributed them across many machines too. (Eventually we went even finer-grained with SIMD and GPGPU implementations.) This eventually led to Microsoft’s own internal equivalent to Google’s MapReduce, Cosmos, a system that powers a lot of big data innovation at Microsoft still to this date.

Developing PLINQ was a fond time in my career and a real turning point. I collaborated and built relationships with some amazing people. BillG wrote a full-page review of the idea, concluding with “We will have to put more resources specifically on this work.” Such strong words of encouragement didn’t hurt with securing funding to deliver on the idea. It also attracted the attention of some incredible people. For example, Jim Gray took notice, and I got to experience his notorious generosity 1st hand, just two months before his tragic disappearance.

Needless to say, this was an exciting time!
Interlude: Forming the PFX Team

Around this time, I decided to broaden the scope of our efforts beyond just data parallelism, tackling task parallelism and other concurrency abstractions. So I went around pitching the idea of forming a new team.

Much to my surprise, a new parallel computing group was being created in the Developer Division in response to the changing technology landscape, and they wanted to sponsor these projects. It was an opportunity to roll everything up under a nice top-level business theme, unify recruiting efforts, and take things even further, eventually branching out into C++, GPGPUs, and more.

So, obviously, I said yes.

I named the team “PFX”, initially short for “parallel frameworks”, although by the time we shipped marketing working its magic on us, renaming it to “Parallel Extensions to .NET.” This team’s initial deliverable encompassed PLINQ, task parallelism, and a new effort, Coordination Data Structures (CDS), meant to handle advanced synchronization efforts, like barrier-style synchronization, concurrent and lock-free collections derived from many great research papers, and more.
Task Parallel Library

This brings me to task parallelism.

As part of PLINQ, we needed to create our own concept of parallel “tasks.” And we needed a sophisticated scheduler that could scale automatically given the machine’s available resources. Most existing schedulers were thread-pool like, in that they required that a task run on a separate thread, even if doing so was not profitable. And the mapping of tasks to threads was fairly rudimentary, although we did make improvements to that over the years.

Given my love of Cilk, and the need to schedule lots of potentially-recursive fine-grained tasks, choosing a work stealing scheduler for our scheduling architecture was a no-brainer.

At first, our eyes were locked squarely on PLINQ, and so we didn’t pay as much attention to the abstractions. Then MSR began exploring what standalone a task parallel library would look like. This was a perfect partnership opportunity and so we started building something together. The Task<T> abstraction was born, we rewrote PLINQ to use it, and created a suite of Parallel APIs for common patterns such as fork/join and parallel for and foreach loops.

Before shipping, we replaced the guts of the thread-pool with our new shiny work-stealing scheduler, delivering unified resource management within a process, so that multiple schedulers wouldn’t fight with one another. To this day, the code is almost identical to my early implementation in support of PLINQ (with many bug fixes and improvements, of course).

We really obsessed over the usability of a relatively small number of APIs for a long time. Although we made mistakes, I’m glad in hindsight that we did so. We had a hunch that Task<T> was going to be core to everything we did in the parallelism space but none of us predicted the widespread usage for asynchronous programming that really popularized it years later. Now-a-days, this stuff powers async and await and I can’t imagine life without Task<T>.
A Shout-Out: Inspiration From Java

I would be remiss if I didn’t mention Java, and the influence it had on my own thinking.

Leading up to this, our neighbors in the Java community had also begun to do some innovative work, led by Doug Lea, and inspired by many of the same academic sources. Doug’s 1999 book, Concurrent Programming in Java, helped to popularize these ideas in the mainstream and eventually led to the incorporation of JSR 166 into the JDK 5.0. Java’s memory model was also formalized as JSR 133 around this same time, a critical underpinning for the lock-free data structures that would be required to scale to large numbers of processors.

This was the first mainstream attempt I saw to raise the abstraction level beyond threads, locks, and events, to something more approachable: concurrent collections, fork/join, and more. It also brought the industry closer to some of the beautiful concurrent programming languages in academia. These efforts were a huge influence on us. I especially admired how academia and industry partnered closely to bring decades’ worth of knowledge to the table, and explicitly sought to emulate this approach in the years to come.

Needless to say, given the similarities between .NET and Java, and level of competition, we were inspired.
O Safety, Where Art Thou?

There was one big problem with all of this. It was all unsafe. We had been almost exclusively focused on mechanisms for introducing concurrency, but not any of the safeguards that would ensure that using them was safe.

This was for good reason: it’s hard. Damn hard. Especially across the many diverse kinds of concurrency available to developers. But thankfully, academia had decades of experience in this area also, although it was arguably even more “esoteric” to mainstream developers than the parallelism research. I began wallowing in it night and day.

The turning point for me was another BillG ThinkWeek paper I wrote, Taming Side Effects, in 2008. In it, I described a new type system that, little did I know at the time, would form the basis of my work for the next 5 years. It wasn’t quite right, and was too tied up in my experiences with STM, but it was a decent start.

Bill again concluded with a “We need to do this.” So I got to work!
Hello, Midori

But there was still a huge problem. I couldn’t possibly imagine doing this work incrementally in the context of the existing languages and runtimes. I wasn’t looking for a warm-and-cozy approximation of safety, but rather something where, if your program compiled, you could know it was free of data races. It needed to be bulletproof.

Well, actually, I tried. I prototyped a variant of the system using C# custom attributes and static analysis, but quickly concluded that the problems ran deep in the language and had to be integrated into the type system for any of the ideas to work. And for them to be even remotely usable. Although we had some fun incubation projects at the time (like Axum), given the scope of the vision, and for a mixture of cultural and technical reasons, I knew this work needed a new home.

So I joined Midori.
An Architecture, and An Idea

A number of concurrency gurus were also on the Midori team, and I had been talking to them about all of this for a couple years leading up to me joining. At a top-level, we knew the existing foundation was the wrong one to bet on. Shared-memory multithreading really isn’t the future, we thought, and notably absent from all of my prior work was fixing this problem. The Midori team was set up exactly to tackle grand challenges and make big bets.

So, we made some:

    Isolation is paramount, and we will embrace it wherever possible.

    Message passing will connect many such isolated parties through strongly typed RPC interfaces.

    Namely, inside of a process, there exists a single message loop, and, by default, no extra parallelism.

    A “promises-like” programming model will be first class so that:
        Synchronous blocking is disallowed.
        All asynchronous activity in the system is explicit.
        Sophisticated coordination patterns are possible without resorting to locks and events.

To reach these conclusions we were heavily inspired by Hoare CSPs, Gul Agha’s and Carl Hewitt’s work on Actors, E, π, Erlang, and our own collective experiences building concurrent, distributed, and various RPC-based systems over the years.

I didn’t say this before, however message passing was notably absent in my work on PFX. There were multiple reasons. First, there were many competing efforts, and none of them “felt” right. For instance, the Concurrency and Coordination Runtime (CCR) was very complex (but had many satisfied customers); the Axum language was, well, a new language; MSR’s Cω was powerful, but required language changes which some were hesitant to pursue (though the derivative library-only work, Joins, held some promise); and so on. Second, it didn’t help that everyone seemed to have a different idea on what the fundamental concepts should be.

But it really came down to isolation. Windows processes are too heavyweight for the fine-grained isolation we thought necessary to deliver safe, ubiquitous and easy message passing. And no sub-process isolation technology on Windows was really up for the task: COM apartments, CLR AppDomains, … many flawed attempts instantly come to mind; frankly, I did not want to die on that hill.

(Since then, I should note, there have been some nice efforts, like Orleans – built in part by some ex-Midori members – TPL Dataflow, and Akka.NET. If you want to do actors and/or message passing in .NET today, I recommend checking them out.)

Midori, on the other hand, embraced numerous levels of isolation, beginning with processes themselves, which were even cheaper than Windows threads thanks to software isolation. Even coarser-grained isolation was available in the form of domains, adding added belts-and-suspenders hardware protection for hosting untrusted or logically separate code. In the early days, we certainly wanted to go finer-grained too – inspired by E’s concept of “vats”, the abstraction we already began with for process message pumps – but weren’t sure how to do it safely. So we waited on this. But this gave us precisely what we needed for a robust, performant, and safe message passing foundation.

Important to the discussion of this architecture is the notion of shared nothing, something Midori leveraged as a core operating principle. Shared nothing architectures are great for reliability, eliminating single points of failure, however they are great for concurrency safety too. If you don’t share anything, there is no opportunity for race conditions! (This is a bit of a lie, and generally insufficient, as we shall see.)

It’s interesting to note that we were noodling on this around the same time Node.js was under development. The core idea of an asynchronous, non-blocking, single process-wide event loop, is remarkably similar. Perhaps something tasty was in the water during 2007-2009. In truth, many of these traits are common to event-loop concurrency.

This formed the canvas on top of which the entire concurrency model was painted. I’ve already discussed this in the asynchronous everything article. But there was more…
Why Not Stop Here?

It’s a reasonable question. A very robust system could be built with nothing more than the above, and I should say, throughout multiple years of pounding away at the system, the above foundation stood the test of time and underwent far fewer changes than what came next (syntax aside). There is a simplicity to leaving it at this that I admire. In fact, with perfect hindsight, I believe stopping here would have been a reasonable story for “V1.”

However, a number of things kept us pushing for more:

    There was no sub-process parallelism. Notably absent were task and data parallelism. This was painful for a guy who had just come from building .NET’s task and PLINQ programming models. We had plenty of places that had latent parallelism just waiting to be unlocked, like image decoding, the multimedia pipeline, FRP rendering stack, browser, eventually speech recognition, and more. One of Midori’s top-level goals was to tackle the concurrency monster and, although a lot of parallelism came for “free” thanks to processes, the absence of task and data parallelism hurt.

    All messages between processes required RPC data marshaling, so rich objects could not be shared. One solution to the absence of task parallelism could have been to model everything as processes. Need a task? Spawn a process. In Midori, they were cheap enough for this to work. Doing that, however, entailed marshaling data. Not only could that be an expensive operation, not all types were marshalable, severely limiting parallelizable operations.

    In fact, an existing “exchange heap” was developed for buffers, loosely based on the concept of linearity. To avoid marshaling large buffers, we already had a system for exchanging them between processes without copying as part of the RPC protocol. This idea seemed useful enough to generalize and offer for higher-level data structures.

    Even intra-process race conditions existed, due to multiple asynchronous activities in-flight and interleaving, despite the lack of data races thanks to the single message loop model described above. A benefit of the await model is that interleaving are at least visible and auditable in the source code; but they could still trigger concurrency errors. We saw opportunities for the language and frameworks to help developers get this correct.

    Finally, we also had a vague desire to have more immutability in the system. Doing so could help with concurrency safety, of course, but we felt the language should also help developers get existing commonplace patterns correct-by-construction. We also saw performance optimization opportunities if the compiler could trust immutability.

We went back to academia and the ThinkWeek paper in search of inspiration. These approaches, if combined in a tasteful way, seemed like they could give us the tools necessary to deliver not only safe task and data parallelism, but also finer-grained isolation, immutability, and tools to possibly address some of the intra-process race conditions.

So, we forked the C# compiler, and went to town.
The Model

In this section, I will rearrange the story to be a bit out of order. (How appropriate.) I’ll first describe the system we ended up with, after many years of work, in “tutorial style” rather than starting with the slightly messier history of how we ended up there. I hope this gives a more concise appreciation of the system. I will then afterwards give the complete historical account, including the dozens of systems that came before which influenced us greatly.

We started with C#’s type system and added two key concepts: permission and ownership.
Permission

The first key concept was permission.

Any reference could have one and it governed what you could do with the referent object:

    mutable: The target object (graph) can be mutated through the usual ways.
    readonly: The target object (graph) can be read from but cannot be mutated.
    immutable: The target object (graph) can be read from and will never be mutated.

A subtyping relationship meant you could implicitly convert either mutable or immutable to readonly. In other words, mutable <: readonly and immutable <: readonly.

For example:

Foo m = new Foo(); // mutable by default.

immutable Foo i = new Foo(); // cannot ever be mutated.
i.Field++; // error: cannot mutate an immutable object.

readonly Foo r1 = m; // ok; cannot be mutated by this reference.
r1.Field++; // error: cannot mutate a readonly object.

readonly Foo r2 = i; // ok; still cannot be mutated by this reference.
r2.Field++; // error: cannot mutate a readonly object.

These are guarantees, enforced by the compiler and subject to verification.

The default, if unstated, was immutable for primitive types like int, string, etc., and mutable for all others. This preserved existing C# semantics in almost all scenarios. (That is, C# compiled as-is had no change in meaning.) This was contentious but actually a pretty cool aspect of the system. It was contentious because the principle of least authority would lead you to choose readonly as the default. It was cool because you could take any C# code and start incrementally sprinkling in permissions where they delivered value. If we had decided to break from C# more radically – something in hindsight we should have done – then breaking with compatibility and choosing the safer default would have been the right choice; but given our stated goals of C# compatibility, I think we made the right call.

These permissions could also appear on methods, to indicate how the this parameter got used:

class List<T> {
    void Add(T e);
    int IndexOf(T e) readonly;
    T this[int i] { readonly get; set; }
}

A caller would need a sufficient permission in order to invoke a method:

readonly List<Foo> foos = ...;
foos[0] = new Foo(); // error: cannot mutate a readonly object.

A similar thing could be stated using delegate types and lambdas. For example:

delegate void PureFunc<T>() immutable;

This meant that a lambda conforming to the PureFunc interface could only close over immutable state.

Notice how powerful this has suddenly become! This PureFunc is precisely what we would want for a parallel task. As we will see shortly, these simple concepts alone are enough to enable many of those PFX abstractions to become safe.

By default, permissions are “deep”, in that they apply transitively, to the entire object graph. This interacts with generics in the obvious way, however, so that you could, for example, have combinations of deep and shallow permissions:

readonly List<Foo> foos = ...;             // a readonly list of mutable Foos.
readonly List<readonly Foo> foos = ...;    // a readonly list of readonly Foos.
immutable List<Foo> foos = ...;            // an immutable list of mutable Foos.
immutable List<immutable Foo> foos = ...;  // an immutable list of immutable Foos.
// and so on...

Despite this working, and appearing obvious, man was this a difficult thing to get right!

For power users, we also had a way to write generic types that parameterized over permissions. This was definitely required deep in the bowels of highly generic code, but otherwise could be ignored by 90% of the system’s users:

delegate void PermFunc<T, U, V, permission P>(P T, P U, P V);

// Used elsewhere; expands to `void(immutable Foo, immutable Bar, immutable Baz)`:
PermFunc<Foo, Bar, Baz, immutable> func = ...;

I should also note that, for convenience, you could mark a type as immutable to indicate “all instances of this type are immutable.” This was actually one of the most popular features of all of this. At the end of the day, I’d estimate that 1/4-1/3 of all types in the system were marked as immutable:

immutable class Foo {...}
immutable struct Bar {...}

There is an interesting twist. As we’ll see below, readonly used to be called readable, and was entirely distinct. But after we left Midori and were hard at work trying to ready these concepts for inclusion in C#, we decided to try and unify them. So that’s what I am presenting here. The only hitch is that readonly would be given a slightly different meaning. On a field, readonly today means “the value cannot be changed”; in the case of a pointer, therefore, the readonly of today did not impact the referent object graph. In this new model, it would. Given that we anticipated an opt-in flag, --strict-mutability, this would be acceptable, and would require readonly mutable, a slight wart, to get the old behavior. This wasn’t a deal-breaker to me – especially given that a very common bug in C# is developers assuming that readonly is deep (which now it would be), and obvious similarities to const come to mind.
Ownership

The second key concept was ownership.

A reference could be given an ownership annotation, just as it could be given a permission:

    isolated: The target object (graph) forms an unaliased transitive closure of state.

For example:

isolated List<int> builder = new List<int>();

Unlike permissions, which indicate what operations are legal on a given reference, ownership annotations told us important aliasing properties about the given object graphs. An isolated graph has a single “in-reference” to the root object in the object graph, and no “out-references” (except for immutable object references, which are permitted).

A visual aid might help to conceptualize this:

Isolation Bubbles

Given an isolated object, we can mutate it in-place:

for (int i = 0; i < 42; i++) {
    builder.Add(i);
}

And/or destroy the original reference and transfer ownership to a new one:

isolated List<int> builder2 = consume(builder);

The compiler from here on would mark builder as uninitialized, though if it is stored in the heap multiple possible aliases might lead to it, so this analysis could never be bulletproof. In such cases, the original reference would be nulled out to avoid safety gotchas. (This was one of many examples of making compromises in order to integrate more naturally into the existing C# type system.)

It’s also possible to destroy the isolated-ness, and just get back an ordinary List<int>:

List<int> built = consume(builder);

This enabled a form of linearity that was useful for safe concurrency – so objects could be handed off safely, subsuming the special case of the exchange heap for buffers – and also enabled patterns like builders that laid the groundwork for strong immutability.

To see why this matters for immutability, notice that we skipped over exactly how an immutable object gets created. For it to be safe, the type system needs to prove that no other mutable reference to that object (graph) exists at a given time, and will not exist forever. Thankfully that’s precisely what isolated can do for us!

immutable List<int> frozen = consume(builder);

Or, more concisely, you’re apt to see things like:

immutable List<int> frozen = new List<int>(new[] { 0, ..., 9 });

In a sense, we have turned our isolation bubble (as shown earlier) entirely green:

Immutability from Isolation Bubbles

Behind the scenes, the thing powering the type system here is isolated and ownership analysis. We will see more of the formalisms at work in a moment, however there is a simple view of this: all inputs to the List<int>’s constructor are isolated – namely, in this case, the array produced by new[] – and therefore the resulting List<int> is too.

In fact, any expression consuming only isolated and/or immutable inputs and evaluating to a readonly type was implicitly upgradeable to immutable; and, a similar expression, evaluating to a mutable type, was upgradeable to isolated. This meant that making new isolated and immutable things was straightforward using ordinary expressions.

The safety of this also depends on the elimination of ambient authority and leaky construction.
No Ambient Authority

A principle in Midori was the elimination of ambient authority. This enabled capability-based security, however in a subtle way was also necessary for immutability and the safe concurrency abstractions that are to come.

To see why, let’s take our PureFunc example from earlier. This gives us a way to reason locally about the state captured by a lambda. In fact, a desired property was that functions accepting only immutable inputs would result in referential transparency, unlocking a number of novel compiler optimizations and making it easier to reason about code.

However, if mutable statics still exist, the invocation of that PureFunc may not actually be pure!

For example:

static int x = 42;

PureFunc<int> func = () => x++;

From the type system’s point of view, this PureFunc has captured no state, and so it obeys the immutable capture requirement. (It may be tempting to say that we can “see” the x++, and therefore can reject the lambda, however of course this x++ might happen buried deep down in a series of virtual calls, where it is invisible to us.)

All side-effects need to be exposed to the type system. Over the years, we explored extra annotations to say “this function has mutable access to static variables”; however, the mutable permission is already our way of doing that, and felt more consistent with the overall stance on ambient authority that Midori took.

As a result, we eliminated all ambient side-effectful operations, leveraging capability objects instead. This obviously covered I/O operations – all of which were asynchronous RPC in our system – but also even – somewhat radically – meant that even just getting the current time, or generating a random number, required a capability object. This let us model side-effects in a way the type-system could see, in addition to reaping the other benefits of capabilities.

This meant that all statics must be immutable. This essentially brought C#’s const keyword to all statics:

const Map<string, int> lookupTable = new Map<string, int>(...);

In C#, const is limited to primitive constants, like ints, bools, and strings. Our system expanded this same capability to arbitrary types, like lists, maps, …, anything really.

Here’s where it gets interesting. Just like C#’s current notion of const, our compiler evaluated all such objects at compile-time and froze them into the readonly segment of the resulting binary image. Thanks to the type system’s guarantee that immutability meant immutability, there was no risk of runtime failures as a result of doing so.

Freezing had two fascinating performance consequences. First, we could share pages across multiple processes, cutting down on overall memory usage and TLB pressure. (For instance, lookup tables held in maps were automatically shared across all programs using that binary.) Second, we were able to eliminate all class constructor accesses, replacing them with constant offsets, leading to more than a 10% reduction in code size across the entire OS along with associated speed improvements, particularly at startup time.

Mutable statics sure are expensive!
No Leaky Construction

This brings us to the second “hole” that we need to patch up: leaky constructors.

A leaky constructor is any constructor that shares this before construction has finished. Even if it does so at the “very end” of its own constructor, due to inheritance and constructor chaining, this isn’t even guaranteed to be safe.

So, why are leaky constructors dangerous? Mainly because they expose other parties to partially constructed objects. Not only are such objects’ invariants suspect, particularly in the face of construction failure, however they pose a risk to immutability too.

In our particular case, how are we to know that after creating a new supposedly-immutable object, someone isn’t secretively holding on to a mutable reference? In that case, tagging the object with immutable is a type hole.

We banned leaky constructors altogether. The secret? A special permission, init, that meant the target object is undergoing initialization and does not obey the usual rules. For example, it meant fields weren’t yet guaranteed to be assigned to, non-nullability hadn’t yet been established, and that the reference could not convert to the so-called “top” permission, readonly. Any constructor got this permission by default and you couldn’t override it. We also automatically used init in select areas where it made the language work more seamlessly, like in object initializers.

This had one unfortunate consequence: by default, you couldn’t invoke other instance methods from inside a constructor. (To be honest, this was actually a plus in my opinion, since it meant you couldn’t suffer from partially constructed objects, couldn’t accidentally invoke virtuals from a constructor, and so on.) In most cases, this was trivially worked around. However, for those cases where you really needed to call an instance method from a constructor, we let you mark methods as init and they would take on that permission.
Formalisms and Permission Lattices

Although the above makes intuitive sense, there was a formal type system behind the scenes.

Being central to the entire system, we partnered with MSR to prove the soundness of this approach, especially isolated, and published the paper in OOPSLA’12 (also available as a free MSR tech report). Although the paper came out a couple years before this final model solidified, most of the critical ideas were taking shape and well underway by then.

For a simple mental model, however, I always thought about things in terms of subtyping and substitution.

In fact, once modeled this way, most implications to the type system “fall out” naturally. readonly was the “top permission”, and both mutable and immutable convert to it implicitly. The conversion to immutable was a delicate one, requiring isolated state, to guarantee that it obeyed the immutability requirements. From there, all of the usual implications follow, including substitution, variance, and their various impact to conversions, overrides, and subtypes.

This formed a two-dimensional lattice wherein one dimension was “type” in the classical sense and the other “permission”, such that all types could convert to readonly Object. This diagram illustrates:

Permission Lattice

The system could obviously be used without any knowledge of these formalisms. However, I had lived through enough sufficiently scary, yet subtle, security problems over the years due to type system gotchas, so going the extra mile and doing the formalism not only helped us understand our own system better, but also helped us sleep better at night.
How This Enabled Safe Concurrency

New type system in hand, we can now go back and revisit those PFX abstractions, and make them all safe.

The essential property we must establish is that, when an activity has mutable rights to a given object, then that object must not be simultaneously accessible to any other activities. Notice that I am using the term “activity” deliberately. For now, imagine this maps directly to “task”, although we shall return to this subtlety momentarily. Also note that I’ve said “object”; that too is a gross simplification, since for certain data structures like arrays, simply ensuring that activities do not have mutable rights to overlapping regions is sufficient.

Beyond what this disallows, it actually allows for some interesting patterns. For instance, any number of concurrent activities may share readonly access to the same object. (This is a bit like a reader/writer lock, just without any locks or runtime overheads.) Remember that we can convert mutable to readonly, which means that, given an activity with mutable access, we can use fork/join parallelism that captures an object with readonly permissions, provided the mutator is temporally paused for the duration of this fork/join operation.

Or, in code:

int[] arr = ...;
int[] results = await Parallel.Fork(
    () => await arr.Reduce((x, y) => x+y),
    () => await arr.Reduce((x, y) => x*y)
);

This code computes the sum and product of an array, in parallel, by merely reading from it. It is data race-free.

How so? This example Fork API uses permissions to enforce the required safety:

public static async T[] Fork<T>(params ForkFunc<T>[] funcs);

public async delegate T ForkFunc<T>() readonly;

Let’s break this apart. Fork simply takes an array of ForkFuncs. Since Fork is static, we needn’t worry about it capturing state dangerously. But ForkFunc is a delegate and can be satisfied by instance methods and lambdas, both of which can close over state. By marking the this position as readonly, we limit the captures to readonly; so, although the lambdas can capture arr in our above example, they cannot mutate it. And that’s it.

Notice too that the nested function Reduce can also be run in parallel, thanks to ForkFunc! Obviously, all of the familiar Parallel.For, Parallel.ForEach, and friends, can enjoy similar treatment, with similar safety.

It turns out most fork/join patterns, where we can guarantee the mutator is paused, work this way. All of PLINQ, for example, can be represented this way, with complete data-race freedom. This was the use-case I always had in mind.

In fact, we can now introduce automatic parallelism! There are a few ways to go about this. One way is to never offer LINQ operators that aren’t protected by readonly annotations. This was always my preferred approach, given the absurdity of having query operators performing mutations. But other approaches were possible. One is to offer overloads – one set of mutable operators, one set of readonly operators – and the compiler’s overload resolution would then pick the one with the least permission that type-checked.

As mentioned earlier, tasks are even simpler than this:

public static Task<T> Run<T>(PureFunc<T> func);

This accepts our friend from earlier, PureFunc, that is guaranteed to be referentially transparent. Since tasks do not have structured lifetime like our fork/join and data parallel friends above, we cannot permit capture of even readonly state. Remember, the trick that made the above examples work is that the mutator was temporarily paused, something we cannot guarantee here with unstructured task parallelism.

So, what if a task needs to party on mutable state?

For that, we have isolated! There are various ways to encode this, however, we had a way to mark delegates to indicate they could capture isolated state too (which had the side-effect of making the delegate itself isolated):

public static Task<T> Run<T>(TaskFunc<T> func);

public async delegate T TaskFunc<T>() immutable isolated;

Now we can linearly hand off entire object graphs to a task, either permanently or temporarily:

isolated int[] data = ...;
Task<int> t = Task.Run([consume data]() => {
    // in here, we own `data`.
});

Notice that we leveraged lambda capture lists to make linear captures of objects straightforward. There’s an active proposal to consider adding a feature like this to a future C#, however without many of the Midori features, it remains to be seen whether the feature stands on its own.

Because of the rules around isolation production, mutable objects produced by tasks could become isolated, and readonly object could be frozen to become immutable. This was tremendously powerful from a composition standpoint.

Eventually, we created higher level frameworks to help with data partitioning, non-uniform data parallel access to array-like structures, and more. All of it free from data races, deadlocks, and the associated concurrency hazards.

Although we designed what running subsets of this on a GPU would look like, I would be lying through my teeth if I claimed we had it entirely figured out. All that I can say is understanding the side-effects and ownership of memory are very important concepts when programming GPUs, and we had hoped the above building blocks would help create a more elegant and unified programming model.

The final major programming model enhancement this enabled was fine-grained “actors”, a sort of mini-process inside of a process. I mentioned the vat concept earlier, but that we didn’t know how to make it safe. Finally we had found the missing clue: a vat was really just an isolated bubble of state. Now that we had this concept in the type system, we could permit “marshaling” of immutable and isolated objects as part of the message passing protocol without marshaling of any sort – they could be shared safely by-reference!

I would say that the major weakness of this system was also its major benefit. The sheer permutations of concepts could be overwhelming. Most of them composed nicely, however the poor developers creating the underlying “safe concurrency” abstractions – myself included – almost lost our sanity in doing so. There is probably some generics-like unification between permissions and ownership that could help here, however the “funniness” of linearity is hard to quarantine.

Amazingly, it all worked! All those cases I mentioned earlier – image decoders, the multimedia stack, the browser, etc. – could now use safe intra-process parallelism in addition to being constructed out of many parallel processes. Even more interestingly, our one production workload – taking Speech Recognition traffic for Bing.com – actually saw significant reductions in latency and improvements in throughput as a result. In fact, Cortana’s DNN-based speech recognition algorithms, which delivered a considerable boost to accuracy, could have never reached their latency targets were it not for this overall parallelism model.
Sequential Consistency and Tear-Free Code

There was another unanticipated consequence of safe concurrency that I quite liked: sequential consistency (SC).

For free.

After all those years trying to achieve a sane memory model, and ultimately realizing that most of the popular techniques were fundamentally flawed, we had cracked the nut. All developers got SC without the price of barriers everywhere. Given that we had been running on ARM processors where a barrier cost you 160 cycles, this gave us not only a usability edge, but also a performance one. This also gave our optimizing compiler much more leeway on code motion, because it could now freely order what used to be possibly-side- effectful operations visible to multiple threads.

To see how we got SC for free, consider how the overall system was layered.

At the bottom of all of the above safe concurrency abstractions, there was indeed unsafe code. This code was responsible for obeying the semantic contract of safe concurrency by decorating APIs with the right permissions and ownership, even if the implementation physically violated them. But it is important to note: this is the only code in the system – plus the 1st party kernel code – that had to deal with concurrency at the threads, locks, events, and lock-free level of abstraction. Everything else built atop the higher-level abstractions, where barriers had already been placed into the instruction stream at all the right places, thanks to the infrastructure.

This had another consequence: no struct tearing was visible in the 3rd party programming model. Everything was “atomic”, again for free.

This allowed us to use multi-word slice and interface representations, just like Go does, but without the type-safety- threatening races. It turns out, the risk of struct tearing is one of major factors preventing us from having a great Go-like slice type to C# and .NET. In Midori, slices were safe, efficient, and everywhere.
Message Passing Races

Message passing helps tremendously when building correct, reliable concurrent systems, however it is not a panacea. I had mentioned shared nothing earlier on. It’s a dirty little secret, however, even if you don’t have shared memory, but agents can communicate with one another, you still have shared state encoded in the messaging between those agents, and the opportunity for race conditions due to the generally unpredictable order of arrival of these messages.

This is understood, although perhaps not very widely. The most worrisome outcome from these kind of races is time of check time of use (TOCTOU), one of the more common kinds of races that can lead to security vulnerabilities. (Midori’s type- and memory-safety of course helps to avoid this particular symptom, however reliability problems are very real also.)

Although people used to hate it when I compared this situation to COM STAs, for those familiar with them, an analogy is apt. If you need to block a thread inside of a COM STA, you must decide: Do I pump the message loop, or do I not pump the message loop? If you choose to pump the message loop, you can suffer reentrancy, and that reentrancy might be witness to broken invariants, or even mutate state out from underneath the blocking call, much to its dismay after it reawakens. If you choose not to pump the message loop, you can suffer deadlock, as calls pile up, possibly ones that are required to unblock the thread.

In Midori’s system, we did not give this choice to the developer. Instead, every await was an opportunity to pump the underlying message loop. Just as with a COM STA, these pumps possibly dispatched work that might interact with shared state. Note that this is not parallelism, mind you, since process event loops did not permit parallelism, however there is possibly a lot of concurrency going on here, and it can definitely screw you:

async bool IsRed(AsyncColor c) {
    return (await c.R > 0 && await c.G == 0 && await c.B == 0);
}

This rather simple (and silly) function checks to see if an AsyncColor is “red”; to do so, it reads the R, G, and B properties. For whatever reason, they are asynchronous, so we must await between accesses. If AsyncColor is a mutable object, well, guess what – these values might change after we’ve read them, opening up a possible TOCTOU bug. For instance, imagine a caller’s surprise when IsRed may have lied to it:

AsyncColor c = ...;
await IsRed(c);
assert(await c.R > 0);

That assertion can very well fire. Even this callsite has a TOCTOU bug of its own, since c.R might be >0 at the end of IsRed’s return, but not after the assert expression’s own await has completed.

All of this should be familiar territory for concurrency experts. But we sought to eliminate these headaches.

This area of the system was still under active development towards the end of our project, however we had sketched out a very promising approach. It was to essentially apply similar permission annotations to asynchronous activity – hence my choice of the term “activity” earlier – as we did parallel tasks. Although this seriously limited an asynchronous activity’s state purview, combined with a reader/writer-lock like idea, meant that we could use permissions affixed to asynchronous interfaces to automatically ensure state and asynchronous operations were dispatched safely.
Evolution

Before moving on, a brief word on the evolution of the system. As I mentioned earlier, I presented the system in its final form. In reality, we went through five major phases of evolution. I won’t bore you with exhaustive details on each one, although I will note the major mistakes and lessons learned in each phase.

In the first phase, I tried to build the system entirely out of annotations that were “outside” of the type system. As I’ve already said, that failed spectacularly. At this point, I hope you can appreciate how deeply integrated into the compiler and its type system these concepts need to be for them to work and for the result to be usable.

Next, I tried a variant of this with just readonly. Except I called it readable (a name that would stick until the very tail end of the project), and it was always deep. There was no immutable and there was no isolated. The concept of mutable was called writable, although I was delusional, and thought you’d never need to state it. I was very confused about the role generics played here, and ended up coding myself up into a corner trying to make it work.

After that, I recognized at least that readable and writable were related to one another, and recognized the subtyping relationship of (writable <: readable). And, largely based on conversations with colleagues in MSR, I decided to toss out everything I had done on generics and redo it. It was at that time I recognized that each generic type variable, despite looking like a naked type, actually carried both a permission and a type. That helped.

I then came up with immutable, however it wasn’t what you see today. Instead, it had the slightly confusing meaning of being a “view” over just the immutable subset of data in the target object graph. (This was at first limited to only readonly fields (in the classical C# sense) that were of a primitive type.) If you tried reading a non-immutable part from this view, you’d get a compiler error. Bizarrely, this meant you could have an immutable List<T> that wasn’t actually immutable. In hindsight, this was pretty wonky, but it got us thinking about and discussing immutability.

Somewhere in here, we recognized the need for generic parameterization over permissions, and so we added that. Unfortunately, I originally picked the % character to indicate that a generic type was a permission, which was quite odd; e.g., G<%P> versus G<T>. We renamed this to permission; e.g., G<permission P> versus G<T>.

There was one problem. Generic permissions were needed in way more places than we expected, like most property getters. We experimented with various “shortcuts” in an attempt to avoid developers needing to know about generic permissions. This hatched the readable+ annotation, which was a shortcut for “flow the this parameter’s permission.” This concept never really left the system, although (as we will see shortly), we fixed generics and eventually this concept became much easier to swallow, syntax-wise (especially with smart defaults like auto-properties).

We lived with this system for some time and this was the first version deployed at-scale into Midori.

And then a huge breakthrough happened: we discovered the concepts necessary for isolated and, as a result, an immutable annotation that truly meant that an object (graph) was immutable.

I can’t claim credit for this one. That was the beauty of getting to this stage: after developing and prototyping the initial ideas, and then deploying them at-scale, we suddenly had our best and brightest obsessing over the design of this thing, because it was right under their noses. This was getting an initial idea out in front of “customers” early-and-often at its finest, and, despite some growing pains, worked precisely as designed.

We then wallowed in the system for another year and 1/2 and, frankly, I think lost our way a little bit. It turns out deepness was a great default, but sometimes wasn’t what you wanted. List<T> is a perfect example; sometimes you want the List to be readonly but the elements to be mutable. In the above examples, we took this capability for granted, but it wasn’t always the case. The outer readonly would infect the inner Ts.

Our initial whack at this was to come up with shallow variants of all the permissions. This yielded keywords that became a never-ending source of jokes in our hallways: shreadable, shimmutable, and – our favorite – shisolated (which sounds like a German swear word when said aloud). Our original justification for such nonsense was that in C#, the signed and unsigned versions of some types used abbreviations (sbyte, uint, etc.), and shallow sure would make them quite lengthy, so we were therefore justified in our shortening into a sh prefix. How wrong we were.

From there, we ditched the special permissions and recognized that objects had “layers”, and that outer and inner layers might have differing permissions. This was the right idea, but like most ideas of this nature, we let the system get inordinately more complex, before recognizing the inner beauty and collapsing it back down to its essence.

At the tail end of our project, we were working to integrate our ideas back into C# and .NET proper. That’s when I was adamant that we unify the concept of readable with readonly, leading to several keyword renames. Ironically, despite me having left .NET to pursue this project several years earlier, I was the most optimistic out of anybody that this could be done tastefully. Sadly, it turned out I was wrong, and the project barely got off the ground before getting axed, however the introductory overview above is my best approximation of what it would have looked like.
Inspirations

Now that we have seen the system in its final state, let’s now trace the roots back to those systems that were particularly inspiring for us. In a picture:

Influences

I’ll have to be brief here, since there is so much ground to cover, although there will be many pointers to follow up papers should you want to dive deeper. In fact, I read something like 5-10 papers per week throughout the years I was working on all of this stuff, as evidenced by the gigantic tower of papers still sitting in my office:

Concurrency Paper Stack
const

The similarities with const should, by now, be quite evident. Although people generally have a love/hate relationship with it, I’ve always found that being const correct is worth the effort for anything bigger than a hobby project. (I know plenty of people who would disagree with me.)

That said, const is best known for its unsoundness, thanks to the pervasive use of const_cast. This is commonly used at the seams of libraries with different views on const correctness, although it’s also often used to cheat; this is often for laziness, but also due to some compositional short-comings. The lack of parameterization over const, for example, forces one to duplicate code; faced with that, many developers would rather just cast it away.

const is also not deep in the same way that our permissions were, which was required to enable the safe concurrency, isolation, and immutability patterns which motivated the system. Although many of the same robustness benefits that const correctness delivers were brought about by our permissions system, that wasn’t its original primary motivation.
Alias Analysis

Although it’s used more as a compiler analysis technique than it is in type systems, alias analysis is obviously a close cousin to all the work we did here. Although the relationship is distant, we looked closely at many uses of aliasing annotations in C(++) code, including __declspec(noalias) in Visual C++ and restrict (__restrict, __restrict__, etc.) in GCC and standard C. In fact, some of our ideas around isolated eventually assisted the compiler in performing better alias analysis.
Linear Types

Phillip Wadler’s 1990 “Linear types can change the world!” was immensely influential for me in the early days. I remember a huge lightbulb going off when I first read this paper. Linear types are inspired by the linear logic of J.-Y. Girard, and it is easy to get lost in the mathematics for hours.

In a nutshell, a linear type lets you prove that a variable is used exactly once. This is similar to isolated, however due to the aliasing properties of an imperative language like C# (especially for heap structures with possible cycles between them), the simple and elegant model of strict linearity is hard to make work.

Linear types themselves also aren’t very commonly seen in the wild, and are mostly useful for their mathematical and proof properties. If you go looking, you will find examples, however. More than real syntax in real languages, linear types have been hugely influential on subsequent innovations in type systems that also impacted us, such as affine and uniqueness types.
Haskell Monads

In the early days, I was pretty obsessed with Haskell, to put it mildly.

I often describe the above system that we built as the inverse of the Haskell state monad. In Haskell, what you had was a purely functional language, with sugar to make certain aspects look imperative. If you wanted side-effects, you needed to enter the beautiful world of monads. In particular, for simple memory side-effects, the state monad let you have traditional mutable data structures, but in a way that the type system very much understood and could restrict for safety where appropriate.

Well, the system we built was sort of the opposite: you were in an imperative language, and had a way of marking certain aspects of the program as being purely functional. I am pretty sure I read the classic “State in Haskell” paper at least a dozen times over the years. In fact, as soon as I recognized the similarities, I compared notes with Simon Peyton-Jones, who was immensely gracious and helpful in working through some very difficult type system design challenges.
Effect Types

Effect typing, primarily in the ML community, was also influential in the early days. An effect type propagates information at compile-time describing the dynamic effect(s) executing said code is expected to bring about. This can be useful for checking many properties.

For example, I always thought of await and throws annotations as special kinds of effects that indicate a method might block or throw an exception, respectively. Thanks to the additive and subtractive nature of effect types, they propagate naturally, and are even amenable to parametric polymorphism.

It turns out that permissions can be seen as a kind of effect, particularly when annotating an instance method. In a sense, a mutable instance method, when invoked, has the “effect” of mutating the receiving object. This realization was instrumental in pushing me towards leveraging subtyping for modeling the relationship between permissions.

Related to this, the various ownership systems over the years were also top-of-mind, particularly given Midori’s heritage with Singularity, which used the Spec# language. This language featured ownership annotations.
Regions

Regions, despite classically being used mostly for deterministic and efficient memory management, were incredibly interesting towards the days of figuring out isolated.

They aren’t identical for several reasons, however.

The first reason is that isolated object graphs in our system weren’t as strictly partitioned as regions, due to immutable in- and out- references. Regions are traditionally used to collect memory efficiently and hence dangling references like this wouldn’t be permitted (and the reachability analysis to detect them would basically devolve into garbage collection).

The second reason is that we wanted to avoid the syntactic burden of having regions in the language. A good example of this in action is Deterministic Parallel Java, which requires explicit region annotations on objects using a very generics-like syntax (e.g., Foo<region R>). Some amount of this can be hidden from the developer through more sophisticated compiler analysis – much like Cyclone did – however, we worried that in some very common cases, regions would rear their ugly heads and then the developer would be left confused and dismayed.

All that said, given our challenges with garbage collection, in addition to our sub-process actor model, we often pondered whether some beautiful unification of isolated object graphs and regions awaited our discovery.
Separation Logic

Particularly in the search for formalisms to prove the soundness of the system we built, separation logic turned out to be instrumental, especially the concurrent form. This is a formal technique for proving the disjointness of different parts of the heap, which is very much what our system is doing with the safe concurrency abstractions built atop the isolated primitive. In particular, our OOPSLA paper used a novel proof technique, Views, which can be constructed from separation algebras. Caution: this is getting into some very deep mathematical territory; several colleagues far smarter than I am were the go-to guys on all of this. But, it certainly helped all of us sleep better at night.
Uniqueness Types

Uniqueness types are a more recent invention, derived from some of the early linear type systems which so fascinated me early on. For a period of time, we actually had a unique keyword in the language. Eventually we folded that back into the concept of isolated (it was essentially a “shallow” isolated). But there is no denying that all of this was heavily inspired by what we saw with uniqueness types, especially in languages like Clean, the experimental work to bring uniqueness to Scala, and, now, Rust.
Model Checking

Finally, I would be remiss if I didn’t at least mention model checking. It’s easy to confuse this with static analysis, however, model checking is far more powerful and complete, in that it goes beyond heuristics and therefore statistics. MSR’s Zing and, although we used it to verify the correctness of certain aspects of our implementation, I don’t think we sufficiently considered how model checking might impact the way safety was attained. This was top-of-mind as we faced intra-process interleaving race conditions. Especially as we look to the future with more distributed-style concurrency than intra-process parallelism, where state machine verification is critical, many key ideas in here are relevant.
Other Languages

This story spans many years. During those years, we saw several other languages tackling similar challenges, sometimes in similar ways. Because of the complex timeline, it’s hard to trace every single influence to a given point in time, however it’s fair to say that four specific languages had a noteworthy influence on us.

(Note that there are dozens of influential concurrent and parallel languages that inspired our work. I’m sure I haven’t read everything there is to read – there’s always more to learn – however I did my best to survey the field. I will focus here on the most mainstream and relevant to people writing production code in the year 2016.)
(Modern) C++

I already mentioned const and its influence.

It is also interesting to note the similarities between isolated and C++11’s std::unique_ptr. Although born in different times, and in very different worlds, they both clearly deliver a similar perspective on ownership. Noted difference include deepness – C++’s approach is “deep” insofar as you leverage RAII faithfully in your data structures – and motivations – C++’s motivation being primarily memory management, and neither safe concurrency nor immutability.

The concept of constexpr has obvious similarities to both isolated and immutable, particularly the compile-time evaluation and freezing of the results. The continued evolution of constexpr in C++13 and C++17 is taking the basic building blocks to new frontiers that I had always wanted to do with our system, but never had time, like arbitrary compile-time evaluation of expressions, and freezing/memoization of the results.

Thankfully, because I was leading the C++ group at Microsoft for some time after Midori, I was able to bring many of our lessons learned to the discussion, and I like to think it has had a positive impact on evolving C++ even further.
D

The system we came up with has obvious comparisons to D’s take on const and immutable; just as D’s const is a view over mutable or immutable data, so too is our readonly. And just as D added deepness to the concept of const, so did we in our permissions model generally. This is perhaps the closest analogy in any existing systems. I am frankly surprised it doesn’t get used an order of magnitude more than it does, although Andrei, one of its chief developers, has some thoughts on that topic.
Go

Although I personally love programming in Go, it didn’t have as much influence on our system as you might expect. Go lists concurrency as one of its primary features. Although concurrency is easy to generate thanks to goroutines, and best practices encourage wonderful things like “Share Memory by Communicating”, the basic set of primitives doesn’t go much beyond the threads, thread-pools, locks, and events that I mention us beginning with in the early days of this journey.

On one hand, I see that Go has brought its usual approach to bear here; namely, eschewing needless complexity, and exposing just the bare essentials. I compare this to the system we built, with its handful of keywords and associated concept count, and admire the simplicity of Go’s approach. It even has nice built-in deadlock detection. And yet, on the other hand, when I find myself debugging classical data races, and torn structs or interfaces, I clamor for more. I have remarked before that simply running with GOMAXPROCS=1, coupled with a simple RPC system – ideally integrated in such a way where you needn’t step outside of Go’s native type system – can get you close to the simple “no intra-process parallelism” Midori model that we began with. And perhaps the best sweet spot of all.
Rust

Out of the bunch, Rust has impressed me the most. They have delivered on much of what we set out to deliver with Midori, but actually shipped it (whereas we did not). My hat goes off to that team, seriously, because I know first hand what hard, hard, hard work this level of type system hacking is.

I haven’t yet described our “borrowed references” system, or the idea of auto-destructible types, however when you add those into the mix, the underlying type system concepts are remarkably similar. Rust is slightly less opinionated on the overall architecture of your system than Midori was, which means it is easier to adopt piecemeal, however the application of these concepts to traditional concurrency mechanisms like locks is actually fascinating to see.

This article gives a great whirlwind tour of safe concurrency in Rust. Poking through to some of the references reveals APIs designed with similar principles in mind. For example, simple_parallel looks a whole lot like the PFX Parallel API described earlier with safety annotations applied to it. I trust their system more than ours, because they have shipped and had thousands of eyes and real-world experience applied to it.
Epilogue and Conclusion

Although I’ve glossed over many details, I hope you enjoyed the journey, and that the basic ideas were clear. And, most importantly, that you learned something new. If you want to understand anything in greater detail, please see our OOPSLA paper, or just ask.

It’s been a couple years since I’ve been away from this. As most of you know, Midori happened before the OSS renaissance at Microsoft, and so it never saw the light of day. In that time, I’ve pondered what lessons we learned on this journey, and whether any of it is relevant beyond the hallways of our old building 34. I believe it is, otherwise I’d not have taken the time to write up this article.

I’m thrilled that the world has adopted tasks in a big way, although it was for a different reason than we expected (asynchrony and not parallelism). In many ways this was inevitable, however I have to think that doing tasks a half-decade ahead of the curve at least had a minor influence, including the async and await ideas built atop it.

Data parallelism has taken off…sort of. Far fewer people leverage CPUs in the way we imagined, but that’s for good reason: GPUs are architected for extremely wide SIMD operations over floating points, which is essentially the killer scenario for this sort of parallelism. It doesn’t cover all of the cases, but man does it scream.

Safe concurrency is still critically important, yet lacking, and the world still needs it. I think we collectively underestimated how long it would take for the industry to move to type- and memory-safe programming models. Despite the increasing popularity of safe systems languages like Go and Rust, it pains me to say it, but I still believe we are a decade away from our fundamental technology stacks – like the operating systems themselves – being safe to the core. But our industry desperately needs this to happen, given that buffer errors remain the #1 attack type for critical security vulnerabilities in our software.

I do think that concurrency-safety will be our next frontier after type- and memory-safety have arrived. TOCTOU, and race conditions generally, are an underexploited yet readily attackable vector. (Thankfully, just as writing correct concurrent code is hard, so too is provoking a latent concurrency error through the delicate orchestration of race conditions). As more systems become concurrent (distributed) systems this will become an increasing problem for us. It’s not clear the exact formulation of techniques I demonstrated above is the answer – in fact, given our focus on parallelism over asynchrony, surely it is not – however we will need some answer. It’s just too damn hard to build robust, secure, and safe concurrent programs, still, to this day, 15 years later.

In particular, I’m still conflicted about whether all those type system extensions were warranted. Certainly immutability helped with things far beyond safe concurrency. And so did the side-effect annotations, as they commonly helped to root out bugs caused by unintended side-effects. The future for our industry is a massively distributed one, however, where you want simple individual components composed into a larger fabric. In this world, individual nodes are less “precious”, and arguably the correctness of the overall orchestration will become far more important. I do think this points to a more Go-like approach, with a focus on the RPC mechanisms connecting disparate pieces.

The model of leveraging decades of prior research was fascinating and I’m so happy we took this approach. I literally tried not to invent anything new. I used to joke that our job was to sift through decades of research and attempt to combine them in new and novel ways. Although it sounds less glamorous, the reality is that this is how a lot of our industry’s innovation takes place; very seldom does it happen by inventing new ideas out of thin air.

Anyway, there you have it. Next up in the series, we will talk about Battling the GC.

