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

- [SYSTEM](#system)
- [FRAME DATA](#frame-data)
- [COMBOS](#combos)

| Data from                                                                                                                                                                                                                                                                                                                                                                                |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Koishi](https://twitter.com/crazy_lemonmilk) Vatista [combo guide](https://www.evernote.com/shard/s319/client/snv?noteGuid=66eb1d7d-7b1c-4c46-9462-4f8f1a5fb960&noteKey=c6b0f1e181b407f9111d70de7665480e&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs319%2Fsh%2F66eb1d7d-7b1c-4c46-9462-4f8f1a5fb960%2Fc6b0f1e181b407f9111d70de7665480e&title=UNIST%2Bv3.20%2BVatista%2BCombo%2BGuide) |
| Dainiru [combo guide](https://docs.google.com/document/d/10S5xFq9PDQRTqYtVxs0P6tv2URhHsnl_bwed_l73Xx4/edit)                                                                                                                                                                                                                                                                              |
| [Boruphen's charge partitioning guide](https://www.evernote.com/shard/s628/client/snv?noteGuid=ae0b78c4-cd9d-4917-a005-adc76820c93c&noteKey=28ded817c39ffe5b626230061e9668c2&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs628%2Fsh%2Fae0b78c4-cd9d-4917-a005-adc76820c93c%2F28ded817c39ffe5b626230061e9668c2&title=Boruphen%2527s%2BGuide%2Bto%2BCharge%2BPartitioning%2Bin%2BUNIST)     |
| The [Mizuumi wiki!](http://wiki.mizuumi.net/w/Under_Night_In-Birth/UNIST/Vatista)                                                                                                                                                                                                                                                                                                        |
| The [dustloop uniel system post](http://www.dustloop.com/forums/index.php?/forums/topic/9084-uniel-system-mechanics-updated-april-20th-2015/) (i hope it didn't change too much in unist)                                                                                                                                                                                                |
| [Nice doc on all chars!](https://www.evernote.com/shard/s454/client/snv?noteGuid=5f20d298-4eea-442d-91f4-2a6fcfa33e8c&noteKey=a032c800fd4a65b3&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs454%2Fsh%2F5f20d298-4eea-442d-91f4-2a6fcfa33e8c%2Fa032c800fd4a65b3&title=I%2BWant%2Bto%2BGet%2BStrong%2Bat%2BUNI.%2BVolume%2B9)                                                              |

### System

Basic wheel:
- Throw > Block
- Crouch tech > Throw
- Assault > Crouch Tech (assault is frame 1 throw invul)
- Abare > Assault
- Safe pressure > Abare
- Block > Safe pressure

Main options selects:
- late 71 A,D plink: block ground, beat assault, tech throws
- late back AB,D plink: back AB = backdash and the delayed D add a tech if being thrown 
- VO bait: Cannot cancel normal on which => quich chain 5A>5B, or 2A>2A on opponent wake-up, VO => whiff => no chain => can block, no VO => hit => chain => pressure
- Anti Wakeup CS: You can whiff cancel special into EX, meaty with special, use the 40f of CS to cancel into EX (read)
- CS at first opportunity: spam crouch block A+D(throw), will not activate shield and will CS at the first gap (spam D would activate shield with is potentially dangerous and will lock you in shield)

More:
- Vatista cannot be counter hit, ever. It's a vatista thing.
- The default is "ground moves cannot be air blocked", there are exceptions.
- Shieding overheads allow for 6f punish (jab).
- Basically every string that does not finish with an EX move is - on block.
- tons of strings when shielded must be CS EX beam punishable, but we get no traditional punishes
- Common: high become mid when charged, charged mid/delayed low is a strong mixup
- Many blockstrings are so tight you can't dp out, however you can still get hit high/low
- Ways to CS in a blockstring, spam 1A+D, spam 3D (add a mapping for A+D?)

#### The buttons

- Buttons: A, B, C ,D
- Standard binding in (SFV notation): A->LP, B->MP, C->HP, D->LK
- EX moves are made with the C button and use half your meter

Directions:

|_|_|_|
|-|-|-|
|7↖|8↑|9↗|
|4←|5|6→|
|1↙|2↓|3↘|

For instance 2A would be "crouching light punch" (cLP) in SF parlance.

| Notation | Description                                                 |
|----------|-------------------------------------------------------------|
| dl5A     | delay 5A                                                    |
| jA       | jump A                                                      |
| ]A[      | press and hold A                                            |
| [2A]     | release down A                                              |
| jc       | jump cancel                                                 |
| A+B      | A and B together                                            |
| 5A>5B    | 5A 5B link                                                  |
| 5A5B     | 5A 5B chain (gattling)                                      |
| 2A(1)    | down A one hit (do something on first hit of multihit move) |
| 💥       | explosion (descriptive)                                     |
| 💎       | crystal (descriptive)                                       |

common specials

| button  | name                | description                                                                                                                                                                                    |
|---------|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A+B+C   | VO (Veil Off)       | some kind of GG roman cancel, not a burst, invulnerable, full screen pushback, you can charge it but just tap it, vulnerable during landing frames. Afterwards you are in VO "Veil Off" state. |
| B+C     | FF (Force Function) | character specific strong move that cost grid, generally pretty OP move                                                                                                                        |
| (4)A+B  | (back)dash          |                                                                                                                                                                                                |
| jA+B    | assault             | forward hop (from a jump)                                                                                                                                                                      |
| (j)6D   | assault             | forward hop (potentially from a jump)                                                                                                                                                          |
| (4)A+D  | throw               | (can't do it while crouching)                                                                                                                                                                  |
| D>D     | CC (Chain Shift)    | like GG roman cancel                                                                                                                                                                           |
| tatsuD  | Guard Thrust        | It's an invulnerable guard cancel move. Uses Vorpal&grid break, or 100-200% meter and grid break. If in "Vorpal carryover" from CC, no grid break.                                             |
| hcfD    | IW (Infinite Worth) | 200% Super                                                                                                                                                                                     |
| A+B+C+D | IWEXS               | 200% Super while in VO                                                                                                                                                                         |
| 1/4/7D  | Shield              | guard with special properties                                                                                                                                                                  |
| 5D      | Concentration       | grid gain. startup is special cancellable. holding a backward direction will start shielding                                                                                                   |

VO might not be throw invulnerable! VO should be able to be used multiple times (test).

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

#### Gattling ("Passing Link")

- standard anime gattling + reverse beat: can chain from any button to any button, cannot use the same button twice (save some exceptions like 5A5A5A into rest of your chain)
- reverse beat (chain from a heavy to a light) is pretty useful to cancel the recovery of a slow move to a fast move to make your chain safe on block
- all these rules are valid in the air too

#### Autocombo ("Smart Steer")

- 5A5A5A5A ... (test if it works with 4A and 6A! can we start charging during the autocombo???)
- Useful in some cases because moves in autocombo do not count in gattling restrictions (similar to DBFZ)

#### Recovery/Teching

- Hold (or press) A/B/C + direction (air: forward neutral or back, ground: neutral or back, delayable)
- D does delay tech, air ~> delay to ground, ground ~> delay ground
- 8f throw invul
- air tech is full invul until landing
- tech recovers standing, but reversal can skip that frame (ex. reversal low to avoid some hilda meaties)
- bounce recovery: press A/B/C just before a ground/wall bounce (or you can simply hold D :p)

#### Wall/Ground bounces

- 3 bounces max by combo, after the 3rd bounce the opponent becomes invulnerable (even if they do not tech recover)

#### Jump Cancels (jc)

- no jc on block
- 1 jc by combo (bar character specific stuff)

#### Shielding

- locks player in stand/crouch => easier to get grid crushed
- D during blockstun = "guard shielding" (green flash), does not stand/crouch lock but force to keep shielding
- guard shielding costs 10 exs meter (less if you dont have meter), consequent shield whiff = -1 grdblock, block = +1 grdblock
- ground shield => -3f blockstun
- air shield => -6f blockstun
- successful shield = small pushback, succesful guardshield = big pushback
- air guard requires shield
- shield disable gattling for air moves and impose 10f of landing recovery
- grd crush => cannot use D moves anymore (shield, assault, concentration)
- every hit of multi-hit moves must be shielded individually
- for air multi-hit moves, any hit shielded => 10f landed recovery, last hit shielded => -3f blockstun
- "just shielding" will auto reapply shield after 1st block, good for multihit moves, super bad for air move shield (you lose your punish)
- air shield is a move => landing recovery, you can get hit on landing

#### Throws

- 4f startup
- 14f tech window
- can get thrown during hit/blockstun, 28f tech window
- throw whiff => -1 grd block
- 7f of gold throw protection out of hit/blockstun (28f tech window)
- in some cases dive command throw invulnerability during that window (bug?)
- 8f throw invul. after air/ground recov
- counterthrow is untechable (red flash)
- on throw tech, +2 grd block (ennemy -2), +8f advantage
- throw&hit on same frame => throw wins
- B button kara throw is a thing
- after guard shield (green shield), throw break =>
  1. ?frames yellow break state: autotech normal&command, still block but no shield)
  2. then throw counter state: no grd crush on normal throw, grd crush on command throw

#### Assault

- throw invul.
- 5f startup
- ground => homing move, air => fixed trajectory
- cannot block until landing, has landing recovery frames
- gattling disabled during ground assault, gattling enabled during air assault
- combos from assault have heavily reduced untech time, and reduced damage
- combos from counterhit/grd crush assault have regular untech time, and regular damage
- air assount penalties = ground assault penalties
- can be kara in the first 2frames, ie. assault kara throw = 2f throw invul. into throw

#### Grd

- passive generation, lower when closer to the corner
- grd gain scales down with grd
- some moves steal grd (ie. gordeau command throw, byakuya webs)
- Actions that generate grd:
  - Concentration
  - Any forward movement (assault = ~+0.5grd)
  - Any opponent backward movement
  - Aerial forward tech
  - Opponent immediate ground tech
  - Blocking/Shielding attacks (shield connection = +1grd)
- Actions that lose grd:
  - Opponent concentration >30f (faster when using grd)
  - Any backward movement (backdash = ~-1grd)
  - Any opponent forward movement
  - Guard shield whiff (green shield) = -1grd
  - being thrown/having a throw teched = -2grd
  - throw whiff
  - Ground back teching = -1grd

#### Concentration

- up to 420f
- generate grid from frame 1
- after 30f, concentration will burn your meter to gain extra grd
- when you burn meter, draining grid from your opponent gets a huge boost (does not happen if you have no meter to burn)
- gain from drain >>> concentration drain

| character                                                                         | grid gain/drain modifier (high is better) |
|-----------------------------------------------------------------------------------|-------------------------------------------|
| Eltnum,Nanase                                                                     | 1x                                        |
| Orie                                                                              | 2x                                        |
| Yuzuriha,Seth,Gordeau,<br>Carmine,Merkava,Hyde,<br>Linne,Vatista,Byakuya,Akatsuki | 3x                                        |
| Waldstein                                                                         | 4x                                        |
| Hilda,Chaos                                                                       | 5x                                        |

- gain from drain >>> concentration drain => if eltnum has meter and hilda does not, even with a terrible modifier eltnum will outdrain hilda in a concentration war

also

- In a mirror, with meter, hold 5D at same frame => Player 2 wins

#### Vorpal

- timer = 17s
- player with the most grd gets vorpal
- grd crush or 0grd => no vorpal
- nobody can get vorpal => timer reset
- vorpal => +10%dmg and character specific stuff
- at the cost of vorpal + all grd you can:
  - CS and convert all your meter into EXS meter (will carryover vorpal for a little bit)
  - Guard cancel without spending meter or getting grd crushed (note, during CS carryover vorpal, guard cancel will still not guard crush you but you it will eat your meter)
  - IWEXS without getting grd crushed (keep requirements: 200 meter and <30% health)

#### Veil Off (VO)

- cost: 100 meter, then drain meter to 0
- gain: 1grd, remove grd cush, +20% dmg (additive stack with vorpal +10%)
- in VO: ,EX move cost = becomes 1/3rd of VOmeter, IW(EXS) cost = remainder VOmeter (removes grd crush cost of IWEXS)
- only from ground, move itself is airborne & strike/fireball invulnerable
- on hit, opponent loses vorpal, on raw hit opponent gets grd crushed
- CS during VO slows down meter drain (scales with CS should-have-gained-meter and grd)
- VO 20-68f startup, -13 to -14 on block

#### Counters

- throw counter (countering with a move) is untechable (red flash)
- normal counterhits (counter with B,C or a special)
  - countering a normal => "Counter" => increased hitstun, 1.5x untech time if airborne (both first hit only)
  - countering a special => "High Counter" => increased hitstun, 2x untech time if airborne (both first hit only)
- (high) counters give a little bit of extra hitstun during the whole combo (not well understood)
- throws cannot be counterhit but can be "throw countered" in recovery frames
- Counters and High Counters from assault remove the assault penalty

#### Superflash and Screen Freeze:

- EX moves => 20f freeze (1f superflash + 19f freeze)
- CS => 40f freeze (1f superflash + 39f freeze)
- IW => ??f freeze
- superflash frame is throw invulnerable

#### Input Buffering

- input timers continue during frozen frames
- inputs are buffered for ~4f, to avoid dp on walk forward hadou, insert 4f of neutral

#### Fuzzy Protection

- moves can hit overhead only on the way down
- if ennemy is holding back down, press a button, and get hit by a rising overhead move, resulting combo deals 50% less damage
- penalty applies to air move that make the character rise
- penalty stacks with assault penalties

#### Crossup Protection

- on fast crossups, can block in both direction
- blockstun deny left/right mixups
- shield works as if in blockstup and deny left/right mixups
- each attack/fb has a "facing" direction you block away from. For most fireball it's the direction when shot, but for seth orb, carmine puddle it's from direction of triggering (delayed homing).
- walking backwards before crossup extends the duration of crossup protection

#### Same Move Proration

- Using the certain moves twice in a combo reduce untech time
- Might be all special moves, might be all moves more (specials) or less (normals), nobody knows

#### Dashing/Backdashing

- 6A+B dash, 4A+B backdash, or forwardx2, backwardx2
- 6A+B>4 within 2 frames becomes a backdash
- dash movement start after ~2f
- dash can be cancelled at any point

| character                | backdash total | backdash invul                      |
|--------------------------|----------------|-------------------------------------|
| Akatsuki,Hyde,Gordeau    | 22f            | 8f                                  |
| Eltnum                   | 25f            | 8f                                  |
| Linne                    | 26f            | 8f                                  |
| Vatista,Yuzuriha,Carmine | 27f            | 8f                                  |
| Nanase,Chaos             | 28f            | 8f                                  |
| Byakuya                  | 29f            | 8f                                  |
| Waldstein                | 32f            | 10f                                 |
| Hilda                    | 36f            | 9f                                  |
| Orie                     | 36f            | 8f (no foot hurtbox until frame 15) |
| Seth                     | 37f (grounded) | 7f                                  |
| Merkava                  | 37f            | 10f                                 |

#### Meter Gain

- Meter is generated at a flat rate based on the damage a move deals on hit, not taking into account any proration.
- On-hit:
- - Attacker: 0.7% of the unscaled damage of a move is converted into meter gain. This includes any extra damage from being in vorpal state.
- - Defender: The player who gets hit will gain half the meter that the attacker gets for each hit.
- On-block:
- - Attacker: If a move is blocked, the attacker gains half of the meter they would have gained on hit.
- - Defender: When blocking, defenders gain 80% of the meter than the attacker gets from having their attack blocked.
- EX moves and mid-combo CS cause any subsequent moves to generate only 25% of their normal meter gain for a few seconds (approx. 5 seconds?).
- - EX moves in neutral still cause this effect, even if they are blocked or whiffed, but CS in neutral does not.
- - This penalty ends immediately when a penalized combo stops, or when the timer runs out, whichever occurs first.

#### Training Mode

- training mode recording does no the play on the first frame a bot exits hit/block stun, there is 1 frame of delay...
- when counter is enabled, only the 1st hit of a string will counter, even if there are gaps in the string...

#### Extra Info

Landing recovery

| air normal         | landing recovery                    |
|--------------------|-------------------------------------|
| A                  | 2f                                  |
| B                  | 3f                                  |
| C                  | 3f                                  |
| Assault            | 4f                                  |
| Air shield         | 2f                                  |
| Air shield landing | 6f                                  |
| Special moves      | lots~ (cancel into normal for less) |

Jump startup

| character                        | frames |
|----------------------------------|--------|
| Waldstein                        | 6f     |
| Hilda, Merkava, Carmine, Gordeau | 5f     |
| others..                         | 4f     |

- hitstop seems to be 8f for A move, up to 12 frames... (not well known)
- Most specials can be cancelled directly in EX moves on whiff
- IWEXS throw invul. only frame 1, strike/fb invul. until hit but can get hit after first hit, can trade with fireballs between hit and cinematic
- some special moves can get new cancels based on what comes before them (don't know if bug)

## Combos

- Can I cancel beam into 💎? Nope ~
- big proration can make enders minus (cannot detonate the oki 💎 safely)
- Akatsuki, Byakuya, and Chaos <- make delayed 2C pickups whiff

## Comboo guide 1

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


| starter               | combo                                                                                                    | note                                      |
|-----------------------|----------------------------------------------------------------------------------------------------------|-------------------------------------------|
| A                     | A>(B)>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                                   |                                           |
| A                     | 5A>2C>2A Whiff>Dash 2A>jA>j[B]>jC>Land 2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                        | when far, use 2C bounce to dash pick up   |
| A                     | 5A(Antiair)>jA>j[B]>Adrill> 2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                        | AA                                        |
| B/C                   | B>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                            | very tight                                |
| B/C                   | 2B>2C>2A Whiff>Dash 2A>jA>jB>Adrill(h)>2[C]>dl5B>2💎>5A>💥>2💎>2C>Bbeam>💥>jA>Adrill>💎                  | sliiightly more damage but harder         |
| assault B/C           | Assault jB/jC>5A>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                        | vveeeeery tight                           |
| jC/grd brk/counterhit | >5A>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                          |                                           |
| assault B/C AA        | >5A>jA>j[B]>Adrill>2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                                            | on AA jC or CH assault AA you can do more |
| 66B CH                | 66Bch>Microdash 5A>2C>5C>dlj[B]>dlAdrill> 2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎          | microdash 2C is possible                  |
| GuruGuru              | 66C>2FF>2A>jA>j[B]>jC> 2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                                        | wait to be point blank for 2FF            |
| GuruGuru              | 66C>2FF>2A>jA>j[B]>jC>Land 2[C]>5💎>2A>5B>Bbeam>💥> Dash 2💎(h)>Abeam>💥>jA>Adrill>💎                    | Hard, more damage                         |
| Crossup GuruGuru      | 66C>(Crossup)A Fb>2C>5C>dlj[B]>dlAdrill>2[C]>2💎>2A>2B>💥>2💎>[Bbeam]>💥>jA>Adrill>💎                    |                                           |
| AA GuruGuru           | 66C(Air hit)>5A>jA>j[B]>Adrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                     |                                           |
| Close 2FF             | Close 2FF>2A>jA>jB>Adrill(h)>2[C]>dl5B>2💎>5A>💥>2💎>2C>Bbeam>💥>jA>Adrill>💎                            |                                           |
| >💥                   | >💥>5A>jA>j[B]>Adrill>2[C]>2💎>2A>2B(1)>💥>5💎>💥>j[C]>Adrill>💎                                         | 💎 combos are very peculiar...            |
| corner>💥             | (Corner)💎💥>5C>j[B]>Adrill>2C>A Fb>2[C]>2💎>2A>2B(1)💥>5💎>💥>j[C]>Adrill>💎                            | (harder)                                  |
| Bdrill                | Bdrill>66C>5A>jA>jB>jC>Land jA>j[B]>Adrill>2C>💎                                                         |                                           |
| corner Bdrill         | (Corner)Bdrill(h)>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]>💥>jA>Adrill>💎                                  |                                           |
| B Fk                  | B Fk>CS(preslam)>Assault dljC>Land jA>j[B]>dlAdrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]💥>jA>Adrill>💎 |                                           |
| B Fk                  | B Fk>CS(preslam)>Assault dljA>jC>Land j[B]>dlAdrill>2[C]>2💎>2A>Abeam>💥>2💎>(2C)>[Bbeam]💥>jA>Adrill>💎 |                                           |

## Combo guide 2

Starter > Aerial > Landing > Ender

### Starters

These starters all take the place of 2C > 5C in the above 2C combo.

| starter               | note                                                                                                                          |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------|
| 5A/2A > 2C > 5C       | standard, don't add a B                                                                                                       |
| 5B/2B > 2C > 5C       |                                                                                                                               |
| jB/jC > 2C > 5C       | if Assault, you'll need to use the jB > (jA >) Adrill aerial route to get a💎 combo.                                          |
| 66C > [4]6A > 2C > 5C | If you hold 6(4?) during 66C, will be 4 on crossup and give you a [4]6A. when no cross up, 66C > FF > CS > 5C.                |
| 5C > FF > CS > 5C     | if Vatista is too far for 2C punish, or unexpected hit. 5C > 2C > 5B can work. 5C > 2C > FF > CS > Aerial more dmg less range |
| 66B (ch) > 2C > 5C    | 66B knocks the opponent down on counterhit, meaning you can follow up with this.                                              |

### Aerial Routes

These all come after 5C in the standard💎 combo and are more or less replaceable.

j[B] > jC > Adrill
- Basic air combo. Works.

j[B] > jC > land > jA > Adrill
- land > jA increases combo range

dl j[B] > dl Adrill
- low proration use, useful for💎 combos off of assault, or double beam.
    
j[B] > jA > Adrill or jA > j[B] > Adrill
- a bit more leniency than previous, not much more proration

jA > jB > jC > land > jA > jB > Adrill
- no fragment, good for AA 5A hits.

late jC > land > jA > j[B] > Adrill
- used for aerial CS combos ([2]8B > CS, FF > CS) and random hits

jC > 5C > jA > jB > Adrill
- safe for random air hits

### Landing

The all are assumed to come after an aerial Adrill. Any combo with 2]B[ assumes that you were already holding B before entering this route.

2A / 2C > 2B
- Basic landing route that can't lead into anything other than [2]8X. Based on your combo's proration, 2C may drop, requiring you to use 2A instead.

2[C] > 2]B[ > 2A > 2B > 2]C[ > [6]4B
- standard💎 landing route

2[C] > 2]B[ > 2A > 2B(1) > 2]C[
- 2]C[💎 popped by first 💥. Used for💎 starters, or when a combo pops a random💎

2[C] > 2]B[ > 2A > [6]4A > 2]C[ > [6]4A/B
- double beam route. 2A Abeam has a big gap so mind the proration

### Ender

B/C Fk
- far oki mid screen, can do lots of safe stuff. B Fk great in the corner, C Fk meh in the corner.

jC > FF > [8]2C
- after 2+💎 hits. Holding [8] during FF drags the opponent upward, letting you get more hits out of [8]2C. It (usually) does more damage than a [2]8C ender, cannot combo from wall slam but always safe (even on pre-slam tech)

jC > Adrill
- Any aerial sequence (jC jB jA, jB jC, etc.) into Adrill after a second💎 more or less works. A meterless ender that does similar/slightly more damage than [2]8B and ends with better oki positioning midscreen. Generally a 2]B[ or 2]C[💎 is released after the Adrill, but keep in mind that like all Frag setups midscreen, backtech avoids everything.

### Basic Combos

5A > 5B > 2C > 5C > jB > jC > Adrill > 2C > 2B > [2]8B (2537)
- Basic ground combo that gets you used to Adrill and 2C OTG. Still a useful route to go to later on if you feel your starter has prorated your combo too much (Assault, especially).

5A > 5B > 2C > 5C > j[B] > jC > Adrill > 2C > 2]B[ > [2]8B (2693)
- Slightly stronger and more complicated ground combo. Uses a single Fragment to get you used to comboing with them.

5A (anti-air) > jA > jB > jC > land > jA > jB > jC > Adrill > 2C > 2B > [2]8B (2215)
- Basic anti-air combo that gets you used to jC > land > jA. Can connect off of many other moves, such as anti-air 66B/66C. You may need to replace 2C > 2B with 2A if used in a longer combo due to proration.

### Midscreen Combos

Damage values indicate base damage. "+" values indicate bonus damage from Vorpal (CS combos only). Note that slight changes in timing can change the amount of hits your moves do, so expect values to vary in practice.

#### 2C

(2A/ 5B/ jB/ jC >) 2C > 5C > j[B] > jC > land > jA > Adrill > 2[C] > 2]B[ > 2A > 2B > 2]C[ > [6]4B > ([2]8B (3240) / [2]8C (4059) / jC > Adrill (3308) / jC > FF > [8]2C (4075))
- The standard Fragment combo. The button holding required to use Fragments mid-combo may seem difficult, but they're no big deal once you get the motions into your muscle memory. The 2C and 2A OTGs are a little strict, however - hitstun proration can ruin this combo easily if you're not careful with your starter or don't get a counter-hit (though the j[B] > Adrill aerial route will make up for the former). Still, there are a LOT of starters not listed that can get to this route. The damage for [2]8B/C assumes you do it after [6]4B - it's difficult, but you can swap it for 2B instead for less damage.

(5B >) 2C > 5C > 5FF(whiff) > 9FF > CS > jC > land > jA > j[B] > Adrill > 2[C] > 2]B[ > 2A > [6]4A > 2]C[ > [6]4A > ([2]8B (3973+162) / [2]8C (4923+162) / jC > Adrill (4040+162) / jC > FF > [8]2C (4796+162))
- A CS version. The trick is to whiff the grounded 5FF, but hold 9 to make the second (airborne) portion hit. This uses the double laser landing route for additional damage.

#### 💎

💥 > 5C > j[B] > jC > land > jA > Adrill > 2[C] > 2]B[ > 2A > 2B > 2]C[ > ([2]8B (3171) / [2]8C (4127) / jC > Adrill (3262))
- Standard Fragment combo that takes into account the fact that the opponent will tech after the first mid-combo Fragment by releasing the second mid-combo Fragment before they're knocked out of the first one's 💥. For the jC > Adrill ender, you need to time the second Fragment's so it explodes from the first one's 💥 - for either [2]8 ender, you can get away with being a little late since the Flash Kick will pop it.

#### Bdrill

All damage values assume the drill portion of Bdrill hits only once before the kick, as an instant overhead should.

Bdrill > 66C > 5A > jA > jB > jC > land > jA > jB > Adrill > 2C > 2B > [2]8B (2629) / [2]8C (3240)
- Standard meterless combo from 66C. Hitstun proration makes 2C > 2B a bit difficult to connect from Adrill, so you can use 2A instead.

Bdrill > 66C > FF > CS > jC > land > jA > jB > Adrill > 2C > 2B > [2]8B (2895+174) / [2]8C (3506+174)
- A CS conversion for 0/100% bar.

#### [2]8B

[2]8B > CS > 66 (dl) jC > land > jA > j[B] > Adrill > 2[C] > 2]B[ > 2A > [6]4A > 2]C[ > [6]4A > ([2]8B (3644+152) / [2]8C (4416+152) / jC > Adrill (3629+152) / jC > FF > [8]2C (4385+152))
- Yes, Vatista can combo off of Flash Kick with CS. You'll need to dl the jC after the CS > 66 to let jA hit.

### Corner Combos

#### Bdrill

[Bdrill] > 2[C] > 2]B[ > 2A > 2B > 2]C[ > [6]4B > jC (Adrill (2780) / FF > [8]2C (3388))
- standard💎 route, but in the corner. 2C will whiff on Akatsuki, Byakuya, and Chaos.
        
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
With the buffs to C Orb, you can end with j[FF] cancelled into C Orb, mostly in the corner. 2C > [6]4B > 5FF into j[FF] > j[4]6C would be the way to go. You can also link an FF after Satellus to build more meter, though it’s a bit more difficult to pull off.

You can do an air C Fb right after a Satellus ender, too. Go for the j[FF] ender alone if you want damage, and use either the Satellus > j[4]6C or Satellus > j[FF] enders if you want to build meter.
Just remember that you’re in trouble if you drop any of them.

#### VO
A combo ender that uses a universal mechanic to strip an opponent’s vorpal. Vatista can fit in a VO at the very end of her combo, so keep her damage untouched and end in VO, [6]4B 💥 > VO, 66B 💥 > VO, or 💥 > Gem set 💥 > VO.

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

💥 > 2C 5C > j[B]/jA j[8]2A > 2C [4]6A > 2[C] 2]B[ > 2[A] 2[B](1hit)/5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
- Start: jA 💥
- Corner
- Practicality: ☆☆☆
- If you cause an 💥 with any normal with lighter proration than an A normal (including, but not limited to, jA), then use this route. Just like with the midscreen route, you’ll need to swap jB with jA for Bdrill or jB 💥 starters.

5C 💥 > j[AB] > j[8]2A > 2C [4]6A > 2C 5B > jA j[B] jC > 2[C] 2]B[ > 2[A] 5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
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

66C [4]6A > 2C 5C > j[B] j[8]2A > 2[C] 5]B[ > 2[A] 5B [6]4[B] > dash 2]C[ > 2C dl 2[B](1hit) 2]A[ > dl 2C ]B[
- Start: 66C
- Midscreen
- Practicality: ☆☆
- If you connect A orb after a 66C, you should go into the B laser route into 2C ender to get damage and maintain advantage.

5A 2C 5C > jB j[8]2A > 2C [4]6[A] > 2[C] dl 2BB 5]A[ > 5BB 2]C[ > walk back VO
- Start: A Normal
- Corner
- Practicality:
- A VO ender combo that leaves up a💎. You can go straight for this route from even high proration starters like jC. You just need to walk back for a moment. The💎 set > VO ender is something I only found recently so I haven’t done it in a match yet, but the route itself should be fine.

2C 5C > jB j[8]2A > 2C [4]6[A] > 2[C] dl 2BB 5]A[ > 5B [6]4B > 2]C[ > walk back VO
- Start: 2C
- Corner
- Practicality:
- Try not to leave too much of a dl between 2B > 2BB and 5B > [6]4B. This combo gets a bit less stable once you add in the B laser, so if you want something consistent, stick with the A starter route and use 5BB instead.

B 2C 5C > j[B] j[8]2A > 2C [4]6[A] > 2[C] 5]B[ > 2A 5B [6]4B > 2]C[ > walk back VO
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
