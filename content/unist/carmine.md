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
| 3C          | 15         | 5      | 20       | -9       | high  | great, AAf11-16, cancel into 22A/B has a gap, can get dp-ed                                                 |
| 3[C]        | 20         | 5      | 20       | -7       | high  | great,AAf17-21,  wall bounce, 22B or 214C on hit                                                            |
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

Mid Screen
0% Meter

    Assault Starters

   Assault j.C, 5A, 2C, j.6B OTG (dissolve), j.A, j.B, j.C, 3B, 2C xx 623A, 66C
   Assault j.C, 5A, 5B, 2C, j.6B OTG (dissolve), walk back 2C, 5BB (1st B whiffs) xx 623A, 66C 
   Assault j.6B, 5B, 2C xx 236A OTG, dash j.[C], delayed j.6B (dissolve) OTG, dash 2C xx 623A, 66C

Assault starters do not grant enough hit stun to go into 236A OTG extensions unless you land a counter hit or GRD break. If you hit the assault j.C deep enough you can do 5B instead of 5A for additional damage.

    5A or 5B Starters

   5A, 5B, 2C, 6B, 2C xx 236A OTG, dash j.[C], 66C
   5B, 2C, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C 

This is the standard combo route for Carmine after a confirm from a 5A or 5B poke.

    5B Starters (max range)

   5B, 2C, 6B, 2C, 5BB xx 623B, dash 2B, j.A, j.B, j.C, 3B, 2C
   5B, 2C, 6B, 2C, 5BB, 3B, j.B, j.C, 2C 

This is the combo route to use when 5B hits at max range. The typical 236A extension will only hit the opponent once, which won't allow enough time for the j.[C] to connect. The combo utilizes 5BB to get back into range to complete the combo. Please note that during the 5BB portion the first B whiffs.

    3B Starters

   3B, j.C, j.A, j.B, 5B, 2C, 6B, 2C, 5BB xx 623A, 66C
   3B, j.C, j.A, j.B, 2C, 6B, 2C xx 236A, dash j.[C], dash 2B OTG, 2C
   3B, j.C, slight delay j.B, 2C, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, 2C 
  

This is a good confirm combo if you catch the opponent during their pre-jump frames. The third combo is an anti-air confirm combo. All of these combos are easy to confirm into if you utilize the 9C option select mentioned under 3B. Some character require you to put a slight delay between the 2B OTG, and 2C.

    2A Starters

   2A x2, 5B, 2C, j.6B OTG, j.C, j.B, j.A, 3B, 2C xx 623A, 66C

    2B Starters

   2B, 2C, 6B, 3B xx 623B, walk back j.6B OTG, 66C xx 236A, delay j.[C]

Standard low confirm combo from pressure or oki. Meter can be spent on 236C to convert further off of j.[C]

    2C Starters

   2C, 5BB, j.C, j.B, 2C, 3C xx 22B
   2C, 5BB, j.C, j.A, j.B, 2C
   2C, 5B(whiff)B, 3B, j.C, j.A, j.B, 2C

Standard low confirm from a 2C poke. The 5B gives enough time to confirm into 5BB or go into a block string after 2C.

    6[C] Overhead Starters

   6[C] xx 623A, 5B, j.C, slight delay j.B, 2C

Overhead combo without dissolve or meter for extensions and still provides oki options after 2C.

    236A/B Starters

   236A/B, 2C xx 236A OTG, dash j.[C], delay j.6B OTG, dash 2C xx 623A, dash 2B, j.B, j.A, j.C, 3B, 2C      

Confirm combo off of neutral or meaty 236A/B. Delay the j.6B as long as possible so you have enough time for the dash 2C to connect.

    623A Starters

   623A, 5B(delay)B, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C

