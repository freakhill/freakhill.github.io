+++
title = "Vatista"
description = "notes on learning vatista"
date = 2019-03-17
weight = 90
draft = false
in_search_index = true
[taxonomies]
#tags = [ "clojure" ]
[extra]
+++
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
- Jump Throw Tech (Fuzzy Jump): 71A+D > Assault, Throw; loses to delayed AA (shouldn't it be 17A+D???)
- VO bait: Cannot cancel normal on which => quich chain 5A>5B, or 2A>2A on opponent wake-up, VO => whiff => no chain => can block, no VO => hit => chain => pressure
- Anti Wakeup CS: You can whiff cancel special into EX, meaty with special, use the 40f of CS to cancel into EX (read)

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
| crystal   | Deus Fragmentum | [A/B/C] ... ](2)A/B/C[ | button hold and release/birdie bull horn (61f charge), 1 crystal by button, position change with stand/crouch/air, explosion is untechable |

#### Frame data

| button      | startup    | active | recovery  | on block          | level | note                                    |
|-------------|------------|--------|-----------|-------------------|-------|-----------------------------------------|
| 5A          | 6          | 3      | 12        | -3                | high  |                                         |
| 2A          | 6          | 3      | 12        | -3                | high  |                                         |
| 5B          | 12         | 9      | 18        | -2                | high  |                                         |
| 5BB         | -          | 6      | 25        | -8                | high  | sucks                                   |
| 2B          | 10         | 9      | 29        | -13               | high  |                                         |
| 2BB         | -          | 6      | 25        | -8                | high  |                                         |
| 5C          | 12         | 5      | 22        | -11               | high  |                                         |
| 2C          | 11         | 13     | 23        | -6 to -16         | low   |                                         |
| jA          | 6          | 3      | 2land     | ?                 | mid   |                                         |
| jB          | 11         | 6      | 3land     | ?                 | mid   |                                         |
| jC          | 12         | 10     | 4land     | ?                 | high  |                                         |
| jA+B        | 18         |        |           |                   |       | (floats)                                |
| 66B         | 10         | 2      | 12        | -2                | high  | CS/EX cancel, counterhitKD              |
| 66C         | 12         | 18     | 20        | -5                | high  | guruguruguru~, cancellable              |
| groundFF    | 10         | 3      | 30        | -4/-6(held)       | high  |                                         |
| airFF       | 14         | 6      | 9land     |                   | high  | CS/EX cancel                            |
| throw       | 4          | 1      | 22        |                   |       |                                         |
| guardcancel | 0          | 16     | 5         | -14               | high  |                                         |
| VO          | 21 to 69   | 2      | 37        | -13               | high  |                                         |
| Afb (ball)  | 21(ground) |        |           | +8 to +17         | high  | 53f charge, disappear when hit          |
| Bfb         | 19(ground) |        |           | +19 to -6         | high  | 53f charge, disappear when hit          |
| EXfb        |            |        |           | ...               |       | 53f charge, disappear when hit          |
| A/D/EXfk    | 4          |        |           |                   |       | 53f charge, CS cancellable              |
| Abeam       | 14         | 5      | 24(41air) | -3(-5 air)        |       | 53f charge, extra air action            |
| Bbeam       | 15(17air)  | 5      | 21(41air) | 0(-20 to -10 air) |       | 53f charge, extra air action            |
| EXbeam      | 8          | 25     | 54(?air)  | +7(+11air)        |       | 53f charge                              |
| crystal     | 1(7)       |        |           |                   |       | 61f charge, 💥 untechable until landing |
| Adrill      | 7          | 13     | 18        | 2                 | high  | 43f charge                              |
| Bdrill      | 20         | 9      | 48        | -7                | mid   | 43f charge, actually air unblockable    |
| Cdrill      | 5          | ...    | 18        | -1                | mid   | 1-3f strike inv., 4-~f fb inv.          |
| IW          | 12         | ...    | ...       | -33               | high  | 1-147f inv.                             |
| IWEXS       | 15         | 6      | ...       | -25               | high  | 1-26f inv.                              |

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
- tech recovers standing, but reversal can skip that frame (ex. reversal low to avoid some hilda meaties)

#### Wall/Ground bounces

- 3 bounces max by combo, after the 3rd bounce the opponent becomes invulnerable (even if they do not tech recover)

#### Jump Cancels (jc)

- no jc on block
- 1 jc by combo (bar character specific stuff)

#### Shielding

- locks player in stand/crouch => easier to get grid crushed
- D during blockstun = "guard shielding" (green flash), does not stand/crouch lock but force to keep shielding
- guard shielding costs 0-10 grd?? meter, consequent shield whiff = -1 grdblock, block = +1 grdblock
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

- 5f startup
- ground => homing move, air => fixed trajectory
- cannot block until landing, has landing recovery frames
- throw invul.
- gattling disabled during ground assault, gattling enabled during air assault
- combos from assault have heavily reduced untech time, and reduced damage
- combos from counterhit/grd crush assault have regular untech time, and regular damage
- air assount penalties = ground assault penalties

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
- Concentrating for more than 30f will drain meter from the player, but can be done even even if a player has no meter.
- - During the meter drain, players will drain opponent's grd significantly faster than normal. Without meter, this faster drain effect will not occur.
- In a concentration battle, the amount of grd that can be drain from the opponent when spending meter will always outweigh the difference in amount gained from the concentration itself.
- - In other words, even Eltnum can out-generate Hilda in a concentration battle if Eltnum spends meter and Hilda has no meter to spend.
- In a mirror at the start of a round, if both players have meter and hold concentration, player 2 will fill their grd blocks slightly faster than player 1.
- when nobody has meter, nobody gets vorpal and the timer reset

| character                                                                         | grid gain/drain modifier (high is better) |
|-----------------------------------------------------------------------------------|-------------------------------------------|
| Eltnum,Nanase                                                                     | 1x                                        |
| Orie                                                                              | 2x                                        |
| Yuzuriha,Seth,Gordeau,<br>Carmine,Merkava,Hyde,<br>Linne,Vatista,Byakuya,Akatsuki | 3x                                        |
| Waldstein                                                                         | 4x                                        |
| Hilda,Chaos                                                                       | 5x                                        |

#### Vorpal

- When the grd transfer state ring is filled (every 17 seconds), the player with the most grd gauge will enter vorpal state.
- If a player has no grd gauge, or if a player is grd crushed, he will not be able to enter vorpal state.
- - If both players cannot enter vorpal, then the meter simply resets with neither player gaining any benefits.
- Vorpal grants players an extra 10% in damage output throughout its duration.
- Players in vorpal can consume their vorpal state (and all their grd blocks) to perform one of the following actions:
- - Using chain shift to cancel their moves and convert all their grd gauge into EXS meter. This will carry over the vorpal damage bonus for a brief moment (see CS section).
- - Performing a guard thrust (guard cancel) attack without spending meter or being grd crushed. Outside of vorpal, this normally costs all your meter to perform (with a minimum of 100 meter required), as well as grd crushes you.
- - - There is a special property on grd thrusts when performed immediately after a chain shift. As long a player is still in vorpal carryover state, the player can spend all of their meter and remaining vorpal carryover bar to perform a grd thrusts without grd crushing themselves.
- - Use IWEXS without getting grd crushed (200 meter and <30% health requirement remain the same).
- Some characters gain special benefits from being in vorpal state. Carmine, for example, spends less health to perform his specials, and Eltnum gains the ability to whiff-cancel her A normals.

#### Veil Off

- Veil off is a fully invincible burst (except against Gordeau's 214B and rekka grab) that can be performed when a player has 100 or more meter available. Upon entering this mode, the player's meter will slowly drain until it reaches 0 and the mode ends.
- Veil off can only be performed when the player is on the ground
- Activating veil off automatically generates 1 block of grd gauge and removes grd crush status if the player was suffering from it.
- While in veil off, players can freely use EX moves at the cost of a third of their total veil off meter
- While in veil off, players gain 20% extra damage output.
- - This stacks with vorpal's damage bonus, meaning players can have 30% bonus damage in their combos.
- If opponents are hit by the veil off burst, they are grd crushed and will lose vorpal if they had it.
- - Notably, if opponents are combo'd into the veil off burst, they will not suffer the grd crush penalty, but will still lose vorpal.
- While in veil off, players can use their IW or IWEXS (both usually cost 200 meter) at the cost of immediately ending veil off mode.
- - This is especially useful with IWEXS, because it normally causes grd crush to the player performing the move.
- While in veil off, players gain more grd for grd generating actions. Grd loss remains the same as normal.
- If a player uses chain shift during veil off, the veil off meter drain will slow down temporarily.
- - The amount of slowdown is directly proportional to the amount of meter a player would gain from CS (ie: you can consider the slowdown to be from the meter gain going into the VO meter bar).
- - The duration of the slowdown is also directly proportional to the amount of GRD the player has when CS-ing.
- Veil off is -13 on block and has 20 frames of startup if not held.
- - If held fully, veil off is -14 on block and has 68 frames of startup.

#### Counters

- If a player attempts to perform a move but gets interrupted before the move comes out, they will be countered. There are three types of counters:
- - Throw counter: If the move is interrupted by a throw, the throw becomes unbreakable and the player being thrown will flash red.
- - Counterhits: For a counterhit to occur, a move must be interrupted by a B or C normal, or a special move.
- - - Counter: If the move that is interrupted is a normal move, the player who is interrupted suffers from a counter hit, which causes increased hitstun. If the player was airborne, they suffer 1.5x the normal untech time.
- - - High Counter: If the move that is interrupted is a special move, the counterhit will become a high counter. If the interrupted player was airborne, they will suffer 2x the normal untech time. High counters are otherwise the same as counters.
- Throws cannot be counterhit, but they can be throw countered if a player is thrown out of their throw whiff recovery.
- Notably, landing counters and high counters with an assault overhead will also remove the reduced untech time typically incurred by using assault overheads.
- Counter and High Counter do not add 1.5 or 2 times hitstun to your entire combo (see below). They do add hitstun to the first hit of a combo, and they do remove the assault penalty on overheads, as well as apply any special counterhit properties to the first hit of a combo.
- Counter and High Counter have different effects on airborne and grounded opponents. Against airborne opponents, they extend untech time by 1.5 and 2 times, respectively (haven't actually checked to make sure it's 1.5x and 2x, but it's a very sizable amount that generally seems to just make the opponent ground tech). Against grounded opponents, Counter and High Counter have the same effects as each other. They seem to add between 0 frames (ie: Sion 5A) and 3 frames (ie: Yuzu 5C) of extra hitstun. There may be moves that add more than 3 frames.
- Counter and High Counter do, in fact, add very slight amounts of extra hitstun to an entire combo, likely by reducing the starting untech proration of a combo. The amount of reduced untech appears to be based on what move actually counterhit the opponent. Counterhits likely either add a set amount of additional untech proration to a combo, or add an amount that is based on the untech time of the combo starter. Either way, combos started from counterhit tend to have between 2 and 3 frames of additional hitstun throughout most of the combo in places where proration would normally cause opponents to tech.
- Multi-hit moves do not benefit from the effects of Counter or High Counter against aerial opponents, because only the first hit of a multi-hit move that connects with the opponent will get the untech benefit. Having said that, there are likely multi-hit moves in the game with special counterhit properties that circumvent this limitation. I haven't looked into it too much.
- Counter and High Counter appear to have no effect on hitstop.

#### Superflash and Screen Freeze:

- EX moves => 20f freeze (1f superflash + 19f freeze)
- CS => 40f freeze (1f superflash + 39f freeze)
- IW => ??f freeze
- superflash frame is throw invulnerable

#### Input Buffering

- input timers continue during frozen frames
- inputs are buffered for ~4f, to avoid dp on walk forward hadou, insert 4f of neutral

#### Fuzzy Protection

- This game has two distinct forms of fuzzy protection:
- - Rising overheads are not overheads. This means any aerial move that is normally an overhead will be treated as a mid until the character performing it reaches the apex of his or her jump. Notably, assaulting doesn't even allow characters to attack until they reach the apex of their jumps.
- - Characters who are holding down-back and get hit out of a move by rising 'overheads' (air normals that are normally overhead) will suffer drastically reduced damage. Any combo started from such a situation will do 50% or less of its usual damage. There is, however, no nerf to untech time in a combo started this way.
- - - (Note: this fuzzy protection appears to apply proration that scales down from about 40% starting on the second hit of the combo, all the way down to the lowest I've seen so far, at 27% on the last hit of a mid-length combo. It may not be a proration-based damage nerf.)
- - - This penalty applies to any aerial move that makes the character rise, even if it is performed during the falling portion of a jump. This is clearly seen with Eltnum's j.[C] against a down-backing opponent.
- - - This penalty can stack with the reduced assault normal proration and untech.

#### Crossup Protection

- This game has a system in place to protect players from very fast crossups.
- - Players can always block attacks by blocking in the direction away from the opponent's character.
- - - Blocking away from the direction the opponent's character is facing is a similar concept that works against everything except projectiles in certain cases (see below)
- - Players can always block away from the direction of an incoming attack (if a fireball is coming from behind, you can hold forward to block), as long as the attack is originating from that direction (see below).
- - Players in blockstun will automatically block the correct direction until they exit blockstun.
- Shielding acts as though players are in blockstun, and will allow crouching or standing players to block any crossups during the duration of the shield.
- Each projectile (and attack, technically) in the game has a 'direction of facing', which players can always block away from. However, points of origins for projectiles do not always align with their visual cues. Most projectiles in the game have their directions set whenever their player performs them. Seth's orbs and Carmine's puddle-spawned pinwheels, however, set their direction when they fire, likely because of their homing property.
- Players who are walking backwards prior to getting crossed up will have some amount of extended crossup protection against some moves.

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

- The game offers the ability to record dummies and have them play back when they recover from hitstun or blockstun, or after teching. This recording does not play on the first frame that a bot exits hitstun or blockstun.
- - The game spends 1 frame determining that the bot has returned to neutral (ie: exited hitstun/blockstun) before playing its recording, causing the recording to play on the second frame after the bot recovers from hitstun/blockstun.
- When counter/high counter is enabled, the game only assumes the first hit in a string of cancels that touches the dummy is a counterhit. This means that things like cancelling a 5A (CH) into a special that is slow enough to reset the combo counter will not provide a second counterhit for the reset. The player must actually return to neutral if they want to re-enable the counter/high counter mode.

#### Extra Info

- All aerial moves put players into a state of landing recovery (empty jumps do not). A normals have 2f recovery, B normals 3f, C normals 3f. Assault has 4f, assault normals have 2f. Air shield has 2f unless you land while shielding, which has 6f. Most special movement has its own landing recovery frames, but many can be cancelled into air normals for better recovery. Only the last air option performed before reaching the floor matters for landing recovery.

- Certain anti-air moves in the game have 'jump-in invulnerability,' meaning that any aerial move will whiff through the player doing the anti-air as long as that invuln is in effect. For example, Orie's 623A/B are anti-airs with jump-in invuln starting on frame 1, and her 3B anti-air normal has jump-in invuln starting from frame 5 or so. Not all characters have dedicated anti-air moves like these, though.

- Jump startup is between 4-6 frames (varies from character to character, with Waldstein having the slowest startup at 6 frames) and is throw invulnerable. Most of the cast has 4 frame startups. Hilda, Merkava, Carmine, and Gordeau have 5f jumps, while Waldstein has a 6f jump.

- Assault startup is 5 frames, and appears to be universally true. Assault startup is also throw invulnerable.

- Notably, assault startup can be kara-cancelled into throw within the first two frames, which allows players to have up to 2 frames of throw invuln before their throw occurs. While generally not very useful, it can be rather funny for a defender to invuln through a command throw and throw the attacker instead.

- Most specials can be cancelled directly in EX moves on whiff.

- All IWEXS are invulnerable during their startup to hits, but are only throw invuln on their first startup frame. They also lose all invuln after the initial hit, and can trade with projectiles during the period between the hit and the cinematic. Any trade will cause the IWEXS to prematurely end before dealing its damage.

- Some special moves in this game can gain new cancel properties based on what comes before them. It is unclear if this is a feature or a leftover from mechanics that are no longer in the game. See Yuzuriha's stance cancels and Byakuya's force function cancels(patched out), for example.

- Hitstop appears to be 8 frames for some A moves. I've seen hitstop go up to 12 frames in duration for some moves. Unsure if there are moves with even more or even less hitstop.

- After setting a default color for your character, it won't carry over into player lobbies.(patched out) If you switch places with another player in an online lobby, you will not have your default color equipped (instead, you'll have the previous player's color). However, if you simply move the cursor off of your character and then back to your character, it will equip your default color.

## Combos

Can I cancel beam into crystal?

combo from:

- 5A
tip:
close:

- 5A 5A
tip:
close:

- 5A 5A 5A
tip:
close:

- 2A
tip:
close:

- 2A 2A
tip:
close:

- 2A 2A 2A
tip:
close:

- Crystal high explosion
tip:
close:

- Crystal low explosion
tip:
close:

- 2C 5A
tip:
close:

- 2C no gateling
tip:
close:

- 2C counter no gateling
tip:
close:

- 5C
tip:
close:

- 5C counter
tip:
close:

- 5C counter no gateling
tip:
close:

- AA 5A
tip:
close:

- AA 5C
tip:
close:

- Assault B
tip:
close:

- Assault C
tip:
close:

- 66C orb
tip:
close:

- 66C FF
tip:
close:

- AA 66C
tip:
close:

How to charge partition blockstring into A/B drill

>>>>

## Raw data 1:

Move Abbreviations
[4]6X               →Stella
[6]4X               →Beam
[2]8X               →FK
[8]2X                →Drill
Button Hold      →Crystal (Standing Crystal: 5 Crystal, Crouching Crystal: 2 Crystal)
(h)                    →Hold (ex: j.B(h) means to do a j.B and keep holding B down.)
dl                     →Delay

This guide is made for people who have just started learning Vatista. As such, some combos might be made a bit suboptimal to keep the routes easy to swap between, so keep that in mind. And since this is aimed at beginner and intermediate players, we'll only cover the most common combo starters you'll use.

The first part includes an explanation of her combo theory, so feel free to skip it if you don't need it.

(Feel free to share and repost. If you have any questions or want something clarified, feel free to Tweet me at @crazy_lemonmilk)
[TL Note: In Japanese, preferably. If you have questions in English, the Vatista channel of the Under Night discord will probably help.]


Vatista typically ends combos in:

(etc.)>A Drill>(2C)>Crystal

For oki, start by practicing 2 Crystal>Meaty 5A Detonate.


[Here's where we get started!]

(etc.)>2C>5C>JAJBJC>land>JAJB(h)>A Drill>2 Crystal

Doing A Drill ender from your air combo is a common part of Vatista's combo routes. If you want to pick Vatista up and fight right away, mastering this will give you your first semblance of a real character. Even if you're used to Vatista, this is always a solid combo to go for if you're not sure which route to take.

Keep in mind that if your combo prorarates too heavily, you can be minus when performing your oki*, so you need to be able to make snap decisions, like cutting out some aerial moves when possible.
Getting used to this route's j.B(h)>A Drill part will make life easier, since 90% of Vatista's combos will follow that flow.

*By which I mean that 2 Crystal ender>Meaty 5A can lose to mashing. Specifically, Vatista's 5A is 6F while the fastest jabs are 5F, so if you're not +2 after a Crystal ender, you can get beaten out. Fortunately, all routes in this document are made to be plus after your ender.


[About Crystal Combos]

Mid-combo Crystal>Detonate routes are essential to Vatista's high damage combos.

<Sample>
(etc.)>2C>5C>dlJB(h)>dlA Drill>2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal>Detonate>JC(h)>A Drill>Crystal


This got real complicated real quick, so let's break this down into parts.

    Launcher (2C5C)
    Use your aerial combo to start a button hold and then A Drill (JBh>A Drill) *First bounce
    OTG into Crystal (2C>2 Crystal) *Second bounce
    OTG into detonate into another crystal that's detonated by the first one's explosion (2A2B Detonate>5 Crystal)
    Ender (JC>A Drill>Crystal)


I recommend learning this by practicing 1-2 and 3-5 separately. For reference, I posted a video of this combo on Twitter, so look at that for reference.

    2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal Detonate>JC(h)>A Drill>Crystal
    2C(h)>2 Crystal>2A>2B Detonate>2 Crystal>B Beam Detonate(h)>JA>A Drill>Crystal
    2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal


1 can be done even after heavy proration.
2 can be done when proration is a bit lighter, but if you want to be lazy with your combos, you can just forget about this for now.
3 can be done when proration is very light, such as off B starters or higher. This is the strongest route you can use, when you can use it. Also known as the Double Beam route.

If you can take 2 , you can also take 1 . If you can take 3 , you can take either 1 or 2 . So basically, if you can do 1 , you can go for a crystal combo, though you might be leaving some damage on the table. 2 doesn't even add that much more damage, so if you're practicing in order of importance, I'd recommend learning 1 > 3 > 2 .

Deciding on a combo route typically comes during the crystal part, the latter half of your combo. As such, you could say that one of Vatista's strengths is that combo decision is relatively easy with her. It boils down to Launcher>A Drill>Crystal combo based on accumulated proration OR skip the crystal route and go straight into an ender.

In addition, your methods of spending meter to increase your damage or ending in VO all happen after your second crystal, so it's easy to decide between them and a simple A Drill ender.

(Example)

    2nd Detonation>JA>A Drill>2 Crystal <Meterless Ender>
    2nd Detonation>JC>[8]FF>C Drill (before final FF hit) <100% Meter Damage Increase>
    2nd Detonation>IW/IWE <200% Meter Damage Increase>
    2nd Detonation> VO <VO Ender>


The combos themselves are difficult, but once you've got the muscle memory down, it's pretty easy to adapt them to whatever situation you find yourself in. Once you make it through the rough patch with this character, it's smooth sailing.
Next, we'll look into some combos from different starters. I hope you'll notice that all of the routes these combos use seem rather familiar...


Combo list will continue below. Prioritize the combos in bold.

*[A Starter]*

*A>(B)>2C>5C>dlJB(h)>dlA Drill>2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal Detonate>JC(h)>A Drill>Crystal*

Your A button is a common starter, so its heavy proration makes Crystal combos a bit more difficult. Adding (B) to your starter pushes your opponent further away (which can cause JB to whiff) as well as increases the proration, so it should be easier if you confirm off of A>2C whenever you can. For the record, you can get away with route 2 if you omit (B), but this guide is all about keeping it simple. Giving up on the Crystal combo and just doing Aerial>A Drill>Crystal is also an option. If you start the confirm with 2 2As, you should definitely give up on the Crystal combo.


5A>2C>2A Whiff>Dash 2A>JA>JB(h)>JC>Land 2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal Detonate>JC(h)>Aドリル>Crystal

A combo for when 5A hits at the tip. Being able to do the 2C>2A Whiff>Dash 2A pickup is useful, but you can put off practicing it until later. The Dash 2A OTG costs one of your bounces, so keep in mind that you can't do your typical A Drill>2C>2 Crystal route.

[DROP POINT]
5A>2C>2A Whiff>Dash 2A>JA>JB(h)>A Drill>2C>2 Crystal>2A
＜Doing 2C>2A Whiff > A Drill > 2C>2 Crystal will cost you 3 bounces, so the following 2A OTG won't connect.＞


5A(Antiair)>JA>JB(h)>A Drill> 2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal

5A Antiair starter. If you can confirm off of the first hit, you can go into 3 . Admittedly, this is less practical as an antiair and more as a punish on an opponent who blocks a projectile in the air. If you start with 5A5B, you'll have to do route 2.


*[B / C Starter]*
*B>2C>5C>dlJB(h)>dlA Drill> 2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal*

For any B starter or higher, you can go into route 3 for high damage.
If you include too many moves before your launcher or in your aerial, you should play it safe and pick route 1 or 2. Starting this with 2C will give something close to your maximum meterless damage, so it makes a good reversal punisher. There are other routes that do just a bit more, but it's like 50 extra damage, so you don't have to worry about it too much.


2B>2C>2A Whiff>Dash 2A>JA>JB>A Drill(h)>2C(h)>dl5B>2 Crystal>5A Detonate>2 Crystal>2C>B Beam Detonate>JA>A Drill>Crystal

A bit of an unusual Crystal combo off of a 2C>A Whiff>Dash 2A starter. It might be a bit difficult since the button holds are different from the rest of her combos, but being able to net a lot of damage off of the tip of a poke like 2C is important. If it's too difficult, you can just use the 5A>2C>2A Whiff combo mentioned above instead. For reference, you can view a Twitter video of the combo here.


*[JB / JC Starter]*

*Assault JB/JC>5A>2C>5C>dlJB(h)>dlA Drill>2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal Detonate>JC(h)>A Drill>Crystal*

Your A starter combo is also your Assault starter combo. Except the proration on an assault starter is even heavier than what it is on an A starter, so don't push it if you're not used to it. 2C can connect from an Assault JC without 5A, so if you can hit confirm it, it's best to drop it to make the combo easier.


*(Assault JBch / Shield break)or(JCch/ Normal JC)*
*>5A>2C>5C>dlJB(h)>dlA Drill>2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal*

When your Assault JB breaks their crouching shield, your Assault JB/JC counter hits, or you just do a regular JC, you can go right into route 3 for big damage. Make sure you don't use the damaging route on regular Assault starters!

[DROP POINT]
Assault JB/JC>5A>2C>5C>dlJB(h)>dlA Drill>2C(h)>2 Crystal>2A>A Beam Detonate
＜The proration is too heavy for A Beam Detonate to connect, allowing your opponent to tech out.＞

*Assault JB / JC(Air Hit)>5A>JA>JB(h)>A Drill>2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal Detonate>JC(h)>A Drill>Crystal*

If an Assault attack tags your opponent in the air, you can pick them back up with 5A for a Crystal combo. On counter hit or an air-to-air from a regular jump, you can use route 3 for big damage. JC is a good button to put in your opponent's face after an Assault or regular jump, so it's best to get used to how to confirm between aerial hits and counter hits.

*【66B Starter】*

66Bch>Microdash 5A>2C>5C>dlJB(h)>dlA Drill> 2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal

66B knocks an opponent on their butt on counter hit, which you can combo off of after a bit of a dash. If you're confident, you can skip the 5A and just pick up with dash 2C.


*【66C Starter】*

*66C>2FF>2A>JA>JB(h)>JC> 2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal Detonate>JC(h)>A Drill>Crystal*

Knock them down with 2FF and pick them up into an aerial>Crystal combo. Don't rush the 2FF - wait until you're at point blank range before cancelling into it. 2FF>2A uses one of your bounces, so make sure you don't use A Drill!
[DROP POINT]
66C>2FF>2A>JA>JB(h)>A Drill>2C>2 Crystal>2A
＜2FF > Aドリル > 2C2 Crystal uses 3 bounces, so the following 2A won't connect.＞

～For Advanced Players～

66C>2FF>2A>JA>JB(h)>JC>Land 2C(h)>5 Crystal>2A>5B>B Beam Detonate> Dash 2 Crystal(h)>A Beam Detonate>JA>A Drill>Crystal

The high damage route from a 66C>2FF starter. It's difficult, but worth it if you plan to master Vatista.


*66C>(Crossup)A Stella>2C>5C>dlJB(h)>dlA Drill>2C(h)>2 Crystal>2A>2B Detonate>2 Crystal>B Beam Detonate(h)>JA>A Drill>Crystal*

If you cross up with 66C, you can cancel into A Stella>2C for even more damage than the aforementioned 2FF routes. To do it, do a 66C while holding the final 6. Once you've crossed up, move to what used to be 4 and press A for a crossup Stella.

*66C(Air hit)>5A>JA>JB(h)>A Drill>2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal*

66C has a large upwards hitbox, so you'll catch jumping opponents with it more often than you might expect. You can pick up with 5A and go into the Double Beam route for high damage.


【2FF Starter】

Close 2FF>2A>JA>JB>A Drill(h)>2C(h)>dl5B>2 Crystal>5A Detonate>2 Crystal>2C>B Beam Detonate>JA>A Drill>Crystal

Just like 2C>2A whiff, this starter costs one of your bounces, so you'll need to use that unusual Crystal combo from before. If it's too difficult, you can swap in the JAJBJC>Land 2C>2 Crystal route as well.
【Crystal Detonation Starter】


*Crystal Detonation>5A>JA>JB(h)>Aドリル>2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal Detonate>JC(h)>A Drill>Crystal*

A route for combos that start in a Crystal explosion, such as when opponents try to mash out of 2 Crystal>5A oki. While the proration might be light, Route 1 is the only combo that will connect here. Crystal detonations have same move proration that drastically reduces the untech time after the first explosion, so B Beam detonations found in routes 2 and 3 won't connect. This doesn't just apply to detonation starters - if you happen to detonate a crystal anywhere in your combo, only route 1 will work, so be careful.

[DROP POINT]
Crystal Detonation>5A>JA>JB(h)>A Drill>2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>B Beam
＜Your second explosion is used up by the time you reach A Beam Detonate, so your opponent will be able to tech high in the air where B Beam won't connect.＞

～STEP UP～

(Corner)Crystal Detonation>5C>JB(h)>A Drill>2C>A Stella>2C(h)>2 Crystal>2A>2B(1) Detonate>5 Crystal Detonate>JC(h)>A Drill>Crystal

5C>JB(h) off of a detonation starter will do more damage anywhere on the screen. It's the same for JC air-to-airs, so if you're confident in your confirms, skip 5A and pick up with 5C instead.

Also, when you're in the corner, you can slip in a 2C>A Stella after the A Drill. It's hard since it requires you to start charging in the opposite direction as to what you're used to, but it does increase your damage. A good route to learn once you're used to your base combos.
*【B Drill Starter】*

*B Drill>66C>5A>JA>JB>JC>Land JA>JB(h)>A Drill>2C>Crystal*

A midscreen B Drill combo. It's easy and pretty much all you need to know about midscreen B drill. It's possible for this to drop if you don't microdash before the 66C or the 5A, so keep that in mind. You've got one more bounce, so end with 2C>Crystal. It leaves you at much more advantage than the A Drill>Crystal ender. Don't try to pick up with 2A into a Crystal combo!

[DROP POINT]
B Drill>66C>5A>JA>JB(h)>A Drill>2C>2 Crystal>2A
＜B Drill>A Drill>2C2 Crystal uses three bounces, so 2A won't connect.＞


*(Corner)B Drill(h)>2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal*

A corner combo from B Drill. As you can tell by the font color, it's your same old Crystal combo.

As an aside, B Drill is minus enough on block that certain characters can punish with B moves. However, you can react to their block and cancel into C Beam to turn make yourself +7 at the cost of some meter. As such, it's strongly recommended that you always hold forward whenever you do B Drill. On hit, your forward charge leaves you ready for your mid-combo A Beam, and you can make yourself safe with C Beam on block.


*【B FK Starter】*

*B FK>cs>*
     *1) Assault dlJC>Land JA>JB(h)>dlA Drill>2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal*
     *2) Assault dlJA>JC>Land JB(h)>dlA Drill>2C(h)>2 Crystal>2A>A Beam Detonate>2 Crystal>(2C)>B Beam Detonate(h)>JA>A Drill>Crystal*

If you CS before the final hit of B Flash Kick slams your opponent to the ground, you can Assault for a full combo. The pickup has a bit of a timing to it, but there's not much difference in damage between the two given here, so just pick whichever is easier to do. You can find a Twitter video of the combo [here](https://twitter.com/crazy_lemonmilk/status/896269714686590976).

>>>>

## Raw data 2:

Vatista has relatively few optimal combo routes, but many ways to reach them - you don't need to take screen position into account so much as you do starters/hitstun proration.

Vatista's combos will generally follow a Starter > Aerial > Landing > Ender pattern. Familiarize yourself with her various routes so you can switch mid-combo when necessary.
Combo Starters

These starters all take the place of 2C > 5C in the above 2C combo.

5A/2A > 2C > 5C

    Hey, it's what we know and love. Just make sure you don't use 5/2B in between 5/2A and 2C.

5B/2B > 2C > 5C

    If you're careful that these don't whiff, they work great. 5[B] also works as a blockstring starter - 5[B] > 2C > 5C gives you time to confirm if you want to jC 5C on hit or release a Fragmentum on block. Alternatively, Reverse Beat to 5A, 5B (assuming you started 2B), 5AA (if you're close), etc.

j.B/j.C > 2C > 5C

    Jump-ins. What else can you say? If you use these off of an Assault, you'll need to use the j.B > (j.A >) [8]2A aerial route to get a Fragmentum combo.

66C > [4]6A > 2C > 5C

    If you hold 6 during all of 66C, it'll become a 4 on crossup and give you a [4]6A. Unprepared opponents may also block the 66C and not expect the crossed up [4]6A, still granting you the combo. If you don't cross up, you can burn Vorpal with 66C > FF > CS > 5C.

5C > FF > CS > 5C

    Useful if Vatista is too far away for 2C to punish in time, you want to CS for some meter, or you just weren't expecting to start with 5C. 5C > 2C > 5B can work for the latter as well if you don't have CS. 5C > 2C > FF > CS > Aerial will do slightly more damage, but works at shorter distances.

66B (ch) > 2C > 5C

    66B knocks the opponent down on counterhit, meaning you can follow up with this.

Aerial Routes

These all come after 5C in the standard Fragmentum combo and are more or less replaceable.

j.[B] > j.C > [8]2A

    Basic air combo. Works.

j.[B] > j.C > land > j.A > [8]2A

    The land > jA is important here in increasing the range at which Vatista can hit with [8]2A, thereby increasing the range at which she can combo from. Allows you to get more hits out of j.C and [8]2A, so it arguably does the most damage, too.

j.[B] > [8]2A

    Useful if you're worried about your hitstun proration - it lets you land full Fragment combos off of Assault j.B or j.C and is essential for reaching the double laser landing route explained further down. Fairly hard to pull off though, since the j.[B] must be done as late as possible on top of requiring you to charge [8] during the startup of 5C. You can use j.[B] > j.A > [8]2A or j.A > j.[B] > [8]2A for a bit more leniency on the timing with little apparent change to the hitstun proration.

j.A > j.B > j.C > land > j.A > j.B > [8]2A

    Yeah, she can still do this. You won't be able to get a Fragment combo off of this, though. You'll usually go for this off of 5A anti-air, like in the [8]2B > 66C > 5A combo.

j.C > land > j.A > j.[B] > [8]2A

    Only usable when j.C is done on the falling portion of Vatista's jump, and as such isn't usable off of your standard starters. It is usable for routes involving aerial CS ([2]8B > CS, FF > CS) as well as random j.C hits against airborne opponents. In the latter case, you may be better off using j.C > 5C > j.A > j.B > [8]2A to ensure it hits against opponents low to the ground for similar damage.

Landing Routes

The all are assumed to come after an aerial [8]2A. Any combo with 2]B[ assumes that you were already holding B before entering this route.

2A / 2C > 2B

    Basic landing route that can't lead into anything other than [2]8X. Based on your combo's proration, 2C may drop, requiring you to use 2A instead.

2[C] > 2]B[ > 2A > 2B > 2]C[ > [6]4B

    The standard Fragmentum landing route. Get familiar with this, as this route is essential to reaching Vatista's optimal damage output.

2[C] > 2]B[ > 2A > 2B > 2]C[

    Same as the above, but time the 2]C[ release such that the second Fragmentum is popped by the first's explosion. Used primarily when you open with a Fragmentum, but also useful when one of your combos happens to run through a Fragmentum you previously set up.

2[C] > 2]B[ > 2A > [6]4A > 2]C[ > [6]4A/B

    The double laser route - it does slightly more damage, but it's a bit more difficult to pull off both in terms of execution and proration - there's a larger gap between 2A > [6]4A than 2A > 2B, so hitstun proration makes this combo impossible sooner than the single laser variant. To reach this route, you'll need to use a good starter and either the j.B > (j.A >) [8]2A or j.C > land > j.A > j.B aerial routes.

Combo Finishers

[2]8B / [2]8C

    [2]8B midscreen downs the opponent far away, but allows you enough time to set up a projectile, Fragmentum or Assault to gain GRD. [2]8 midscreen leaves the opponent about 1.5 character lengths away with much less time to set up anything. [2]8B in the corner puts Vatista at a perfect distance to start the repeated Fragmentum string, or just general Fragmentum oki. [2]8C in the corner puts you almost point blank to the opponent with little time to set up.

j.C > FF > [8]2C

    Usable in combos after an opponent has been hit by the second (or more) Fragmentum. Holding [8] during FF drags the opponent upward, letting you get more hits out of [8]2C. It (usually) does more damage than a [2]8C ender, but keep in mind that if this is ending a full combo, the wall slam will almost always be impossible to combo from - that is, if they don't tech out before [8]2C's final hit (you're safe either way).

j.C > [8]2A

    Any aerial sequence (jC jB jA, jB jC, etc.) into A drill after a second Fragmentum more or less works. A meterless ender that does similar/slightly more damage than [2]8B and ends with better oki positioning midscreen. Generally a 2]B[ or 2]C[ crystal is released after the A drill, but keep in mind that like all Frag setups midscreen, backtech avoids everything.

Basic Combos

    5A > 5B > 2C > 5C > j.B > j.C > [8]2A > 2C > 2B > [2]8B (2537)

        Basic ground combo that gets you used to [8]2A and 2C OTG. Still a useful route to go to later on if you feel your starter has prorated your combo too much (Assault, especially).

    5A > 5B > 2C > 5C > j.[B] > j.C > [8]2A > 2C > 2]B[ > [2]8B (2693)

        Slightly stronger and more complicated ground combo. Uses a single Fragment to get you used to comboing with them.

    5A (anti-air) > j.A > j.B > j.C > land > j.A > j.B > j.C > [8]2A > 2C > 2B > [2]8B (2215)

        Basic anti-air combo that gets you used to j.C > land > j.A. Can connect off of many other moves, such as anti-air 66B/66C. You may need to replace 2C > 2B with 2A if used in a longer combo due to proration.

Midscreen Combos

Damage values indicate base damage. "+" values indicate bonus damage from Vorpal (CS combos only). Note that slight changes in timing can change the amount of hits your moves do, so expect values to vary in practice.

2C

    (2A/ 5B/ j.B/ j.C >) 2C > 5C > j.[B] > j.C > land > j.A > [8]2A > 2[C] > 2]B[ > 2A > 2B > 2]C[ > [6]4B > ([2]8B (3240) / [2]8C (4059) / j.C > [8]2A (3308) / j.C > FF > [8]2C (4075))

        The standard Fragment combo. The button holding required to use Fragments mid-combo may seem difficult, but they're no big deal once you get the motions into your muscle memory. The 2C and 2A OTGs are a little strict, however - hitstun proration can ruin this combo easily if you're not careful with your starter or don't get a counter-hit (though the j.[B] > [8]2A aerial route will make up for the former). Still, there are a LOT of starters not listed that can get to this route. The damage for [2]8B/C assumes you do it after [6]4B - it's difficult, but you can swap it for 2B instead for less damage.

    (5B >) 2C > 5C > 5FF(whiff) > 9FF > CS > j.C > land > j.A > j.[B] > [8]2A > 2[C] > 2]B[ > 2A > [6]4A > 2]C[ > [6]4A > ([2]8B (3973+162) / [2]8C (4923+162) / j.C > [8]2A (4040+162) / j.C > FF > [8]2C (4796+162))

        A CS version. The trick is to whiff the grounded 5FF, but hold 9 to make the second (airborne) portion hit. This uses the double laser landing route for additional damage.

Fragmentum

    Explosion > 5C > j.[B] > j.C > land > j.A > [8]2A > 2[C] > 2]B[ > 2A > 2B > 2]C[ > ([2]8B (3171) / [2]8C (4127) / j.C > [8]2A (3262))

        Standard Fragment combo that takes into account the fact that the opponent will tech after the first mid-combo Fragment by releasing the second mid-combo Fragment before they're knocked out of the first one's explosion. For the jC > [8]2A ender, you need to time the second Fragment's so it explodes from the first one's explosion - for either [2]8 ender, you can get away with being a little late since the Flash Kick will pop it.

[8]2B All damage values assume the drill portion of [8]2B hits only once before the kick, as an instant overhead should.

    [8]2B > 66C > 5A > j.A > j.B > j.C > land > j.A > j.B > [8]2A > 2C > 2B > [2]8B (2629) / [2]8C (3240)

        Standard meterless combo from 66C. Hitstun proration makes 2C > 2B a bit difficult to connect from [8]2A, so you can use 2A instead.

    [8]2B > 66C > FF > CS > j.C > land > j.A > j.B > [8]2A > 2C > 2B > [2]8B (2895+174) / [2]8C (3506+174)

        A CS conversion for 0/100% bar.

[2]8B

    [2]8B > CS > 66 (delay) j.C > land > j.A > j.[B] > [8]2A > 2[C] > 2]B[ > 2A > [6]4A > 2]C[ > [6]4A > ([2]8B (3644+152) / [2]8C (4416+152) / j.C > [8]2A (3629+152) / j.C > FF > [8]2C (4385+152))

        Yes, Vatista can combo off of Flash Kick with CS. You'll need to delay the j.C after the CS > 66 to let j.A hit.

Corner Combos

[8]2B

    [8]2[B] > 2[C] > 2]B[ > 2A > 2B > 2]C[ > [6]4B > j.C ([8]2A (2780) / FF > [8]2C (3388))

        Her standard Fragmentum route, but now in the corner. Just be sure to hold [B] from the beginning. 2C will whiff on Akatsuki, Byakuya, and Chaos.
        
## Raw data 3

Vatista Combo Guide Video (Meterless)
Original video (Youtube)
Original Video (Niconico)

(0:03)
Hello. I had planned to make a combo theory video after the last national tournament, but I got distracted by thinking about Lily Hoshikawa. This video will mostly focus on combos that I personally use.

(0:10)
As the name suggests, this video focuses on meterless combos, but I’ll start with some general knowledge before we get to the combos. This video assumes some general familiarity with fighting game terminology, but if there’s anything you don’t understand, feel free to ask. [TL Note: If you speak Japanese, that is. If English is your primary language, please ask English-language players instead, such as the ones in the UNIST discord.]

Changes
(0:24)
There have been a number of balance changes with the console release of [st], but the most important ones are the increase to 2C's hitbox size and the change to 2FF's frame advantage [TL Note: Or in our case, the mere addition of it as a move.].

(0:32)
2C Changes
2C’s hitbox was raised in a way that doesn't really affect her neutral game, but it makes routes that used to be character specific (such as corner B drill > 2C) universal, makes 2C pickup routes more stable, and even gives her access to some new routes altogether.

(0:53)
2FF Changes
2FF’s recovery was reduced from the previous arcade version, making it -3 on block and allowing you to combo from a raw hit with no resources. That second one means you can now combo from a 66C hit even when you can’t cancel into A orb.


Combo Enders
(1:10)
Next, I’ll introduce her combo enders.

(1:14)
A Drill Ender
Her classic combo ender. Ends in a knockdown and even lets you set up a gem at frame advantage if you mind your proration. Just like always, she can pick up with 2C after the first gem explosion for more better damage and stability.

(1:24)
2C Ender
This is another classic ender, but the increase to 2C’s hitbox size means she now has more routes that can end with a 2C knockdown. For example:
Explosion > 2 gem > 2C delay 5B(1hit) 5 gem > delay 2C gem
You can go into that ender from just about any route. [TL Note: See combo at 4:06 for this example]
(1:34)
That said, keep in mind that it’s slightly more difficult on characters whose hurtboxes don’t reach low enough. Also, they can air tech and punish you if your combo prorates too highly.
(1:43)
You can also set two gems instead of one after a 2C ender, or even 2C > jump cancel > air gem set if you haven’t used your jump cancel yet.

(2:00)
Satellus Ender
A viable ender as of [st]. If your combo hasn’t prorated much, you can pop the opponent up and get a lot of frame advantage. But if it has, your opponent will air tech and be at advantage. Try to avoid using 5B, 2B, 5C, or your jump normals more than once when going for this ender.

(2:21)
j.[FF] Ender
With the buffs to C Orb, you can end with j.[FF] cancelled into C Orb, mostly in the corner. 2C > [6]4B > 5FF into j.[FF] > j.[4]6C would be the way to go. You can also link an FF after Satellus to build more meter, though it’s a bit more difficult to pull off.
(2:31)
You can do an air C Stella right after a Satellus ender, too. Go for the j.[FF] ender alone if you want damage, and use either the Satellus > j.[4]6C or Satellus > j.[FF] enders if you want to build meter.
Just remember that you’re in trouble if you drop any of them.

(2:42)
VO Ender
A combo ender that uses a universal mechanic to strip an opponent’s vorpal. Vatista can fit in a VO at the very end of her combo, so keep her damage untouched and end in VO, [6]4B Explosion > VO, 66B Explosion > VO, or Explosion > Gem set Explosion > VO.
(3:03)
In the corner, you can rack up damage and end in VO while still leaving a gem set for oki.

(3:15)
That about covers enders. They all have their strengths and weaknesses, so just choose based on what kind of oki you want to do and what the proration on your combo will let you get away with.


Combos
(3:21)
Now we get to the combos. I’ll mainly focus on the new routes she has in [st], which largely consist of Satellus ender routes and a few 2C ender/VO ender routes. The previous explanation covered just about everything you need to know about A drill enders and jFF enders, so I’ll omit them here.
(3:28)
The following combos are mainly the ones I personally use, so I can’t promise that they’re optimal. Please keep that in mind.
[TL Note: This translation has added button holds to the original combo notations, but you can also view the input history in the video for reference.]

(3:36)
5A 2C 5C > j.[B] j.[8]2A > 2[C] 2]B[ > 2A 5[A] 2]C[~[C] > 5[B](1)/2[B](1) 5]A[ > ]C[ (Satellus) > ]B[
Starter: A
Midscreen
Practicality: ☆☆☆
Given the air combo, you should be fine fitting in a B normal, just make sure you don’t use the same one that you’ll use to detonate the second gem. Avoiding same move proration gives you a real knockdown and keeps damage high. Incidentally, if you didn’t use a B normal in your confirm, you can get a side switch by using 2A 5[A] 2]C[~[C] > Dash > 5[B] as your ground combo.

(3:46)
2AA 2C 5C > j.A [8]2[A] > 2[C] 2]A[ > 2A 5[A] 2]C[~[C] > 5[B](1)/2[B](1) 5]A[ > ]C[ (Satellus) > ]B[
Starter: AA
Midscreen
Practicality: ☆
A Satellus ender with two A starters. That said, it’s basically the previous combo with j.B switched for j.A. j.A has a lighter proration than j.B, so it’s useful for times like these.

(3:56)
2AAA 2C 5B > j.[B] j.[8]2A > 2[C] 2]B[~[B] > 2A 5[A] 2]C[~[C] > 2]B[~[B] > 5A ]C[ (Satellus) > ]B[
Starter: AAA
Midscreen
Practicality: 
A route that uses A three whole times. I completely forgot about this one, so it still hasn’t seen any use in a fight. Since all those 2As will push the opponent away, you’ll need to launch with something other than 5C.

(4:06)
Assault j.C > 2C 5C > j.[B] j.[8]2A > 2[C] 2]B[ > 2[A] 2B 2]C[ > 2C delay 5[B](1) 5]A[ > delay 2C ]B[
Starter: Assault j.C
Midscreen/Corner
Practicality: ☆☆☆
Assault starters prorate pretty heavily, so there’s no need to force a Satellus ender out of them. Keep it simple and do a 2C gem set ender. This route is a good backup for other high proration starters or awkward confirms, so do a 2C ender for those as well.

(4:15)
Assault j.B > 5A 2C 5C > j.A [8]2[A] > 2[C] 2]A[ > 2[A] 2B 2]C[ > 2C delay 5[B](1) 5]A[ > delay 2C ]B[
Starter: Assault j.B
Midscreen/Corner
Practicality: ☆
Vatista will rarely get a hit starting from her assault j.B, but if she does, you’ll want to use j.A in your combo instead of j.B to avoid same move proration.

(4: 23)
A 2C 2B > j.[B] j.C land j.A j.[8]2A > 2[C] 2]B[ >2A 5[A] 2]C[ > 2C delay 5[B](1hit) 5]A[ > delay 2C ]B[
Start: 5A/2A Tip
Midscreen
Practicality: ☆☆
If you follow a hit with the edge of 2A with 2C, there are times when the 2C gets blocked even after your 2A hits. As such, I can’t recommend keeping that starter in your muscle memory, but I admit that I do it fairly often myself. You won’t find many practical starters that prorate more heavily than the one this combo uses, so if you’re ever midscreen and unsure of your route, just pick this one and end with 2C.

(4:33)
A 2C 5C > j.[B] j.[8]2A > 2[C] 2]B[ > 2[A] 5[B] 2]C[ > 2]A[ > 5[A] ]B[ (Satellus) > ]A[
Start: 5A/2A
Corner
Practicality: ☆☆
A Satellus corner route from an A starter. The 2 gem > 2A > 5A route whiffs in the corner, so use this instead.

(4:43)
AA 2C 5C > j.A [8]2[A] > 2[C] 2]A[ > 2[A] 5[B] 2]C[ > 2]A[ > 5[A] ]B[ (Satellus) > ]A[
Start: 5AA/2AA
Corner
Practicality: ☆
Just like the midscreen version, you need to switch j.B with j.A to keep your proration light when you start with two A normals.

(4:52)
AAA 2C delay 5[B] > delay j.C > 2[C] 2]B[ > 2[A] 2[B] 2]C[ > 2]A[ > 5[A] ]B[ (Satellus) > ]A[
Start: 5AAA/2AAA
Corner
Practicality: 
I don’t use this myself, but I may as well put this here while we’re introducing routes. If you find yourself landing this starter, you might want to play it safe and just go for a 2C or FF ender.

(5:01)
2C 5C > j.[B] j.[8]2A > 2[C] 2]B[ > 2A [6]4[A] > 2]C[~[C] > 5[B](1hit)/2[B](1hit) 5]A[ > ]C[ (Satellus) > ]B[
Start: 2C
Midscreen/Corner
Practicality: ☆☆☆
Combo from a normal 2C starter. B normals, C normals, and jump normals all have fairly light proration, so you can fit in a laser and a Satellus ender after starting from them.

(5:10)
2C(ch) 5C > j.[B] j.[8]2A > 2[C] 5]B[ > 2[A] 5B [6]4[B] > dash 2]C[ > 2[C] 2[B](1hit) 2]A[ > dash ]C[ (Satellus) > ]B[
Start: 2C counter hit
Midscreen/Corner
Practicality: ☆☆☆
A route for when 2C counter hits. Use it for punishing DPs or beating option selects/mashes.

(5:21)
5B 2C 5C > j.[B] j.[8]2A > 2[C] 2]B[ > 2A [6]4[A] > 2]C[ > 2[C] 5[B](1hit)/2[B](1hit) 2]A[ >]C[ (Satellus) > dash ]B[
Start: 2B/5B
Midscreen/Corner
Practicality: ☆☆☆
B starters have slightly more proration than 2C, so we add in a 2C pickup after the first gem explosion. If you find yourself using a B normal when confirming off of a 2C counter hit starter, go into this route.

(5:32)
Explosion > 2C 5C > j.[B]/j.A j.[8]2A >  2[C] 2]B[ > 2[A] 2[B](1hit)/5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
Start: 5A Explosion
Midscreen
Practicality: ☆☆☆
Use 2B for starters with heavy proration like A normals, and use 5B for starters with lighter proration. You can also switch in j.B for j.A when you start a combo with j.B > explosion or B drill > explosion to avoid same move proration. For the Satellus after the chain explosions, keep in mind that your opponent will be shot upwards if you’re too slow, so try to hit that as soon as possible.

(5:42)
5A Explosion > 2C 5C > delay j.[B] delay j.C >  2[C] 2]B[ > 2[A] 2[B](1hit)/5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
Start: 5A Explosion
Corner
Practicality: ☆☆
Your opponent is much closer to you in a corner combo than they would be midscreen, so your midscreen route would cause them to launch away before your Satellus could activate. Use this corner route instead.

(5:50)
Explosion > 2C 5C > j.[B]/j.A j.[8]2A > 2C [4]6A > 2[C] 2]B[ > 2[A] 2[B](1hit)/5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
Start: j.A Explosion
Corner
Practicality: ☆☆☆
If you cause an explosion with any normal with lighter proration than an A normal (including, but not limited to, j.A), then use this route. Just like with the midscreen route, you’ll need to swap j.B with j.A for B drill or j.B explosion starters.

(6:01)
5C Explosion > j[AB] > j.[8]2A > 2C [4]6A > 2C 5B > j.A j.[B] j.C > 2[C] 2]B[ > 2[A] 5[B](1hit) 2]C[ > ]A[ (Satellus) > ]B[
Start: 5C Explosion
Corner
Practicality: ☆
If you immediately use your jump cancel after a raw 5C explosion hit, you can get a lot of damage from an A drill done from high in the air. Leave it for guaranteed punishes, though. Keep in mind that if your opponent isn’t between you and the gem, the explosion’s knockback will causes A drill to whiff.

(6:11)
[8]2B > delay 66C > dash 5A > j.A j.[B] j.C > dash 2[C] 2]B[ > 2A 5[A] 2]C[~[C] > 5[B](1hit) 5]A[ > ]C[ (Satellus) > ]B[
Start: [8]2B
Midscreen
Practicality: ☆
As of [st], Vatista can connect 2C after an air combo from B drill starters. Basically, you want to delay your jump normals to keep your opponent from rising too high… though that’s much easier said than done. This combo’s difficulty can vary wildly based on your opponent’s character and whiffing the 2C pickup puts you in a very unfavorable position, so if you don’t want to take the risk, stick with the classic double air combo route into 2C.

(6:22)
[8]2[B] > 2[C] 5]B[ > 2[A] 5B [6]4[B] > 2]C[ > 2[C] 2[B](1hit) 2]A[ > ]C[ (Satellus) > ]B[
Start: [8]2B
Corner
Practicality: ☆☆☆
Nothing special here.

(6:31)
2C Aw > dash 2A > j.A j.B [8]2[A] > 2[C] delay 5B 2]A[ > 5[A] 2]C[ > 2[C] 2[B](1hit)/5[B](1hit) 2]A[ > ]C[ (Satellus) > ]B[
Start: Edge of 2C/2B
Midscreen/Corner
Practicality: ☆☆☆
Comboing from 2C > A whiff > Dash > 2A as a starter already costs one of your ground bounces. You should use this route for 2FF or 66C > 2FF starters, too.

(6:41)
2C 5C > j.[B] j.[8]2A > 2[C] 2]B[~[B] > 2A [6]4[A] > 2 ]C[ > 66[C] 5]A[ > ]B[ (Satellus) > ]C[
Start: 2C
Corner (Facing away)
Practicality: ☆☆
To get a side switch, use 66C into chain explosions instead of B normals. If you can remember to 66C and the microdash 5B brought up earlier in your Satellus route, you’ll be fine.

(6:50)
66C 2FF > 2A > j.A j.[B] j.C > 2[C] 2]B[ > 2[A] 2B 2]C[~[C] > 5[B](1hit) 5]A[ > ]C[ (Satellus) > ]B[
Start: 66C
Midscreen/Corner
Practicality: ☆☆
This combo already comes off of a starter that costs a ground bounce, but if proration gets any dicier than that, just go into a typical crystal combo after 2C.

(7:00)
66C [4]6A > 2C 5C > j.[B] j.[8]2A > 2[C] 5]B[ > 2[A] 5B [6]4[B] > dash 2]C[ > 2C delay 2[B](1hit) 2]A[ > delay 2C ]B[
Start: 66C
Midscreen
Practicality: ☆☆
If you connect A orb after a 66C, you should go into the B laser route into 2C ender to get damage and maintain advantage.

(7:12)
5A 2C 5C > j.B j.[8]2A > 2C [4]6[A] > 2[C] delay 2BB 5]A[ > 5BB 2]C[ > walk back VO
Start: A Normal
Corner
Practicality:
A VO ender combo that leaves up a crystal. You can go straight for this route from even high proration starters like j.C. You just need to walk back for a moment. The crystal set > VO ender is something I only found recently so I haven’t done it in a match yet, but the route itself should be fine.

(7:23)
2C 5C > j.B j.[8]2A > 2C [4]6[A] > 2[C] delay 2BB 5]A[ > 5B [6]4B > 2]C[ > walk back VO
Start: 2C
Corner
Practicality:
Try not to leave too much of a delay between 2B > 2BB and 5B > [6]4B. This combo gets a bit less stable once you add in the B laser, so if you want something consistent, stick with the A starter route and use 5BB instead.

(7:33)
B 2C 5C > j.[B] j.[8]2A > 2C [4]6[A] > 2[C] 5]B[ > 2A 5B [6]4B > 2]C[ > walk back VO
Start: B Normal
Corner
Practicality:
The 2C starter route for this already uses all available B normals, so if you happen to use a B normal before you enter your air combo, your opponent will tech before your VO can hit. In that case, use either the 5A starter route or this one.

## Raw 3

This serves as an introduction to charge partitioning as it applies to Vatista in Under Night In-Birth Exe:Late[st]. I will explain what this technique is and how it works. Then I will give some examples of how you can use partitioning with Vatista.

I hope this guide will answer questions you may have about charge partitioning in Under Night. If you have any questions you can contact me on Twitter @boruphen or just ping me in the Discord. Feel free to offer suggestions to improve this guide, too.

Let's get started.

[Jan 26, 2019 Update: Added short demonstrations of charge partitioning for flash kick, lumen stella, beam, and drills.]

Do you need to understand charge partitioning to play Vatista?
You do not! Charge partitioning allows you to do many things, but only relatively few are practical. Partitioned B.drill set ups are good, but you can still do very well without them. It’s better to be as comfortable with Vatista’s combos, pressure, block strings, crystals, etc. as possible before moving on to charge partitioning. 

Once you have the fundamentals down, charge partitioning is a way that you can make things complicated all over again.

#### What is charge partitioning?
Charge partitioning is when you split a move's charge time into multiple parts or partitions. This technique exists in various fighting games such as Street Fighter III: Third Strike and Under Night In-Birth Exe:Late[st]. With this technique, you can do a lot of things you could not do otherwise. For example, you can do dash > flash kick, double laser or fireball, and B.drill set ups (these will be discussed in detail later).

Note: Charge partitioning is not to be confused with charge buffering, which is a technique that lets you begin charging again immediately after inputting the special move (i.e. [4] 6 [4]A). 

#### How does charge partitioning work?
Charge partitioning works because there is a duration of time during which you can keep your charge without holding in the direction you have to charge. This is allows you to do things like charge [2], 5B > 8B (flash kick) and down-back, st.lp x headbutt. You can also use this window to break your charge time into partitions. So you can charge, return stick to neutral, then quickly continue charging to segment your charge into two partitions. As long as the sum of your partitions does not exceed a time limit — as long as you don’t overcharge — you will be able to perform the move as you normally would.

#### How does charge partitioning work in UNIST?
In UNIST, the charge input for a special move can be split into no more than 4 partitions. This is why Vatista no longer has her machine gun mode like in Exe:Late. Partitions can be separated by no more than 11 frames. Once you stop charging for more than 10 frames, you will lose all charge you had accumulated.

You will overcharge if the total charge across your current partitions goes over 10 + required charge. For example, say you charge 33 frames, break for 9 frames, then charge for another 33 frames. You would overcharge since the total charge is 66 frames, so your fireball/laser/flashkick won’t come out.

When you perform a special move using charge partitioning, it seems like your first partition is consumed while you maintain the charge of your other partitions. This is what allows you to do double lumen or double beam. You charge the first lumen in two parts, then you charge a third part during animation of the first lumen. You use the charge of the first and second partitions to do lumen 1, and your first partition is consumed. Then you use your second and third partitions for lumen 2.

Note that the animation of your special moves will affect your partitions. I will give an example of this. You need to charge 53 frames to be able to do [4]6A (Lumen Stella). You are allowed to overcharge by about 10 frames. So on paper you could have your partitions like 27 + 27 + 27. The problem is that the overall animation for Lumen Stella is 39 frames. That puts you at risk of overcharging, so it’s better to charge it like 35 + 20 + 35.

Another thing that’s important to note is that Vatista’s special moves require different charge times.
Lumen Stella, Beam, Flash Kick – 53 frames
Dive Kick – 43 Frames
Gem Set – 61 frames (However, you cannot partition with gems.)

Waldstein has a charge move, but in UNIST he is no longer able to use charge partitioning. Sorry, Waldstein.

How do I actually do charge partitioning?
It might help to examine an example to get started. Let’s look at how you do double beam. I will go into great detail on how you can fire one A.beam followed immediately by another beam.

Double Beam clip

You’re going to want to be in training mode with input display turned on. You can use this to study your inputs and diagnose any problems you may experience.

The input for double beam can be simplified to [6] 5 [6] 4A [6] 4A. The timing for your charges ([6] inputs), in order, should be approximately 40 frames, 15 frames, 40 frames. Since the animation for A.beam lasts for 43 frames, we will use this animation to time our last 40 frame charge. That way we only have to manually time the first two charges.

What needs to happen for double beam to work:

    Sum of first two partitions is between 53-63 frames, inclusive. The last two partitions need to add up to 53-63 as well. This ensures that you have enough charge for your beam without overcharging.
    Breaks between partitions must be less than 11 frames.


If done correctly, you should shoot the second beam as soon as you recover from shooting the first. It should look like this video.

#### More examples of charge partitioning
It’s important to note that this section is in no way exhaustive since no one has seen all of what can be done with charge partitioning. I hope my explanations thus far have been good enough that you can understand how it works. That way, you will be able to recognize and learn from other players' set ups as well as create some of your own. 

This section will give a few examples of what Vatista can do with this technique. I’ll briefly describe each technique and how it is performed. These examples are listed in ascending order of both challenge and practicality.

Dashing Flash Kick clip
This may not be practical, but it sure is a thing you can do. You can partition your flash kick charge with a dash. You’ll probably want to use 4/6AB dash shortcut since it’s quicker. If you’re comfortable doing 44/66 during the 10 frame partition window, more power to you.

Input: [2] dash [2]8B

This is for hard reads only in my opinion, and maybe not even then. Partition timing depends on how far you want to dash with your flash kick. More charge before dash means less during the dash and vice-versa. 

Double Lumen clip
Double Lumen is similar to the double beam that was discussed earlier.

Input: [4] 6 [4] 6A [4] 6A

The key difference between beam and lumen for our purposes is the animation time. A.Lumen’s animation is slightly shorter (39 frames vs 43), so I like to split my charge like 35 20 35. This is the most consistent way I’ve found to do it, but you might find a timing that works better for you.

A.drill > 2.gem > B.drill clip
B.drill partitions are probably the most practical use of charge partitioning. They’re also pretty difficult. This is a set up that you can use any time you do A.drill 2.gem ender.

Input: ... [8]2A [8] 2.gem [8]2B. 

A tip for this one is to not start charging [8] again until closer to the end of the A.drill. If you start charging [8] as soon as you input the A.drill, you will almost always overcharge. 2.gem takes 26 frames total, leaving at minimum 17 frames to charge before setting the gem (17 + 26 = 43). You want the part charged during A.drill to be between 17-27 frames, so take advantage of the input display until you internalize the timing.


More testing could be done on the timing requirements. The time between partitions has to be < 11 frames. The allowed overcharge time is around 10 frames. It’s hard to test one that manually. The allowed overcharge time might vary depending on the move. Someone needs to have their robot friend test this.

#### References

Below are links to videos you may find useful. The only thing that works in Exe:Late but not Exe:Late[st] is machine gun mode, which is when you see a lot of small partitions used to do rapid fire A.lumen. Any set up that uses more than 4 partitions must be modified to work in the current version.
