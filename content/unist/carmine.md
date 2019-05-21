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

| Data from                                                                         |
|-----------------------------------------------------------------------------------|
| The [Mizuumi wiki!](http://wiki.mizuumi.net/w/Under_Night_In-Birth/UNIST/Carmine) |


#### Special moves

| shortname | fullname         | input     | description                           |
|-----------|------------------|-----------|---------------------------------------|
| fb        | Spin!            | 236 A/B/C | A ground ground, B ground air         |
| dp        | Pulverize!       | 623 A/B/C | low                                   |
| tatsu     | Thrust!          | 214 A/B/C | A close, B far                        |
| set       | Thrust!(charged) | 214 [A/B] | button hold and release for a 2nd hit |
| launch    | Launch!          | 22 A/B/C  | plus frames :p                        |
| cgrab     | Give Me That!    | hcb C     | drain life, switch side               |

#### Frame data

| button      | startup    | active | recovery | on block | level | note                                                                                                        |
|-------------|------------|--------|----------|----------|-------|-------------------------------------------------------------------------------------------------------------|
| 5A          | 6          | 2      | 13       | -3       | high  |                                                                                                             |
| 2A          | 7          | 2      | 12       | -3       | high  |                                                                                                             |
| 5B          | 9          | 5      | 16       | -5       | high  |                                                                                                             |
| 5BB         | -          | 7      | 14       | -5       | high  |                                                                                                             |
| 2B          | 7          | 5      | 13       | -2       | low   |                                                                                                             |
| 6B          | 15         | 22     | 24       | -2       | high  |                                                                                                             |
| 3B          | 8          | 3      | 23       | -6       | high  | AAf7-10, launcher, OS with 9C (jc on hit, 5C on block)                                                      |
| 6BB         | -          | 7      | 15       | +3       | high  | on block uses all dissolve and does not brind the opponent closer                                           |
| 5C          | 15         | 3      | 24       | -9       | high  | bad in neutral, can get jumped                                                                              |
| 2C          | 11         | 2      | 29       | -15      | low   | great                                                                                                       |
| 6C          | 13         | 3      | 23       | -8       | high  | meh, useful against merkava (reaches high)                                                                  |
| 6[C]        | 27         | 3      | 28       | -11      | mid   | great, charge bubble at f14, 13f to react                                                                   |
| 3C          | 15         | 5      | 20       | -9       | high  | great, AAf11-16, cancel into Alaunch/B has a gap, can get dp-ed                                             |
| 3[C]        | 20         | 5      | 20       | -7       | high  | great,AAf17-21,  wall bounce, Blaunch or Ctatsu on hit                                                      |
| jA          | 8          | 2      | 2land    | ?        | mid   | assault jA CS jB ~combo                                                                                     |
| jB          | 10         | 3      | 2land    | ?        | mid   | air to air, assault peak jB (whiff) empty 2B                                                                |
| j6B         | 21         | 12     | 10land   | ?        | mid   | AA bait move, key move in assault combos                                                                    |
| j6BB        | -          | 7      | 9land    | ?        | mid   | can convert into combo on hit, but might want to just land and pick up j6B                                  |
| jC          | 12         | 1,1    | 4land    | ?        | high  | air to ground                                                                                               |
| j[C]        | 25         | 1,2    | 4land    | ?        | high  | can setup empty lows, giant hitbox                                                                          |
| 66B         | 10         | 3      | 15       | -4       | high  | blowback on hit, tons of untech against airborne                                                            |
| 66C         | 18         | 4      | 19       | -5       | high  | meh, useful against merkava                                                                                 |
| groundFF    | 15 (12 vo) | 3      | 24       | -5       | high  |                                                                                                             |
| airFF       | 15 (12 vo) | 3      | 19       | +1       | high  |                                                                                                             |
| throw       | 4          | 1      | 22       |          |       | heals, enough time to 214X 6B+C ]X[ pressure                                                                |
| guardcancel | 15         | 5      | 26       | -12      | high  | might have to use at times                                                                                  |
| VO          | 21 to 69   | 2      | 37       | -13      | high  |                                                                                                             |
| fb          | 34         | -      | -        | inf      | high  | blood pools turn into blades that OTG                                                                       |
| Adp         | 18         | 6      | 12       | -4       | low   | AAf15-23, blood pools turn into arc attack (from pool toward carmine)                                       |
| Bdp         | 11         | 6      | 18       | -10      | low   | AAf5-16, use in neutral for blood pool launch combo                                                         |
| Cdp         | 13         | 12     | 19       | -12      | high  | invul (7f, finishes before active)                                                                          |
| Atatsu      | 13         | 2(9)7  | 24       | -2       | high  | (air unblockable), ok frame data on block                                                                   |
| Btatsu      | 14         | 2(13)7 | 27       | -5       | high  | (air unblockable), goes farther than A, less safe                                                           |
| Ctatsu      | 16         | 8      | 36       | +6       | high  | throw invul, if close to the opponent will go the other side                                                |
| Aset        | 31         | 5      | 18       | -1       | high  | disappears on hit, can chase down with B+C but cannot throw                                                 |
| Bset        | 31         | 5      | 17       | -1       | high  | a tad bit further than A, cannot move the pool but can throw, can juggle the charge between B and C buttons |
| set release | 20         | 3      | -        | +28      | high  |                                                                                                             |
| Alaunch     | 18         | 3      | 25       | +1       | low   |                                                                                                             |
| Blaunch     | 18         | 3      | 25       | +1       | low   | a bit further than A                                                                                        |
| Claunch     | 16         | 3      | 24       | +2       | low   | air unblockable                                                                                             |
| cgrab       | 10         | 2      | 36       | -        |       | full invincible, switch side, worse oki than throw                                                          |

## Combos

### Mid Screen

#### 0% Meter

##### Assault Starters

- Assault jC, 5A, 2C, j6B OTG (dissolve), jA, jB, jC, 3B, 2C xx Adp, 66C
- Assault jC, 5A, 5B, 2C, j6B OTG (dissolve), walk back 2C, 5BB (1st B whiffs) xx Adp, 66C 
- Assault j6B, 5B, 2C xx Afb OTG, dash j[C], delayed j6B (dissolve) OTG, dash 2C xx Adp, 66C

can use Afb OTG combos on counterhit or grd break.

##### 5A or 5B Starters

- 5A, 5B, 2C, 6B, 2C xx Afb OTG, dash j[C], 66C
- 5B, 2C, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C 

##### 5B Starters (max range)

- 5B, 2C, 6B, 2C, 5BB xx Bdp, dash 2B, jA, jB, jC, 3B, 2C
- 5B, 2C, 6B, 2C, 5BB, 3B, jB, jC, 2C 

5BB first B whiffs

##### 3B Starters

- 3B, jC, jA, jB, 5B, 2C, 6B, 2C, 5BB xx Adp, 66C
- 3B, jC, jA, jB, 2C, 6B, 2C xx Afb, dash j[C], dash 2B OTG, 2C
- 3B, jC, slight dl jB, 2C, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, 2C 


This is a good confirm combo if you catch the opponent during their pre-jump frames. The third combo is an anti-air confirm combo. All of these combos are easy to confirm into if you utilize the 9C option select mentioned under 3B. Some character require you to put a slight dl between the 2B OTG, and 2C.

##### 2A Starters

- 2A x2, 5B, 2C, j6B OTG, jC, jB, jA, 3B, 2C xx Adp, 66C

##### 2B Starters

- 2B, 2C, 6B, 3B xx Bdp, walk back j6B OTG, 66C xx Afb, dl j[C] (, Cfb)

##### 2C Starters

- 2C, 5BB, jC, jB, 2C, 3C xx Blaunch
- 2C, 5BB, jC, jA, jB, 2C
- 2C, 5B(whiff)B, 3B, jC, jA, jB, 2C

##### 6[C] Overhead Starters (no dissolve)

- 6[C] xx Adp, 5B, jC, slight dl jB, 2C

##### Afb/B Starters

- Afb/B, 2C xx Afb OTG, dash j[C], dl j6B OTG, dash 2C xx Adp, dash 2B, jB, jA, jC, 3B, 2C

##### Adp Starters

- Adp, 5B(delay)B, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C

#### 0% Meter Side Switch

##### 5A or 5B Starters

- 5A, 5B, 2C, 6B, 2C xx Afb OTG, dash side switch, jA, jB, jC, 3B xx Adp, j[C] (late xx jA/Bfb for meaty)
- 5A, 5B, 2C, 6B, 2C xx Afb OTG, dash side switch, jA, jB, jC, 3B, 2C xx Adp, Aset, 3B, ]A[, j[C], 66C

#### 0% Meter (Dissolve)

##### Assault Starters

- Assault jC, 5A, 2C xx Afb OTG, dash j[C], dash 2B OTG, slight dl 2C

##### 5B Starters

- 5B, 2C xx Afb OTG, dash j[C], dl j6B OTG, dash 2C xx Adp, dash 2B, jA, jB, jC, 3B, 2C 

##### 3C Starters

- 3C xx Adp, dash 2C, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C

##### 6[C] Overhead Starters

- 6[C] xx Adp, delayed 6B, 2C xx Afb, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C

##### Afb/B Starters

- Afb/B, dash jC, dl jB, 2C, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, slight dl 2C
- Afb/B, j[C], dash 2B OTG, jA, jB, jC, 3B, 2C

The dissolve will knock the opponent down but the 236X picks them up before they completely fall. This is the standard confirm combos if 236X hits either meaty or during the neutral game. During the first combo, aim to land the jC at the peak of 236X. If you hit 2C too high and you chain into 6B the opponent will be too high for the second 2C to hit. You can compensate by delaying the 6B slightly. The first combo is if you're close enough to get the dash in. The second combo is if you're too far or are already in the air when 236X hits since j[C] extends the hit box.

##### Adp/B Starters

- Adp/B, dash 2C, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C
- Adp/B, dash 2C, 5BB, 3B, jA, jB, jC, 3B, 2C

when pool below or under the opponent

##### 214[X] Starters

- 6B+C, ]X[, dash 2C, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C
- 5A (]X[) xx Afb, j[C], dash 2B OTG, 2C, nj6B OTG, jC, jB, jA, 3B, 2C xx Adp, 66C
- 6[C], 6B+C, ]X[, j[C], dash 2B OTG, jB, jA, jC, 3B, 2C

combos with A/Bset in place.

#### 0% Meter Side Switch (Dissolve)

##### 5A or 5B Starters

- 5A/B, 2C xx Afb OTG, dash side switch, j[C], dash 2B OTG, 2C xx Adp, 66C

##### 3C Starters

- 3C xx Adp, dash 2C, 6B, 2C xx Afb OTG, dash side switch, jA, jB, jC, 2C

### 100% Meter

##### 5B Starters

- 5B, 5C, 2C, 3C xx Claunch~

##### 6B Starters

- 6B, 6B+C xx Claunch~ 

##### 2C Starters

- 2C, 5BB, jC, slight dl jB, 2C xx Atatsu/B xx Cfb, dash j[C], dash 2B OTG, 2C
- 2C, 5BB, jB, jC, 2C, 3C xx Blaunch xx Claunch～

##### 6[C] Overhead Starters

- 6[C] xx Atatsu xx Cfb, dash j[C], dash 2B OTG, 2C, nj6B OTG, jC, jB, jA, 3B, 2C xx Adp, 66C

great combo, 66C will whiff in the corner

##### Ctatsu Starters

- Ctatsu, 5B, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C

##### Claunch starter

- 66C xx A/Btatsu, Aset - ends in Aset oki options
- 66C xx A/Btatsu, A/Bdp - gives enough time for 236X or tk j236X oki options
- 66C xx Aset, Bset - gives double Xset oki options. Use Bset~[C] trick to get 236X oki as well. 

#### 100% Meter Side Switch

##### cgrab Starters

- cgrab, CS, Afb OTG, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C (require dissolve)
- cgrab, CS, Afb OTG, dash side switch, j[C], dash 2B OTG, slight dl 2C xx Adp, walk back 66C (require dissolve)
- cgrab, CS, j6B OTG, 2C xx Afb OTG, dash jC, jB, 5B, jA, jB, jC, 2C

setup for dissolve:
- 5A, A/Bfb, cgrab 

##### 2C Starters

- 2C, 5BB, jC, slight dl jB, 2C xx A/Btatsu xx Cfb, dash side switch, j[C], dash 2B OTG, 2C xx Adp, 66C

Remember, if you're too close to the corner the 66C ender will whiff.

#### 200% Combos

##### Assault Starters

- Assault jC, 5A, 2C, nj6B OTG, jCBA, 3B, 2C, Adp, 2C xx Cfb, CS, Veil Off, 41236D

nj6B is required so that VO does not hit during Cfb (or else IW does not connect)

##### 5B Starters

- 5B, 2C, nj6B OTG, 2C xx Afb OTG, CS, Veil Off, Ctatsu, Adp, dash 5B, jA, jB, jC, 3B, 6C xx 41236D
- 5B, 2C, 6B, 2C xx Afb OTG, dl 66C xx Cfb OTG, CS, Veil Off, Ctatsu, A/Bdp xx 41236D 
- 5B, 2C xx Afb OTG, dash j[C], Cfb OTG, CS, Veil Off, Ctatsu, A/Bdp xx 41236D (require dissolve)

### Corner

#### 0% Meter

##### Assault Starters

- Assault jC, 5A, 2C, 3C xx Alaunch, 3B xx Adp, j6B, 66C xx Afb OTG, dl jump back j[C], 66C
- Assault j6B, 5B, 2C xx Afb OTG, walk back 66C xx Afb OTG, walk back dl nj[C], jB, 2C xx Adp, 66C 

Practical corner combos off of assault starters but have tricky juggle timings throughout. The j6B in the first combo needs to be delayed so that it hits low to the ground otherwise the opponent will tech before 66C can hit. Time the j[C] during the descent of Carmine's jump so that he lands first allowing the 66C to hit. The jump back j[C] sets up the appropriate spacing for 66C to hit. During the second combo, you need to walk back after Afb OTG so that you give enough time for Afb to complete, as well as spacing yourself appropriately for 66C to hit. During the second Afb, you want to time your neutral jump [C] just when Afb ends so the j[C] hits at the peak of the opponents height. You'll also want to start charging the C during Carmine's jump animation so that it hits at the peak of his jump. Hitting at the peak is important otherwise the jB or 2C whiffs.

##### 5B Starters

- 5B, 2C, 6B, 2C xx Afb OTG, dl jump back j[C] xx jAfb, 66C
- 5B, 2C, 6B, 2C xx Afb OTG, dl 66C xx Afb OTG, walk back nj[C], jB, 2C xx Adp, 66C
- 5B, 2C, 6B, 2C xx Afb OTG, dl 66C xx Xset, 5B, ]X[, nj[C], jB, 2C
- 5B, 2C, 3C xx Alaunch, 5BB xx Adp, walk back j6B, 66C xx Afb OTG, dl jump back j[C] xx jAfb OTG, 66C

The first combo is the easier base for Carmine's corner combos but doesn't give optimal damage output. You can walk forward then jump back j[C] as a timing trick so that Afb ends in time for jAfb cancel to work. It also perfectly spaces you for the 66C to hit because if you're too close to the corner 66C will whiff. In the second combo, you can charge D as a timing trick for the Afb to finish when 66C hits. You'll also steal some GRD from the opponent. During the second Afb you need to walk back so that the 66C hits at the end. Again, you can do a slight D charge for timing and GRD. Aim the nj[C] at the peak of the opponents and Carmine's height. In the third combo, you want to jump cancel immediately after 5B hits and charge the C during the jump animation so that it hits at the peak of Carmine's jump.

##### 2C Starters

- 2C, 5BB, jB, jA, jC, 2C xx Alaunch/B, 3B xx Adp, walk back j6B, 66C xx Afb OTG, dl jump back j[C], 66C
- 2C, 5B, 3C xx Alaunch/B, 5B(delay)B xx Adp, walk back j6B, 66C xx Afb OTG, dl jump back j[C] xx jAfb, 66C

##### 3C Starters

- 3C xx Alaunch/B, 5BB xx Adp, walk back j6B, 66C xx Afb OTG, dl jump back j[C] xx jAfb OTG, 66C 
- 3C xx Alaunch/B, 2C, 6B, 2C xx Afb OTG, walk back 66C xx Xset, 5B, ]X[, nj[C], jB, 2C

##### 3B Starters

- 3B, jC, jA, jB, 5B, 2C xx Alaunch, 5B xx Adp, walk back j6B, 66C xx Afb OTG, jump back j[C], 66C OTG

##### 6[C] Overhead Starters

- 6[C], Alaunch/B, 5BB xx Adp, walk back j6B, 66C xx Afb OTG, dl jump back j[C] xx jAfb OTG, 66C

Corner overhead combo utilizing the timing tricks in the previous listed corner combos. The Alaunch/B after the overhead also leaves you positive frames if the opponent manages to block the overhead.

##### 236X Starters

- 236X, 3C xx Adp, dl 6B, 2C xx Afb OTG, walk back 66 xx Aset, 5B, ]A[, nj[C], jB, 3B, 2C

Your timing the 3C to hit just as 236X ends so that 236X leaves a dissolve for Adp to launch the opponent.
0% Meter (Dissolve)

##### 5A/B Starters

- 5A, 5B, 2C xx Afb OTG, dl 66C xx Afb OTG, walk back dl nj[C], jB, 2C xx Adp, 66C

##### 2C Starters

- 2C xx Alaunch, 5BB xx Adp, dl j6B, 66C xx Afb OTG, dl jump back j[C] xx jAfb OTG, 66C 
- 2C xx Adp, dash 2C, 6B, 2C xx Afb OTG, walk back 66C xx Aset, 5B, ]A[, nj[C], jB, 2C 

##### 6[C] Overhead Starters

- 6[C] xx Adp, dl 6B, 2C xx Afb OTG, walk back 66C xx Aset, ]A[, 3B, nj[C], jB, 3B, 2C

##### 236X Starters

- 236X, dash jC, jB, 2C xx Alaunch, 5B, 5C xx Adp, walk back j6B, 66C xx Afb OTG, dl jump back j[C] xx jAfb OTG, 66C

##### Xset Starters

- 5A xx Afb, ]X[, j[C], dash 2B OTG xx Alaunch/B, 3B xx Adp, walk back j6B, 66C xx Afb OTG, walk back nj[C]
- 5A xx Afb, ]X[, j[C], j6B OTG, Alaunch, 3B xx Adp, walk back j6B, 66C xx Afb OTG, j[C]
- 2B, 5C, 2C, 3C xx Alaunch/B, ]X[, 66C xx Afb OTG, dl jump back j[C], Adp OTG, 66C##### 
- 6[C], 6B+C, ]X[, j[C], 2B OTG xx Alaunch, 3B xx Adp, walk back j6B, 66C xx Afb OTG, j[C]
- 6[C] xx Afb OTG, ]X[, dl nj[C], 66C OTG xx Afb, walk back dl nj[C], jB, 2C xx Adp, 66C
- ]X[, 3C xx Alaunch, 2C xx Adp, dl 6B, 2C xx Afb OTG, walk back 66C xx Afb OTG, walk back nj[C], jB, 3B, 2C
- ]X[, 5A, 6C, jC, jB, 2C xx Alaunch, 5B, 5C xx Adp, walk back j6B, 66C xx Afb OTG, dl jump back j[C] xx jAfb OTG, 66C 
- ]X[, 2C, 6B, 2C xx Afb OTG, walk back 66C xx Afb OTG, walk back nj[C], jB, 2C xx Adp, 66C

### 100% Meter

##### Assault Starters

- Assault jC, 5A, 2C, 3C xx Alaunch/B xx Ctatsu, 66C xx Afb OTG, dl jump back j[C], Adp OTG, 66C

##### 6[C] Overhead Starters

- 6[C] xx Atatsu (1) xx Cfb, nj[C], Aset OTG, 5B, ]A[, nj[C], jB, 2C xx Adp, 66C

Time the the first nj[C] during the descent of Carmine's jump. This allows you to land first and get the OTG from Aset. The second nj[C] should have the C charged during Carmine's ascent so that it hits at the peak of his jump.

##### 236X Starters

- 236X (N), Aset, 5B, 6B, 2C, 3C xx Blaunch, ]A[, 66C xx Afb OTG, dl jump back j[C], Bdp OTG, 2C xx Alaunch/B, CS, 623C

236X needs to hit grounded

### 200% Meter

##### Assault Starters

- Assault jC, 5A, 2C, 3C xx Alaunch, 3B xx Adp, j6B, 66C xx Afb OTG, dl jump back jdl[C], Cfb OTG, CS, Veil Off, 41236D

##### 5B Starters

- 5B, 2C, 3C xx Alaunch, 5B, 2C xx Afb OTG, Veil Off, Ctatsu, Adp, 2C xx Cfb, Aset xx 41236D, ]A[
- 5B, 2C, 6B, 2C xx Afb OTG, dash j[C], dash 2B OTG, jA, jB, jC, 3B, 2C xx Claunch, Veil Off, Cfb xx 623C
- 5B, 2C, 3C xx Alaunch, 5B, 5C xx Adp, walk back jdl6B, 66C xx Afb OTG, bj[C], Cfb OTG, CS, Veil Off, 2C xx Cfb, Atatsu xx 41236D  

##### Adp Starters

- Adp, 2C, 6B, 2C xx Afb OTG, walk back njdl[C], Afb OTG, Veil Off, Ctatsu, 3B, 6C xx 41236D (requires dissolve)

### 100-200% Meter Side Switch

##### Ctatsu Starters

- Ctatsu, 5B, 6B, 2C xx Afb OTG, walk back 66C xx Afb OTG, walk back nj[C], jB, 2C xx Adp, 66C

##### cgrab Starters

- cgrab, CS, Alaunch OTG, 3B, 5C, jB, jC, 2C xx Afb OTG, Veil Off, Ctatsu, Adp, 2C, 3C, 6C xx 41236D
