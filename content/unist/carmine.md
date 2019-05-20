+++
title = "Carmine"
description = "notes on learning carmine"
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
| The [Mizuumi wiki!](http://wiki.mizuumi.net/w/Under_Night_In-Birth/UNIST/Carmine)                                                                                                                                                                                                                                                                                                        |


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

...
