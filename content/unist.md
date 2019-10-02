+++
title = "UNIST"
description = "notes on learning vatista"
date = 2019-03-17
weight = 100
draft = false
in_search_index = true
[taxonomies]
#tags = [ "clojure" ]
[extra]
+++

- [VATISTA](@/unist/vatista.md)
- [CARMINE](@/unist/carmine.md)

- [SYSTEM](#system)
- [PLUSMINUS](#plusminus)


| Data from                                                                                                                                                                                                                                                                                                                                                                                |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The [dustloop uniel system post](http://www.dustloop.com/forums/index.php?/forums/topic/9084-uniel-system-mechanics-updated-april-20th-2015/) (i hope it didn't change too much in unist)                                                                                                                                                                                                |

## System

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

### The buttons

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

### Gattling ("Passing Link")

- standard anime gattling + reverse beat: can chain from any button to any button, cannot use the same button twice (save some exceptions like 5A5A5A into rest of your chain)
- reverse beat (chain from a heavy to a light) is pretty useful to cancel the recovery of a slow move to a fast move to make your chain safe on block
- all these rules are valid in the air too

### Autocombo ("Smart Steer")

- 5A5A5A5A ... (test if it works with 4A and 6A! can we start charging during the autocombo???)
- Useful in some cases because moves in autocombo do not count in gattling restrictions (similar to DBFZ)

### Recovery/Teching

- Hold (or press) A/B/C + direction (air: forward neutral or back, ground: neutral or back, delayable)
- D does delay tech, air ~> delay to ground, ground ~> delay ground
- 8f throw invul
- air tech is full invul until landing
- tech recovers standing, but reversal can skip that frame (ex. reversal low to avoid some hilda meaties)
- bounce recovery: press A/B/C just before a ground/wall bounce (or you can simply hold D :p)

### Wall/Ground bounces

- 3 bounces max by combo, after the 3rd bounce the opponent becomes invulnerable (even if they do not tech recover)

### Jump Cancels (jc)

- no jc on block
- 1 jc by combo (bar character specific stuff)

### Shielding

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

### Throws

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

### Assault

- throw invul.
- 5f startup
- ground => homing move, air => fixed trajectory
- cannot block until landing, has landing recovery frames
- gattling disabled during ground assault, gattling enabled during air assault
- combos from assault have heavily reduced untech time, and reduced damage
- combos from counterhit/grd crush assault have regular untech time, and regular damage
- air assount penalties = ground assault penalties
- can be kara in the first 2frames, ie. assault kara throw = 2f throw invul. into throw

### Grd

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

### Concentration

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

### Vorpal

- timer = 17s
- player with the most grd gets vorpal
- grd crush or 0grd => no vorpal
- nobody can get vorpal => timer reset
- vorpal => +10%dmg and character specific stuff
- at the cost of vorpal + all grd you can:
  - CS and convert all your meter into EXS meter (will carryover vorpal for a little bit)
  - Guard cancel without spending meter or getting grd crushed (note, during CS carryover vorpal, guard cancel will still not guard crush you but you it will eat your meter)
  - IWEXS without getting grd crushed (keep requirements: 200 meter and <30% health)

### Veil Off (VO)

- cost: 100 meter, then drain meter to 0
- gain: 1grd, remove grd cush, +20% dmg (additive stack with vorpal +10%)
- in VO: ,EX move cost = becomes 1/3rd of VOmeter, IW(EXS) cost = remainder VOmeter (removes grd crush cost of IWEXS)
- only from ground, move itself is airborne & strike/fireball invulnerable
- on hit, opponent loses vorpal, on raw hit opponent gets grd crushed
- CS during VO slows down meter drain (scales with CS should-have-gained-meter and grd)
- VO 20-68f startup, -13 to -14 on block

### Counters

- throw counter (countering with a move) is untechable (red flash)
- normal counterhits (counter with B,C or a special)
  - countering a normal => "Counter" => increased hitstun, 1.5x untech time if airborne (both first hit only)
  - countering a special => "High Counter" => increased hitstun, 2x untech time if airborne (both first hit only)
- (high) counters give a little bit of extra hitstun during the whole combo (not well understood)
- throws cannot be counterhit but can be "throw countered" in recovery frames
- Counters and High Counters from assault remove the assault penalty

### Superflash and Screen Freeze:

- EX moves => 20f freeze (1f superflash + 19f freeze)
- CS => 40f freeze (1f superflash + 39f freeze)
- IW => ??f freeze
- superflash frame is throw invulnerable

### Input Buffering

- input timers continue during frozen frames
- inputs are buffered for ~4f, to avoid dp on walk forward hadou, insert 4f of neutral

### Fuzzy Protection

- moves can hit overhead only on the way down
- if ennemy is holding back down, press a button, and get hit by a rising overhead move, resulting combo deals 50% less damage
- penalty applies to air move that make the character rise
- penalty stacks with assault penalties

### Crossup Protection

- on fast crossups, can block in both direction
- blockstun deny left/right mixups
- shield works as if in blockstup and deny left/right mixups
- each attack/fb has a "facing" direction you block away from. For most fireball it's the direction when shot, but for seth orb, carmine puddle it's from direction of triggering (delayed homing).
- walking backwards before crossup extends the duration of crossup protection

### Same Move Proration

- Using the certain moves twice in a combo reduce untech time
- Might be all special moves, might be all moves more (specials) or less (normals), nobody knows

### Dashing/Backdashing

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

### Meter Gain

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

### Training Mode

- training mode recording does no the play on the first frame a bot exits hit/block stun, there is 1 frame of delay...
- when counter is enabled, only the 1st hit of a string will counter, even if there are gaps in the string...

### Extra Info

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

## PlusMinus

....
