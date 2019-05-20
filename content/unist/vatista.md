+++
title = "Vatista"
description = "notes on learning vatista"
date = 2019-03-17
weight = 100
draft = false
in_search_index = true
[taxonomies]
#tags = [ "clojure" ]
[extra]
+++

- [FRAME DATA](#frame-data)
- [COMBOS](#combos)

| Data from                                                                                                                                                                                                                                                                                                                                                                                |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Koishi](https://twitter.com/crazy_lemonmilk) Vatista [combo guide](https://www.evernote.com/shard/s319/client/snv?noteGuid=66eb1d7d-7b1c-4c46-9462-4f8f1a5fb960&noteKey=c6b0f1e181b407f9111d70de7665480e&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs319%2Fsh%2F66eb1d7d-7b1c-4c46-9462-4f8f1a5fb960%2Fc6b0f1e181b407f9111d70de7665480e&title=UNIST%2Bv3.20%2BVatista%2BCombo%2BGuide) |
| Dainiru [combo guide](https://docs.google.com/document/d/10S5xFq9PDQRTqYtVxs0P6tv2URhHsnl_bwed_l73Xx4/edit)                                                                                                                                                                                                                                                                              |
| [Boruphen's charge partitioning guide](https://www.evernote.com/shard/s628/client/snv?noteGuid=ae0b78c4-cd9d-4917-a005-adc76820c93c&noteKey=28ded817c39ffe5b626230061e9668c2&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs628%2Fsh%2Fae0b78c4-cd9d-4917-a005-adc76820c93c%2F28ded817c39ffe5b626230061e9668c2&title=Boruphen%2527s%2BGuide%2Bto%2BCharge%2BPartitioning%2Bin%2BUNIST)     |
| The [Mizuumi wiki!](http://wiki.mizuumi.net/w/Under_Night_In-Birth/UNIST/Vatista)                                                                                                                                                                                                                                                                                                        |
| [Nice doc on all chars!](https://www.evernote.com/shard/s454/client/snv?noteGuid=5f20d298-4eea-442d-91f4-2a6fcfa33e8c&noteKey=a032c800fd4a65b3&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs454%2Fsh%2F5f20d298-4eea-442d-91f4-2a6fcfa33e8c%2Fa032c800fd4a65b3&title=I%2BWant%2Bto%2BGet%2BStrong%2Bat%2BUNI.%2BVolume%2B9)                                                              |

Vatista cannot be counter hit, ever. It's a vatista thing.

#### Special moves

| shortname | fullname        | input             | description                                                                                                                                |
|-----------|-----------------|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| fb        | Stella Lumen    | [4]6 A/B/C        | sonic boom (53f charge)                                                                                                                    |
| beam      | Mikoluceo       | [6]4 A/B/C        | reverse sonic boom (53f charge)                                                                                                            |
| fk        | Luvel Angelus   | [2]8 A/B/C        | flash kick                                                                                                                                 |
| drill     | Transvorance    | [8]2 A/B/C        | reverse flash kick (43f charge)                                                                                                            |
| 💎   | Deus Fragmentum | [A/B/C] ... ](2)A/B/C[ | button hold and release/birdie bull horn (61f charge), 1 💎 by button, position change with stand/crouch/air, 💥 is untechable |

#### Frame data

| button      | startup    | active | recovery  | on block        | level | note                                         |
|-------------|------------|--------|-----------|-----------------|-------|----------------------------------------------|
| 5A          | 6          | 3      | 12        | -3              | high  |                                              |
| 2A          | 6          | 3      | 12        | -3              | high  |                                              |
| 5B          | 12         | 9      | 18        | -2              | high  |                                              |
| 5BB         | -          | 6      | 25        | -8              | high  | sucks                                        |
| 2B          | 10         | 9      | 29        | -13             | high  |                                              |
| 2BB         | -          | 6      | 25        | -8              | high  |                                              |
| 5C          | 12         | 5      | 22        | -11             | high  |                                              |
| 2C          | 11         | 13     | 23        | -6 to -16       | low   |                                              |
| jA          | 6          | 3      | 2land     | ?               | mid   |                                              |
| jB          | 11         | 6      | 3land     | ?               | mid   |                                              |
| jC          | 12         | 10     | 4land     | ?               | high  |                                              |
| jA+B        | 18         |        |           |                 |       | (floats)                                     |
| 66B         | 10         | 2      | 12        | -2              | high  | CS/EX cancel, counterhitKD                   |
| 66C         | 12         | 18     | 20        | -5              | high  | guruguruguru~, cancellable                   |
| groundFF    | 10         | 3      | 30        | -4/-6(held)     | high  |                                              |
| airFF       | 14         | 6      | 9land     |                 | high  | CS/EX cancel                                 |
| throw       | 4          | 1      | 22        |                 |       |                                              |
| guardcancel | 0          | 16     | 5         | -14             | high  |                                              |
| VO          | 21 to 69   | 2      | 37        | -13             | high  |                                              |
| Afb (ball)  | 21(ground) |        |           | +8 to +17       | high  | 53f charge, disappear when hit               |
| Bfb         | 19(ground) |        |           | +19 to -6       | high  | 53f charge, disappear when hit               |
| EXfb        |            |        |           | ...             |       | 53f charge, disappear when hit               |
| A/D/EXfk    | 4          |        |           |                 |       | 53f charge, CS cancellable                   |
| Abeam       | 14         | 5      | 24(41air) | -3(-5 air)      |       | 53f charge, extra air action                 |
| Bbeam       | 15(17air)  | 5      | 21(41air) | 0 (-10~-20 air) |       | 53f charge, extra air action                 |
| EXbeam      | 8          | 25     | 54(?air)  | +7(+11air)      |       | 53f charge                                   |
| 💎     | 1(7)       |        |           |                 |       | 61f charge, 💥 untechable until landing      |
| Adrill      | 7          | 13     | 18        | 2               | high  | 43f charge                                   |
| Bdrill      | 20         | 9      | 48        | -7              | mid   | 43f charge, air unblockable, exBeam on block |
| Cdrill      | 5          | ...    | 18        | -1              | mid   | 1-3f strike inv., 4-~f fb inv.               |
| IW          | 12         | ...    | ...       | -33             | high  | 1-147f inv.                                  |
| IWEXS       | 15         | 6      | ...       | -25             | high  | 1-26f inv.                                   |

## Combos

- Can I cancel beam into 💎? Nope ~
- big proration can make enders minus (cannot detonate the oki 💎 safely)
- Akatsuki, Byakuya, and Chaos <- make delayed 2C pickups whiff

## Combo guide 1

| input       | command                                |
|-------------|----------------------------------------|
| [4]6X       | Fb                                     |
| [6]4X       | Beam                                   |
| [2]8X       | Fk                                     |
| [8]2X       | Drill                                  |
| Button Hold | 💎 (Standing💎: 5💎, Crouching💎: 2💎) |
| [X]         | hold X                                 |
| dl          | Delay                                  |

Starter -> Meat -> Ender

| proration | combo                                                    |
|-----------|----------------------------------------------------------|
| heavy     | 2[C]>2💎>2A>2B(1) 💥>5💎 💥>J[C]>Adrill>💎               |
| mid       | 2[C]>2💎>2A>2B 💥>2💎>B Beam 💥(h)>JA>Adrill>💎          |
| light     | 2[C]>2💎>2A>A Beam 💥>2💎>(2C)>B Beam 💥(h)>JA>Adrill>💎 |

confirm from 2 As => Give up💎 combos, if you want💎 from A, A>2C>5C or A>2C>5C

Meter spend:

| meter     | ender                                        |
|-----------|----------------------------------------------|
| meterless | 2nd💥>JA>Adrill>2💎                          |
| 100%      | 2nd💥>JC>[8]FF>C Drill (before final FF hit) |
| 200%      | 2nd💥>IW/IWE                                 |
| VO        | 2nd💥> VO <VO Ender>                         |


| starter               | combo                                                                                                   | note                                      |
|-----------------------|---------------------------------------------------------------------------------------------------------|-------------------------------------------|
| A                     | A>(B)>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                                  |                                           |
| A                     | 5A>2C>2A Whiff>Dash 2A>jA>j[B]>jC>Land 2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                       | when far, use 2C bounce to dash pick up   |
| A                     | 5A(Antiair)>jA>j[B]>Adrill> 2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                       | AA                                        |
| B/C                   | B>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                           | very tight                                |
| B/C                   | 2B>2C>2A Whiff>Dash 2A>jA>jB>Adrill(h)>2[C]>dl5B>2💎>5A>💥>2💎>2C>Bbeam>💥>jA>Adrill>💎                 | sliiightly more damage but harder         |
| assault B/C           | Assault jB/jC>5A>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                       | vveeeeery tight                           |
| jC/grd brk/counterhit | >5A>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                         |                                           |
| assault B/C AA        | >5A>jA>j[B]>Adrill>2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                                           | on AA jC or CH assault AA you can do more |
| 66B CH                | 66Bch>Microdash 5A>2C>5C>dlj[B]>dlAdrill> 2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎         | microdash 2C is possible                  |
| GuruGuru              | 66C>2FF>2A>jA>j[B]>jC> 2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                                       | wait to be point blank for 2FF            |
| GuruGuru              | 66C>2FF>2A>jA>j[B]>jC>Land 2[C]>5💎>2A>5B>Bbeam>💥> Dash 2💎(h)>Abeam>💥>jA>Adrill>💎                   | Hard, more damage                         |
| Crossup GuruGuru      | 66C>(Crossup)A Fb>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>2B>💥>2💎>[Bbeam]>💥>jA>Adrill>💎                   |                                           |
| AA GuruGuru           | 66C(Air hit)>5A>jA>j[B]>Adrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                    |                                           |
| Close 2FF             | Close 2FF>2A>jA>jB>Adrill(h)>2[C]>dl5B>2💎>5A>💥>2💎>2C>Bbeam>💥>jA>Adrill>💎                           |                                           |
| >💥                   | >💥>5A>jA>j[B]>Adrill>2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                                        | 💎 combos are very peculiar...            |
| corner>💥             | (Corner)💎💥>5C>j[B]>Adrill>2C>A Fb>2[C]>2💎>2A>2B(1)💥>5💎>💥>j[C]>Adrill>💎                           | (harder)                                  |
| Bdrill                | Bdrill>66C>5A>jA>jB>jC>Land jA>j[B]>Adrill>2C>💎                                                        |                                           |
| corner Bdrill         | (Corner)Bdrill(h)>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                                 |                                           |
| Bfk                   | Bfk>CS(preslam)>Assault dljC>Land jA>j[B]>dlAdrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]💥>jA>Adrill>💎 |                                           |
| Bfk                   | Bfk>CS(preslam)>Assault dljA>jC>Land j[B]>dlAdrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]💥>jA>Adrill>💎 |                                           |

## Combo guide 2

Starter > Aerial > Landing > Ender

### Starters

These starters all take the place of 2C > 5C in the above 2C combo.

| starter             | note                                                                                        |
|---------------------|---------------------------------------------------------------------------------------------|
| 5A/2A > 2C > 5C     | standard, don't add a B                                                                     |
| 5B/2B > 2C > 5C     |                                                                                             |
| jB/jC > 2C > 5C     | if Assault, you'll need to use the jB > (jA >) Adrill for 💎 combo.                         |
| 66C > Afb > 2C > 5C | hold 6(4?), 6 will be 4 on crossup and give you a Afb. when no cross up, 66C > FF > CS > 5C |
| 5C > FF > CS > 5C   | when too far for 2C punish, or on unexpected hit                                            |
| 5C > 2C > 5B        | less range                                                                                  |
| 5C > 2C > FF > CS   | less range more dmg                                                                         |
| 66B (ch) > 2C > 5C  | 66B knocks the opponent down on counterhit, meaning you can follow up with this.            |

### Aerial Routes

(after 5C)

| aerial                                   | note                                                          |
|------------------------------------------|---------------------------------------------------------------|
| j[B] > jC > Adrill                       | Basic air combo. Works.                                       |
| j[B] > jC > land > jA > Adrill           | land > jA increases combo range                               |
| dl j[B] > dl Adrill                      | useful for tight 💎 combos, or double beam combos             |
| j[B] > jA > Adrill or jA > j[B] > Adrill | a bit more leniency than previous                             |
| jA > jB > jC > land > jA > jB > Adrill   | no fragment, good for AA 5A hits.                             |
| late jC > land > jA > j[B] > Adrill      | used for aerial CS combos (Bfk > CS, FF > CS) and random hits |
| jC > 5C > jA > jB > Adrill               | safe for random air hits                                      |

### Landing

(after Adrill)

| landing                                   | note                                                                              |
|-------------------------------------------|-----------------------------------------------------------------------------------|
| 2A/2C > 2B                                | fk is the only valid ender                                                        |
| 2[C] > 2]B[ > 2A > 2B > 2]C[ > Bbeam      | standard 💎 landing                                                               |
| 2[C] > 2]B[ > 2A > 2B(1) > 2]C[           | 2]C[ 💎 popped by first 💥. Used for 💎 starters, or when a combo pops a random💎 |
| 2[C] > 2]B[ > 2A > Abeam > 2]C[ > Abeam/B | double beam route. 2A Abeam has a big gap so mind the proration                   |

### Ender

| ender              | note                                                                                                                                                           |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| B/C Fk             | far oki mid screen, can do lots of safe stuff. Bfk great in the corner, C Fk meh in the corner.                                                                |
| jC > [8]FF > [8]2C | after 2+💎 hits. Holding [8] during FF drags the opponent upward, you get more hits out of Cdrill. It does more dmg than Fk ender and is safe at all proration |
| jC > Adrill        | Any aerial route into Adrill after a 2nd 💎 more or less works. better oki than Bfk midscreen. Get a 💎 that can be backteched                                 |

### Basic Combos

| combo                                                                        | note                                                                                                   |
|------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| 5A > 5B > 2C > 5C > jB > jC > Adrill > 2C > 2B > Bfk (2537)                  | easy combo, at any proration                                                                           |
| 5A > 5B > 2C > 5C > j[B] > jC > Adrill > 2C > 2]B[ > Bfk (2693)              | better combo, uses 1 💎                                                                                |
| 5A (AA) > jA > jB > jC > land > jA > jB > jC > Adrill > 2C > 2B > Bfk (2215) | basic AA combo, can connect from AA 66B/66C. Use 2A instead of 2C > 2B with 2A when proration is heavy |

### Midscreen Combos

Damage values indicate base damage. "+" values indicate bonus damage from Vorpal (CS combos only). Note that slight changes in timing can change the amount of hits your moves do, so expect values to vary in practice.

#### 2C

| combo                                                                                                                                                                                                         | note                                                                                       |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| (2A/5B/jB/jC >) 2C > 5C > j[B] > jC > land > jA > Adrill > 2[C] > 2]B[ > 2A > 2B > 2]C[ > Bbeam > (Bfk (3240) / [2]8C (4059) / jC > Adrill (3308) / jC > FF > [8]2C (4075))                                   | standard 💎 combo. B/Cfk after Bbeam is hard, you can use 2B instead                       |
| (5B >) 2C > 5C > 5FF(whiff) > 9FF > CS > jC > land > jA > j[B] > Adrill > 2[C] > 2]B[ > 2A > Abeam > 2]C[ > Abeam > (Bfk (3973+162) / [2]8C (4923+162) / jC > Adrill (4040+162) / jC > FF > [8]2C (4796+162)) | A CS version. whiff the grounded 5FF, but hold 9 to make the second (airborne) portion hit |

#### 💎

💥 > 5C > j[B] > jC > land > jA > Adrill > 2[C] > 2]B[ > 2A > 2B(1) > 2]C[ > (Bfk (3171) / [2]8C (4127) / jC > Adrill (3262))
- Standard 💎 combo

#### Bdrill

| combo                                                                                               | note                                                                           |
|-----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Bdrill > 66C > 5A > jA > jB > jC > land > jA > jB > Adrill > 2C > 2B > Bfk (2629) / [2]8C (3240)    | Standard meterless combo from 66C. 2C > 2B is tight so you can 2A > 2B instead |
| Bdrill > 66C > FF > CS > jC > land > jA > jB > Adrill > 2C > 2B > Bfk (2895+174) / [2]8C (3506+174) | A CS conversion for 0/100% bar.                                                |

#### Bfk

Bfk > CS > 66 dl jC > land > jA > j[B] > Adrill > 2[C] > 2]B[ > 2A > Abeam > 2]C[ > Abeam > (Bfk (3644+152) / [2]8C (4416+152) / jC > Adrill (3629+152) / jC > FF > [8]2C (4385+152))

### Corner Combos

#### Bdrill

[Bdrill] > 2[C] > 2]B[ > 2A > 2B > 2]C[ > Bbeam > jC (Adrill (2780) / FF > [8]2C (3388))
- standard 💎 route, in the corner. 2C will whiff on Akatsuki, Byakuya, and Chaos.
        
## Combo guide 3 (meterless)

### Enders

#### Adrill
Her classic combo ender. Ends in a knockdown and even lets you set up a gem at frame advantage if you mind your proration. Just like always, she can pick up with 2C after the first gem 💥 for more better damage and stability.

#### 2C
This is another classic ender, but the increase to 2C’s hitbox size means she now has more routes that can end with a 2C knockdown. For example:
- 💥 > 2 gem > 2C dl 5B(1hit) 5 gem > dl 2C gem
You can go into that ender from just about any route.
That said, keep in mind that it’s slightly more difficult on characters whose hurtboxes don’t reach low enough. Also, they can air tech and punish you if your combo prorates too highly.
You can also set two gems instead of one after a 2C ender, or even 2C > jump cancel > air gem set if you haven’t used your jump cancel yet.

#### Satellus Ender
Try to avoid using 5B, 2B, 5C, or your jump normals more than once when going for this ender.

#### j[FF]
With the buffs to C Orb, you can end with j[FF] cancelled into C Orb, mostly in the corner. 2C > Bbeam > 5FF into j[FF] > jCfb would be the way to go. You can also link an FF after Satellus to build more meter, though it’s a bit more difficult to pull off.

You can do an air C Fb right after a Satellus ender, too. Go for the j[FF] ender alone if you want damage, and use either the Satellus > jCfb or Satellus > j[FF] enders if you want to build meter.
Just remember that you’re in trouble if you drop any of them.

#### VO
A combo ender that uses a universal mechanic to strip an opponent’s vorpal. Vatista can fit in a VO at the very end of her combo, so keep her damage untouched and end in VO, Bbeam 💥 > VO, 66B 💥 > VO, or 💥 > Gem set 💥 > VO.

In the corner, you can rack up damage and end in VO while still leaving a gem set for oki.

### Combos

5A 2C 5C > j[B] j[8]2A > 2[C] 2]B[ > 2A 5[A] 2]C[~[C] > 5[B](1)/2[B](1) 5]A[ > ]C[ (Satellus) > ]B[
- Starter: A
- Midscreen
- Practicality: ☆☆☆
- Given the air combo, you should be fine fitting in a B normal, just make sure you don’t use the same one that you’ll use to detonate the second gem. Avoiding same move proration gives you a real knockdown and keeps damage high. Incidentally, if you didn’t use a B normal in your confirm, you can get a side switch by using 2A 5[A] 2]C[~[C] > Dash > 5[B] as your ground combo.

2AA 2C 5C > jA [8]2[A] > 2[C] 2]A[ > 2A 5[A] 2]C[~[C] > 5[B](1)/2[B](1) 5]A[ > ]C[ (Satellus) > ]B[
- Starter: AA
- Midscreen
- Practicality: ☆
- A Satellus ender with two A starters. That said, it’s basically the previous combo with jB switched for jA. jA has a lighter proration than jB, so it’s useful for times like these.

2AAA 2C 5B > j[B] j[8]2A > 2[C] 2]B[~[B] > 2A 5[A] 2]C[~[C] > 2]B[~[B] > 5A ]C[ (Satellus) > ]B[
- Starter: AAA
- Midscreen
- Practicality: 
- A route that uses A three whole times. I completely forgot about this one, so it still hasn’t seen any use in a fight. Since all those 2As will push the opponent away, you’ll need to launch with something other than 5C.

Assault jC > 2C 5C > j[B] j[8]2A > 2[C] 2]B[ > 2[A] 2B 2]C[ > 2C dl 5[B](1) 5]A[ > dl 2C ]B[
- Starter: Assault jC
- Midscreen/Corner
- Practicality: ☆☆☆
- Assault starters prorate pretty heavily, so there’s no need to force a Satellus ender out of them. Keep it simple and do a 2C gem set ender. This route is a good backup for other high proration starters or awkward confirms, so do a 2C ender for those as well.

Assault jB > 5A 2C 5C > jA [8]2[A] > 2[C] 2]A[ > 2[A] 2B 2]C[ > 2C dl 5[B](1) 5]A[ > dl 2C ]B[
- Starter: Assault jB
- Midscreen/Corner
- Practicality: ☆
- Vatista will rarely get a hit starting from her assault jB, but if she does, you’ll want to use jA in your combo instead of jB to avoid same move proration.

A 2C 2B > j[B] jC land jA j[8]2A > 2[C] 2]B[ >2A 5[A] 2]C[ > 2C dl 5[B](1hit) 5]A[ > dl 2C ]B[
- Start: 5A/2A Tip
- Midscreen
- Practicality: ☆☆
- If you follow a hit with the edge of 2A with 2C, there are times when the 2C gets blocked even after your 2A hits. As such, I can’t recommend keeping that starter in your muscle memory, but I admit that I do it fairly often myself. You won’t find many practical starters that prorate more heavily than the one this combo uses, so if you’re ever midscreen and unsure of your route, just pick this one and end with 2C.

A 2C 5C > j[B] j[8]2A > 2[C] 2]B[ > 2[A] 5[B] 2]C[ > 2]A[ > 5[A] ]B[ (Satellus) > ]A[
- Start: 5A/2A
- Corner
- Practicality: ☆☆
- A Satellus corner route from an A starter. The 2 gem > 2A > 5A route whiffs in the corner, so use this instead.

AA 2C 5C > jA [8]2[A] > 2[C] 2]A[ > 2[A] 5[B] 2]C[ > 2]A[ > 5[A] ]B[ (Satellus) > ]A[
- Start: 5AA/2AA
- Corner
- Practicality: ☆
- Just like the midscreen version, you need to switch jB with jA to keep your proration light when you start with two A normals.

AAA 2C dl 5[B] > dl jC > 2[C] 2]B[ > 2[A] 2[B] 2]C[ > 2]A[ > 5[A] ]B[ (Satellus) > ]A[
- Start: 5AAA/2AAA
- Corner
- Practicality: 
- I don’t use this myself, but I may as well put this here while we’re introducing routes. If you find yourself landing this starter, you might want to play it safe and just go for a 2C or FF ender.

2C 5C > j[B] j[8]2A > 2[C] 2]B[ > 2A [6]4[A] > 2]C[~[C] > 5[B](1hit)/2[B](1hit) 5]A[ > ]C[ (Satellus) > ]B[
- Start: 2C
- Midscreen/Corner
- Practicality: ☆☆☆
- Combo from a normal 2C starter. B normals, C normals, and jump normals all have fairly light proration, so you can fit in a laser and a Satellus ender after starting from them.

2C(ch) 5C > j[B] j[8]2A > 2[C] 5]B[ > 2[A] 5B [6]4[B] > dash 2]C[ > 2[C] 2[B](1hit) 2]A[ > dash ]C[ (Satellus) > ]B[
- Start: 2C counter hit
- Midscreen/Corner
- Practicality: ☆☆☆
- A route for when 2C counter hits. Use it for punishing DPs or beating option selects/mashes.

5B 2C 5C > j[B] j[8]2A > 2[C] 2]B[ > 2A [6]4[A] > 2]C[ > 2[C] 5[B](1hit)/2[B](1hit) 2]A[ >]C[ (Satellus) > dash ]B[
- Start: 2B/5B
- Midscreen/Corner
- Practicality: ☆☆☆
- B starters have slightly more proration than 2C, so we add in a 2C pickup after the first gem 💥. If you find yourself using a B normal when confirming off of a 2C counter hit starter, go into this route.

💥 > 2C 5C > j[B]/jA j[8]2A >  2[C] 2]B[ > 2[A] 2[B](1hit)/5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
- Start: 5A 💥
- Midscreen
- Practicality: ☆☆☆
- Use 2B for starters with heavy proration like A normals, and use 5B for starters with lighter proration. You can also switch in jB for jA when you start a combo with jB > 💥 or Bdrill > 💥 to avoid same move proration. For the Satellus after the chain 💥, keep in mind that your opponent will be shot upwards if you’re too slow, so try to hit that as soon as possible.

5A 💥 > 2C 5C > dl j[B] dl jC >  2[C] 2]B[ > 2[A] 2[B](1hit)/5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
- Start: 5A 💥
- Corner
- Practicality: ☆☆
- Your opponent is much closer to you in a corner combo than they would be midscreen, so your midscreen route would cause them to launch away before your Satellus could activate. Use this corner route instead.

💥 > 2C 5C > j[B]/jA j[8]2A > 2C Afb > 2[C] 2]B[ > 2[A] 2[B](1hit)/5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
- Start: jA 💥
- Corner
- Practicality: ☆☆☆
- If you cause an 💥 with any normal with lighter proration than an A normal (including, but not limited to, jA), then use this route. Just like with the midscreen route, you’ll need to swap jB with jA for Bdrill or jB 💥 starters.

5C 💥 > j[AB] > j[8]2A > 2C Afb > 2C 5B > jA j[B] jC > 2[C] 2]B[ > 2[A] 5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
- Start: 5C 💥
- Corner
- Practicality: ☆
- If you immediately use your jump cancel after a raw 5C 💥 hit, you can get a lot of damage from an Adrill done from high in the air. Leave it for guaranteed punishes, though. Keep in mind that if your opponent isn’t between you and the gem, the 💥’s knockback will causes Adrill to whiff.

[8]2B > dl 66C > dash 5A > jA j[B] jC > dash 2[C] 2]B[ > 2A 5[A] 2]C[~[C] > 5[B](1hit) 5]A[ > ]C[ (Satellus) > ]B[
- Start: [8]2B
- Midscreen
- Practicality: ☆
- Vatista can connect 2C after an air combo from Bdrill starters. Basically, you want to dl your jump normals to keep your opponent from rising too high… though that’s much easier said than done. This combo’s difficulty can vary wildly based on your opponent’s character and whiffing the 2C pickup puts you in a very unfavorable position, so if you don’t want to take the risk, stick with the classic double air combo route into 2C.

[8]2[B] > 2[C] 5]B[ > 2[A] 5B [6]4[B] > 2]C[ > 2[C] 2[B](1hit) 2]A[ > ]C[ (Satellus) > ]B[
- Start: [8]2B
- Corner
- Practicality: ☆☆☆
- Nothing special here.

2C Aw > dash 2A > jA jB [8]2[A] > 2[C] dl 5B 2]A[ > 5[A] 2]C[ > 2[C] 2[B](1hit)/5[B](1hit) 2]A[ > ]C[ (Satellus) > ]B[
- Start: Edge of 2C/2B
- Midscreen/Corner
- Practicality: ☆☆☆
- Comboing from 2C > A whiff > Dash > 2A as a starter already costs one of your ground bounces. You should use this route for 2FF or 66C > 2FF starters, too.

2C 5C > j[B] j[8]2A > 2[C] 2]B[~[B] > 2A [6]4[A] > 2 ]C[ > 66[C] 5]A[ > ]B[ (Satellus) > ]C[
- Start: 2C
- Corner (Facing away)
- Practicality: ☆☆
- To get a side switch, use 66C into chain 💥 instead of B normals. If you can remember to 66C and the microdash 5B brought up earlier in your Satellus route, you’ll be fine.

66C 2FF > 2A > jA j[B] jC > 2[C] 2]B[ > 2[A] 2B 2]C[~[C] > 5[B](1hit) 5]A[ > ]C[ (Satellus) > ]B[
- Start: 66C
- Midscreen/Corner
- Practicality: ☆☆
- This combo already comes off of a starter that costs a ground bounce, but if proration gets any dicier than that, just go into a typical💎 combo after 2C.

66C Afb > 2C 5C > j[B] j[8]2A > 2[C] 5]B[ > 2[A] 5B [6]4[B] > dash 2]C[ > 2C dl 2[B](1hit) 2]A[ > dl 2C ]B[
- Start: 66C
- Midscreen
- Practicality: ☆☆
- If you connect A orb after a 66C, you should go into the B laser route into 2C ender to get damage and maintain advantage.

5A 2C 5C > jB j[8]2A > 2C [4]6[A] > 2[C] dl 2BB 5]A[ > 5BB 2]C[ > walk back VO
- Start: A Normal
- Corner
- Practicality:
- A VO ender combo that leaves up a💎. You can go straight for this route from even high proration starters like jC. You just need to walk back for a moment. The💎 set > VO ender is something I only found recently so I haven’t done it in a match yet, but the route itself should be fine.

2C 5C > jB j[8]2A > 2C [4]6[A] > 2[C] dl 2BB 5]A[ > 5B Bbeam > 2]C[ > walk back VO
- Start: 2C
- Corner
- Practicality:
- Try not to leave too much of a dl between 2B > 2BB and 5B > Bbeam. This combo gets a bit less stable once you add in the B laser, so if you want something consistent, stick with the A starter route and use 5BB instead.

B 2C 5C > j[B] j[8]2A > 2C [4]6[A] > 2[C] 5]B[ > 2A 5B Bbeam > 2]C[ > walk back VO
- Start: B Normal
- Corner
- Practicality:
- The 2C starter route for this already uses all available B normals, so if you happen to use a B normal before you enter your air combo, your opponent will tech before your VO can hit. In that case, use either the 5A starter route or this one.

## Partitioning!

- no more than 4 partitions
- partitions separated by no more than 11 frames
- cannot overcharge for more than 10 frames
- after a partitioned move, the first partition is used but the others are still there (thus double beam/fb)

| move       | charge time |
|------------|-------------|
| fb/beam/fk | 53          |
| drill      | 43          |

crystal is 61, but cannot partition it anyway.

examples:
- double beam/fb
- dash fk
- Adrill 2💎 Bdrill

2💎 takes 26 frames, 43-26=17, so very little charge during Adrill.