0% Meter Side Switch

    5A or 5B Starters

   5A, 5B, 2C, 6B, 2C xx 236A OTG, dash side switch, j.A, j.B, j.C, 3B xx 623A, j.[C]
   5A, 5B, 2C, 6B, 2C xx 236A OTG, dash side switch, j.A, j.B, j.C, 3B, 2C xx 623A, 214[A], 3B, ]A[, j.[C], 66C

Side switch combos off of common confirms. During the 236A, you dash under the opponent to switch sides. After the last j.[C] in combo one you can late cancel into j.236A/B for a meaty pinwheel setup.
0% Meter (Dissolve)

    Assault Starters

   Assault j.C, 5A, 2C xx 236A OTG, dash j.[C], dash 2B OTG, slight delay 2C

    5B Starters

   5B, 2C xx 236A OTG, dash j.[C], delay j.6B OTG, dash 2C xx 623A, dash 2B, j.A, j.B, j.C, 3B, 2C 

    3C Starters

   3C xx 623A, dash 2C, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C

    6[C] Overhead Starters

   6[C] xx 623A, delayed 6B, 2C xx 236A, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C

Standard meterless overhead combo with a dissolve on screen but doesn't leave you at frame advantage if the 6[C] is blocked. The 6B after 623A needs to hit low to the ground so that 2C hits.

    236A/B Starters

   236A/B, dash j.C, delay j.B, 2C, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, slight delay 2C
   236A/B, j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C

The dissolve will knock the opponent down but the 236X picks them up before they completely fall. This is the standard confirm combos if 236X hits either meaty or during the neutral game. During the first combo, aim to land the j.C at the peak of 236X. If you hit 2C too high and you chain into 6B the opponent will be too high for the second 2C to hit. You can compensate by delaying the 6B slightly. The first combo is if you're close enough to get the dash in. The second combo is if you're too far or are already in the air when 236X hits since j.[C] extends the hit box.

    623A/B Starters

   623A/B, dash 2C, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C
   623A/B, dash 2C, 5BB, 3B, j.A, j.B, j.C, 3B, 2C

These are mid-to-full screen confirm combos if the dissolve is set below or behind the opponent. The first combo is if you're close to the opponent while the second combo is if you're full screen away.

    214[X] Starters

   6B+C, ]X[, dash 2C, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C
   5A (]X[) xx 236A, j.[C], dash 2B OTG, 2C, nj.6B OTG, j.C, j.B, j.A, 3B, 2C xx 623A, 66C
   6[C], 6B+C, ]X[, j.[C], dash 2B OTG, j.B, j.A, j.C, 3B, 2C

These are all combos with a 214[A/B] in place.
0% Meter Side Switch (Dissolve)

    5A or 5B Starters

   5A/B, 2C xx 236A OTG, dash side switch, j.[C], dash 2B OTG, 2C xx 623A, 66C

    3C Starters

   3C xx 623A, dash 2C, 6B, 2C xx 236A OTG, dash side switch, j.A, j.B, j.C, 2C

100% Meter

    5B Starters

   5B, 5C, 2C, 3C xx 22C~

    6B Starters

   6B, 6B+C xx 22C~ 

    2C Starters

   2C, 5BB, j.C, slight delay j.B, 2C xx 214A/B xx 236C, dash j.[C], dash 2B OTG, 2C
   2C, 5BB, j.B, j.C, 2C, 3C xx 22B xx 22C～

    6[C] Overhead Starters

   6[C] xx 214A xx 236C, dash j.[C], dash 2B OTG, 2C, nj.6B OTG, j.C, j.B, j.A, 3B, 2C xx 623A, 66C

Really good damage off of the overhead and a good corner carry combo. Definitely a combo that all Carmine players need to learn. Keep in mind if you're too close to the corner the 66C will whiff.

    214C Starters

   214C, 5B, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C

Confirm combo off of what most likely will be a reversal 214C.

22C can be followed up with anything but the most common options are:

   66C xx 214A/B, 214[A] - ends in 214[A] oki options
   66C xx 214A/B, 623A/B - gives enough time for 236X or tk j.236X oki options
   66C xx 214[A], 214[B] - gives double 214[X] oki options. Use 214[B]~[C] trick to get 236X oki as well. 

100% Meter Side Switch

    63214C Starters

   63214C, CS, 236A OTG, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C
   63214C, CS, 236A OTG, dash side switch, j.[C], dash 2B OTG, slight delay 2C xx 623A, walk back 66C
   63214C, CS, j.6B OTG, 2C xx 236A OTG, dash j.C, j.B, 5B, j.A, j.B, j.C, 2C

First two combos requires a dissolve on screen and the usually set up for that is 5A xx 236A/B xx 63214C. By the time the 63214C finishes, 236A/B will have left a dissolve for the rest of the combo to work. The second combo is a double side switch and is useful if the 63214C threw them out of the corner and you want to combo them back into the corner. The third combo is if no dissolve is on screen so this is the combo route off of 63214C reversal or off of a tick throw setup.

    2C Starters

   2C, 5BB, j.C, slight delay j.B, 2C xx 214A/B xx 236C, dash side switch, j.[C], dash 2B OTG, 2C xx 623A, 66C

Remember, if you're too close to the corner the 66C ender will whiff.
200% Combos

    Assault Starters

   Assault j.C, 5A, 2C, nj.6B OTG, j.C, j.B, j.A, 3B, 2C, 623A, 2C xx 236C, CS, Veil Off, 41236D

The neutral jump 6B is important because it sets up the spacing so that the Veil Off does not hit the opponent during 236C. If you do a jump forward 6B the opponent gets hit by the Veil Off during 236C and you lose the ability to combo into his Infinite Words.

    5B Starters

   5B, 2C, nj.6B OTG, 2C xx 236A OTG, CS, Veil Off, 214C, 623A, dash 5B, j.A, j.B, j.C, 3B, 6C xx 41236D
   5B, 2C, 6B, 2C xx 236A OTG, 66C xx 236C OTG, CS, Veil Off, 214C, 623A/B xx 41236D 
   5B, 2C xx 236A OTG, dash j.[C], 236C OTG, CS, Veil Off, 214C, 623A/B xx 41236D 

In the second combo you need to delay the 66C just as 236A finishes so you're able to cancel into 236C. The third combo requires a dissolve on screen before hand.
Corner
0% Meter

    Assault Starters

   Assault j.C, 5A, 2C, 3C xx 22A, 3B xx 623A, j.6B, 66C xx 236A OTG, delay jump back j.[C], 66C
   Assault j.6B, 5B, 2C xx 236A OTG, walk back 66C xx 236A OTG, walk back delay nj.[C], j.B, 2C xx 623A, 66C 

Practical corner combos off of assault starters but have tricky juggle timings throughout. The j.6B in the first combo needs to be delayed so that it hits low to the ground otherwise the opponent will tech before 66C can hit. Time the j.[C] during the descent of Carmine's jump so that he lands first allowing the 66C to hit. The jump back j.[C] sets up the appropriate spacing for 66C to hit. During the second combo, you need to walk back after 236A OTG so that you give enough time for 236A to complete, as well as spacing yourself appropriately for 66C to hit. During the second 236A, you want to time your neutral jump [C] just when 236A ends so the j.[C] hits at the peak of the opponents height. You'll also want to start charging the C during Carmine's jump animation so that it hits at the peak of his jump. Hitting at the peak is important otherwise the j.B or 2C whiffs.

    5B Starters

   5B, 2C, 6B, 2C xx 236A OTG, delay jump back j.[C] xx j.236A, 66C
   5B, 2C, 6B, 2C xx 236A OTG, delay 66C xx 236A OTG, walk back nj.[C], j.B, 2C xx 623A, 66C
   5B, 2C, 6B, 2C xx 236A OTG, delay 66C xx 214[X], 5B, ]X[, nj.[C], j.B, 2C
   5B, 2C, 3C xx 22A, 5BB xx 623A, walk back j.6B, 66C xx 236A OTG, delay jump back j.[C] xx j.236A OTG, 66C

The first combo is the easier base for Carmine's corner combos but doesn't give optimal damage output. You can walk forward then jump back j.[C] as a timing trick so that 236A ends in time for j.236A cancel to work. It also perfectly spaces you for the 66C to hit because if you're too close to the corner 66C will whiff. In the second combo, you can charge D as a timing trick for the 236A to finish when 66C hits. You'll also steal some GRD from the opponent. During the second 236A you need to walk back so that the 66C hits at the end. Again, you can do a slight D charge for timing and GRD. Aim the nj.[C] at the peak of the opponents and Carmine's height. In the third combo, you want to jump cancel immediately after 5B hits and charge the C during the jump animation so that it hits at the peak of Carmine's jump.

    2C Starters

   2C, 5BB, j.B, j.A, j.C, 2C xx 22A/B, 3B xx 623A, walk back j.6B, 66C xx 236A OTG, delay jump back j.[C], 66C
   2C, 5B, 3C xx 22A/B, 5B(delay)B xx 623A, walk back j.6B, 66C xx 236A OTG, delay jump back j.[C] xx j.236A, 66C

    3C Starters

   3C xx 22A/B, 5BB xx 623A, walk back j.6B, 66C xx 236A OTG, delay jump back j.[C] xx j.236A OTG, 66C 
   3C xx 22A/B, 2C, 6B, 2C xx 236A OTG, walk back 66C xx 214[X], 5B, ]X[, nj.[C], j.B, 2C

    3B Starters

   3B, j.C, j.A, j.B, 5B, 2C xx 22A, 5B xx 623A, walk back j.6B, 66C xx 236A OTG, jump back j.[C], 66C OTG

    6[C] Overhead Starters

   6[C], 22A/B, 5BB xx 623A, walk back j.6B, 66C xx 236A OTG, delay jump back j.[C] xx j.236A OTG, 66C

Corner overhead combo utilizing the timing tricks in the previous listed corner combos. The 22A/B after the overhead also leaves you positive frames if the opponent manages to block the overhead.

    236X Starters

   236X, 3C xx 623A, delay 6B, 2C xx 236A OTG, walk back 66 xx 214[A], 5B, ]A[, nj.[C], j.B, 3B, 2C

Your timing the 3C to hit just as 236X ends so that 236X leaves a dissolve for 623A to launch the opponent.
0% Meter (Dissolve)

    5A/B Starters

   5A, 5B, 2C xx 236A OTG, delay 66C xx 236A OTG, walk back delay nj.[C], j.B, 2C xx 623A, 66C

    2C Starters

   2C xx 22A, 5BB xx 623A, delay j.6B, 66C xx 236A OTG, delay jump back j.[C] xx j.236A OTG, 66C 
   2C xx 623A, dash 2C, 6B, 2C xx 236A OTG, walk back 66C xx 214[A], 5B, ]A[, nj.[C], j.B, 2C 

    6[C] Overhead Starters

   6[C] xx 623A, delay 6B, 2C xx 236A OTG, walk back 66C xx 214[A], ]A[, 3B, nj.[C], j.B, 3B, 2C

    236X Starters

   236X, dash j.C, j.B, 2C xx 22A, 5B, 5C xx 623A, walk back j.6B, 66C xx 236A OTG, delay jump back j.[C] xx j.236A OTG, 66C

    214[X] Starters

   5A xx 236A, ]X[, j.[C], dash 2B OTG xx 22A/B, 3B xx 623A, walk back j.6B, 66C xx 236A OTG, walk back nj.[C]
   5A xx 236A, ]X[, j.[C], j.6B OTG, 22A, 3B xx 623A, walk back j.6B, 66C xx 236A OTG, j.[C]
   2B, 5C, 2C, 3C xx 22A/B, ]X[, 66C xx 236A OTG, delay jump back j.[C], 623A OTG, 66C    
   6[C], 6B+C, ]X[, j.[C], 2B OTG xx 22A, 3B xx 623A, walk back j.6B, 66C xx 236A OTG, j.[C]
   6[C] xx 236A OTG, ]X[, delay nj.[C], 66C OTG xx 236A, walk back delay nj.[C], j.B, 2C xx 623A, 66C
   ]X[, 3C xx 22A, 2C xx 623A, delay 6B, 2C xx 236A OTG, walk back 66C xx 236A OTG, walk back nj.[C], j.B, 3B, 2C
   ]X[, 5A, 6C, j.C, j.B, 2C xx 22A, 5B, 5C xx 623A, walk back j.6B, 66C xx 236A OTG, delay jump back j.[C] xx j.236A OTG, 66C 
   ]X[, 2C, 6B, 2C xx 236A OTG, walk back 66C xx 236A OTG, walk back nj.[C], j.B, 2C xx 623A, 66C

The above combos require a 214[X] dissolve to be placed on screen first.
100% Meter

    Assault Starters

   Assault j.C, 5A, 2C, 3C xx 22A/B xx 214C, 66C xx 236A OTG, delay jump back j.[C], 623A OTG, 66C

    6[C] Overhead Starters

   6[C] xx 214A (1) xx 236C, nj.[C], 214[A] OTG, 5B, ]A[, nj.[C], j.B, 2C xx 623A, 66C

Time the the first nj.[C] during the descent of Carmine's jump. This allows you to land first and get the OTG from 214[A]. The second nj.[C] should have the C charged during Carmine's ascent so that it hits at the peak of his jump.

    236X Starters

   236X (N), 214[A], 5B, 6B, 2C, 3C xx 22B, ]A[, 66C xx 236A OTG, delay jump back j.[C], 623B OTG, 2C xx 22A/B, CS, 623C

236X needs to hit them grounded. If it picks them up off the ground this combo won't work.
200% Meter

    Assault Starters

   Assault j.C, 5A, 2C, 3C xx 22A, 3B xx 623A, j.6B, 66C xx 236A OTG, delay jump back j.[C], 236C OTG, CS, Veil Off, 41236D

During the jump back j.[C] part, charge the C towards the peak of Carmine's jump so that the j.[C] comes out during the descent. Carmine will land first before the opponent so that 236C will OTG.

    5B Starters

   5B, 2C, 3C xx 22A, 5B, 2C xx 236A OTG, Veil Off, 214C, 623A, 2C xx 236C, 214[A] xx 41236D, ]A[
   5B, 2C, 6B, 2C xx 236A OTG, dash j.[C], dash 2B OTG, j.A, j.B, j.C, 3B, 2C xx 22C, Veil Off, 236C xx 623C
   5B, 2C, 3C xx 22A, 5B, 5C xx 623A, j.6B, 66C xx 236A OTG, j.[C], 236C OTG, CS, Veil Off, 2C xx 236C, 214A xx 41236D  

In the third combo you need to walk back and delay the j.6B. The last j.[C] requires you to jump back and so the Veil Off whiffs.

    623A Starters

   623A, 2C, 6B, 2C xx 236A OTG, walk back nj.[C], 236A OTG, Veil Off, 214C, 3B, 6C xx 41236D 

Requires a dissolve on screen for the 623A to launch. The walk back nj.[C] is required to cause the Veil Off to whiff. Time the C charge during nj.[C] during the descent of Carmine's jump.
100-200% Meter Side Switch

    214C Starters

   214C, 5B, 6B, 2C xx 236A OTG, walk back 66C xx 236A OTG, walk back nj.[C], j.B, 2C xx 623A, 66C

    63214C Starters

   63214C, CS, 22A OTG, 3B, 5C, j.B, j.C, 2C xx 236A OTG, Veil Off, 214C, 623A, 2C, 3C, 6C xx 41236D
