+++
title = "Bazaar"
description = "Things I have a tendency to come back to"
date = 2019-03-17
weight = 10
draft = false
in_search_index = true
[extra]
+++

- [buy when i buy my own windows pc - lazy nezumi](https://lazynezumi.com/buy)
- [FetiFes](https://www.fetifes.com/)
- word for "theme song" 主題歌

- [Library to parse/optimize queries from SQL](https://calcite.apache.org/)

Web Framework Benchmark https://www.techempower.com/benchmarks/#section=test&runid=26a79c95-5eec-4572-8c94-dd710df659d7&hw=ph&test=plaintext

link to matsumoto san later:
- https://www.reddit.com/r/programming/comments/cwk9hl/modern_continuous_delivery_with_ken_mugrage/
- [A deep dive into Linux namespaces](http://ifeanyi.co/)
- [testing in production](https://medium.com/@copyconstruct/testing-in-production-the-hard-parts-3f06cefaf592) great article as usual
- [10 years with AWS](https://www.allthingsdistributed.com/2016/03/10-lessons-from-10-years-of-aws.html)
- [dealing with unanticipated needs](https://www.youtube.com/watch?v=xYqWREPb3Lc)
- [minimize blast radius](https://www.youtube.com/watch?v=swQbA4zub20)

mentioned jsonistas in some perf improv but should actually mention nippy https://github.com/ptaoussanis/nippy

### git whitelist instad of blacklist!

gitignore file example

```
*
*/**
!.gitignore
!public
!public/db_client/*.php
!public/**/*.php
```

tool to look for secrets in repository

https://github.com/techgaun/github-dorks

### Online backup tool

[Tarsnap](http://www.tarsnap.com/)

### Configure a machine

Lxde was great, last time I used lxqt, it was shit. the new lxqt terminal fucks up emacs hard. binding configuration is terrible. UX here and there is horrendously broken.

From now on use Xubuntu, if using Lubuntu use Lxterminal for terminal

Install "typecatcher" to get fonts, then install "inconsolata" (14)

Theme solarized dark

ps: windows 10 virtualbox vm -> activate the harddrive cache bypass, some stuff to do inside the vm too, i forgot, google it

nice font, ["lotion"](https://font.nina.coffee/)

MacOS terminal iterm2 or hyper

Windows 10 tiling window manager https://github.com/microsoft/PowerToys

### where to buy/get

#### 3D printing

- [online printing](https://all3dp.com/1/best-online-3d-printing-service-3d-print-services/)
- [FDM printers](https://all3dp.com/1/best-3d-printer-reviews-top-3d-printers-home-3-d-printer-3d/)
- [resin printers](https://all3dp.com/1/best-resin-dlp-sla-3d-printer-kit-stereolithography/)

soft FreeCAD - Free

Fusion360 500$/year

SketchUp free / 120$/year /  300$/year

#### PC

- [puri.sm](https://www.puri.sm)
- [system76](https://www.system76.com)
- [pogolinux](https://www.pogolinux.com/)

who delivers to japan????

#### Secure OS

- [Qubes OS](https://www.qubes-os.org/) easy isolation VMs - need to check if can run a windows VM with GPU passthrough

nVidia has antivirtualization on consumer level graphic cards stuff which might make it hard...

seems unreasonable hard...

- [ParrotSec](https://www.parrotsec.org/) for pentesting/reverse engineering etc.

will probably use windows 10 with WSL2 and separate VMs for sensitive stuff...

1. one VM for porn and shit
2. one VM for usual browsing
3. one VM for banking, AWS stuff etc.
4. dev on WSL and host with locked down rights (UE4 editor, VStudio, Emacs etc.)

### Vegan stuff

- [iHerb](https://jp.iherb.com)

#### Glasses

- [Zenni Optical](https://www.zennioptical.com/b/all-men-glasses/_/N-1341992444)
- [Warby Parker](https://www.warbyparker.com/)

#### Bread

- Bricolage - Roppongi
- Truffle bakery - Honzen Nakajo

### baby education

- [nuryl](ttps://www.nuryl.com/)

### good french cuisine tokyo

- [pachon](http://www.pachon.co.jp/jpn/pachon/index_main.html)
- [lugdunum](https://tabelog.com/en/tokyo/A1309/A130905/13043985/)
- [paul bocuse](https://www.hiramatsurestaurant.jp/eng/paulbocuse-maison/)
- [carthago (good couscous in nakano)](https://www.tripadvisor.com/Restaurant_Review-g14134438-d7491828-Reviews-Carthago-Nakano_Nakano_Tokyo_Tokyo_Prefecture_Kanto.html)

### podiatry in tokyo

https://tokyopodiatry.jp

### snowboard

- [snow state](http://www.powderportal.net/)
- [tours](http://www.travex.co.jp/)

Yachihokougen if it still exits
Go to Mont Blanc restaurant, get a reduction coupon!!!

Shirakaba "2 in 1"

Frontside 360, olly 360

### toread

- [Serializability](https://en.wikipedia.org/wiki/Serializability)
- [Linearizability](https://en.wikipedia.org/wiki/Linearizability)
- [First order logic](https://en.wikipedia.org/wiki/First-order_logic)
- [Second order logic](https://en.wikipedia.org/wiki/Second-order_logic)
- [Windows Operating System Fundamentals](https://1.cdn.edl.io/Ha5eym5sDQ2I8DZmruMnsUsZbIIIpDq3t32jz8XsvXlO4GxO.pdf)
- some novel from Tsutsuya Yasutaka
- [use qemu to run executables for easy cross platform unit tests](https://www.chromium.org/chromium-os/testing/qemu-unittests)

### nice songs

{{ youtube(id="rb2S0dTn0GQ") }}

### software

- [windows system tools](https://www.resplendence.com/downloads)

### doc

- [sql indexing and tuning](https://use-the-index-luke.com/)

### libs

- [seastar, high performance c++ server framework](https://github.com/scylladb/seastar)
- [non euclidian game engine](https://github.com/HackerPoet/NonEuclidean)

### todo one day

#### DC GC
DC GC - Client: PAMELA LEARN GC PATTERNS, SEND MESSAGE TO UNBIND FOR A TIME
HAP DC GC Agent: Receives messages and unbind for a time
(we need a way to send dummy requests at the same RPS to actually provoke the GC)
(replay get requests???)(force GC by hand with JVM debugger agent API?)
(when we start unbinding for GC, we might try sometimes to not unbind and let it GC to see if our assumptions were right)


- dreadit (distributed reddit)
- a replacement for html/css/js
- New stack overflow with all questions and answers open and a concept of human GC + only knowledgeable people vote questions and answers plus (no minus) + inline repl/code exec to test if answers compile/run (embed tests)
- effective dating website
- system to avoid banking interest/inflation/deflation which is not a fucking bitcoin scam
- decent electronic voting system
- something about education
- system for helping people in your proximity in exchange of other services, food stuff, or small amount of money (up to 2000 yen) - usable by homeless people
- affordable daycare (requirement so i can make that: be rich…)
- portable body scanner to understand the mechanical deficiencies of my body, where are the bones shifted, how is it moving and how should it

http://www.wikitract.com/sparseness-meets-deepness-3d-human-pose-estimation-from-monocular-video/#comment-58

### Karaoke

- [kaneko yukari - 再会](https://www.youtube.com/watch?v=hbIT9sNQOBk)
- [さだまさし - tsugunai](https://www.youtube.com/watch?v=36iMzu5s4vg)
- [大川栄策　さざんかの宿 Sazanka no Yado](https://www.youtube.com/watch?v=oZyBmikEbV8)
- [Flo Rida - Whistle](https://www.youtube.com/watch?v=cSnkWzZ7ZAA)
- [Hito toshite Jiku ga Bureteiru - Sayonara Zetsubou Sensei Op 1](https://www.youtube.com/watch?v=ry5ljUeuyDQ)
- [Kuusou Runba - Zetsubou Sensei](https://www.youtube.com/watch?v=r6Kwn0VeUd4)
- [Tsukuyomi moon phase - Op](https://www.youtube.com/watch?v=h23DPi1TG78)
- [東京プリン-携帯あいか](https://www.youtube.com/watch?v=yrf-IPm-paw)
- READY STEADY GO
- [Aqua - Barbie Girl](https://www.youtube.com/watch?v=ZyhrYis509A)
- [Sousei No Aquarian OP](https://www.youtube.com/watch?v=MnBkbzHWRFs)
- [椎名林檎 - 歌舞伎町の女王 Kabukicho no Joou](https://www.youtube.com/watch?v=krCk3EcsaxE)
- Indestructible
- [甲賀忍法帖 (basilisk time)](https://www.youtube.com/watch?v=v86m2RdPSo8)
- 津軽海峡冬景色
- [チルノのパーフェクトさんすう教室 Cirno no perfect sansuu kyoushitsu](https://www.youtube.com/watch?v=5wFDWP5JwSM)
- [Megurina Lula - Double lariat](https://www.youtube.com/watch?v=TY5cj3IRJow)
- [吉幾三 - 酒よ](https://www.youtube.com/watch?v=8dClLW5tqHE)
- [Susumu Hirasawa - Forces](https://www.youtube.com/watch?v=NkYYYew8CUI)

### Onsen

Hottarakashi onsen - yamanashi ken

### Manzai

- Sandwichman
- 中川家
- 笑い飯
- 千鳥
- アイデンティティ
- ダウンタウン　ごっつええ感じ
- アンジャッシュ
- ラーメンズ
- オール阪神・巨人
- Hanawa, Downtown

### Cleaning services

- [OneGai](https://www.one-gai.com/services/search)
- clothes/futon : https://www.lenet.jp/
- house & food: http://www.omakasesan.com/course/house.html
- house & food: http://www.daikoukaasan.com/cooking.html
- house & food: http://www.life-x.co.jp/
- house & food: http://otasuke365.com/
- ??? : https://casial.jp/
- ??? : https://casy.co.jp/
- hardcore house cleaning: http://www.osoujihonpo.com/house-cleaning/
- hardcore house cleaning: https://curama.jp/house/

### Kimono

Right under, left above

### Try in Japan

| when     | what                               |
|----------|------------------------------------|
| Mid July | Hakata Gion Yamakasa  博多祇園山笠 |
| ???      | kyoto Kodaiji Fushimi inari        |

### Try in Korea

| when | what          |
|------|---------------|
| ???  | 목포 and 광주 |

### SEO

eventually do that for my games

- [backlinko SEO checklist](https://backlinko.com/seo-checklist)

### Graceful-close for HTTP/2 servers

https://kazu-yamamoto.hatenablog.jp/entry/2019/09/20/165939
