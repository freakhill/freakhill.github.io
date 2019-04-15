+++
title = "Vatista"
description = "notes on learning vatista"
date = 2019-03-17
weight = 40
draft = false
in_search_index = true
[taxonomies]
#tags = [ "clojure" ]
[extra]
+++

Compilation of data from:

- [Koishi](https://twitter.com/crazy_lemonmilk) Vatista [combo guide](https://www.evernote.com/shard/s319/client/snv?noteGuid=66eb1d7d-7b1c-4c46-9462-4f8f1a5fb960&noteKey=c6b0f1e181b407f9111d70de7665480e&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs319%2Fsh%2F66eb1d7d-7b1c-4c46-9462-4f8f1a5fb960%2Fc6b0f1e181b407f9111d70de7665480e&title=UNIST%2Bv3.20%2BVatista%2BCombo%2BGuide)

- Dainiru [combo guide](https://docs.google.com/document/d/10S5xFq9PDQRTqYtVxs0P6tv2URhHsnl_bwed_l73Xx4/edit)

- [Boruphen's charge partitioning guide](https://www.evernote.com/shard/s628/client/snv?noteGuid=ae0b78c4-cd9d-4917-a005-adc76820c93c&noteKey=28ded817c39ffe5b626230061e9668c2&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs628%2Fsh%2Fae0b78c4-cd9d-4917-a005-adc76820c93c%2F28ded817c39ffe5b626230061e9668c2&title=Boruphen%2527s%2BGuide%2Bto%2BCharge%2BPartitioning%2Bin%2BUNIST)

- and the [Mizuumi wiki!](http://wiki.mizuumi.net/w/Under_Night_In-Birth/UNIST/Vatista)

- aaaand the [dustloop uniel system post](http://www.dustloop.com/forums/index.php?/forums/topic/9084-uniel-system-mechanics-updated-april-20th-2015/) (i hope it didn't change too much in unist)

## System

Vatista cannot be counter hit, ever. It's a vatista thing.

### The buttons

Buttons: A, B, C ,D

Standard binding is (SFV notation): A->LP, B->MP, C->HP, D->LK

We will assume that binding from now on.

- A+B+C = some kind of burst, not usable on block, invulnerable, push back opponent your opponent full screen, you can charge it but just tap it. Afterwards you are in VO "Veil Off" state.
- B+C = FF, Force Function, character specific strong move that cost grid, generally pretty OP move
- A+B = Dash
- jA+B = Assault
- (j)6D = Assault
- A+D = Throw (same as SFV throw)
- D>D = Chain Shift (like GG roman cancel)
- Tatsumaki D = Guard cancel (with varying cost)
- hcfD (41236D) = IW = 200% Super
- A+B+C+D = IWEXS = 200% Super while in VO
- When you win the grid war (more grid at the end of a cycle), you get to be in "Vorpal", give you access to character specific stuff.
- 5D = Concentration: generate grids, short startup cancellable by any special move, holding any back direction during startup will shield
- Shield (4D / j.4D): A defensive option that allows the player to benefit from blocking.
- Guard Thrust (214D): A defensive option that requires meter or vorpal, but allows players in blockstun to perform an invincible move to knock attackers away. If in vorpal, it takes no meter, but costs vorpal and all of a player's grd blocks. If not in vorpal, it costs all of a players meter (with a minimum of 100 meter required to perform it) and grd crushes the player using it. If in vorpal carryover state following a chain shift, players can spend all meter and remaining vorpal carryover bar to perform a guard thrust that does not grd crush themselves.
- There is guard cancel in the game, tatsu D, cost: if in vorpal, vorpag&grid break, if not in verpal 100 too 200 meter. after chain shift (DD cancel) can guard cancel without grid break.

### Autocombo ("Smart Steer")

- If a player pushes 5A multiple times in a row on block or hit, they will get an automatic combo string.
- - This is somewhat useful for players who use their 5B or 5C in their blockstring, but need them as combo tools, because smart steer is typically something like 5A > 5B > 5C > Special.

### Gattling ("Passing Link")

- A mechanic in the game that allows player to freely chain their normals into each other. Generally important for the ability to 'reverse beat' normals (ie: going from a B button back to an A button, whereas many games force you to only go up the chain of buttons in order, ala A > B > C.)
- Each move can only be used once in a single string of cancels, unless it has a special property (ie: most 2As can self-cancel indefinitely) that allows it to be used more than once.
- - Note that this remains true for air strings as well. Certain characters can cancel air moves into ground specials and back into air moves, and will still be limited in what air moves they can use at that point.

### Recovery/Teching

- Upon being hit and knocked down or knocked airborne, players can hold down a non-D button to recover at the earliest possible opportunity. Alternatively, players can choose to wait until they want to tech, at which point they can push a button to tech, assuming they are not stuck in an untechable state.
- The D button can be used to tech, but will generally skip the first possible tech option and only tech on the next tech option.
- - For example, getting knocked to the ground and holding the D button will cause a late ground tech, not an immediate/emergency tech. Getting hit in the air and holding the D button causes a ground tech.
- After any form of recovery, for the first 8 frames after a player can perform actions, they are invulnerable to throws.
- - This invulnerability is not lost even if the player pushes any buttons.
- There are three primary forms of recovery:
- - Air tech: Players can hold one of three directions (back/forward/neutral) and tech out of air combos in the direction of their choosing. The character will flash briefly as they tech.
- - - Air techs are useful because of how far they launch teching players away from their opponents, but they have a major downside. Though teching players are invulnerable until they reach the floor, they also cannot perform any actions! This makes them VERY easy to oki for the opponent!
- - Ground tech: Players can hold one of two directions (back/neutral) and flip off the ground and onto their feet. The character will flash briefly as they tech. The direction influences where players end up after they flip.
- - - Players can delay their ground techs slightly to throw off opponent's oki timings.
- - Delayed tech: Players who choose not to push any buttons after falling to the ground will eventually have their character stand up automatically. This form of recovery does not cause the character to flash.
- Any form of ground teching causes players to recover in a standing state. However, doing any sort of move overrides this standing recovery state and immediately goes into the move.
- - For example, waking up and pushing 2A will cause the recovering character to recover into a crouching state with their 2A starting up. This works with shielding as well.

### Wall/Ground bounces

- Many combos involve bouncing opponents off of walls or sticking them to the ground. This cannot happen more than 3 times in a single combo.
- - After a third wall/ground slam, opponents immediately become invulnerable and can no longer be hit (even if they are also unable to tech).

### Jump Cancels

- Players are limited to one jump cancel per combo, unless they have specific moves that allow for special jump cancels.
- Players cannot jump cancel their moves on block, again unless they have specific moves that allow for special jump cancels.

### Shielding

- Shielding locks players into high/low blocking if used in neutral, so players can get grd crushed because they can't switch to blocking the right way. They can also be grd crushed by throws (this can be avoided with a throw-tech OS, though--see the throw section for more info).
- Guard shielding (denoted by a green flash around the defending character) does NOT lock players into high/low blocking, but does force them to keep shielding, meaning they can still get grd crushed from throws (unless they use the throw break option; see the bottom of the throw section for more info).
- - From appearances, guard shielding does make it appear as though a player is locked into high/low blocking state, but this is similar to a blockstun effect. The player can actually block however they wish. If they choose to block low after guard shielding high, players risk being hit by overheads that only hit standing opponents, because their character remains in a standing position.
- - Guard shielding occurs when players input guard while they are in blockstun, and it costs 10 meter (or anything in your gauge if you have less than 10 meter).
- - Unsuccessful guard shielding costs 1 block of grd.
- Any successful shield grants 1 block of grd gauge.
- Successful ground shielding grants the defending player 3 frames of reduced blockstun.
- Successful air shielding grants the defending player 6 frames of reduced blockstun.
- Successful normal shielding causes slightly increased pushback.
- Successful guard shielding causes significantly increased pushback, in addition to the normal benefits gained from shielding moves.
- Air normals cannot be blocked by players in the air unless they shield them!
- Air normals that get shielded (either by grounded or aerial defenders) can no longer be cancelled into anything, and the player performing the normal suffers from a flat 10 frames of landing recovery.
- Air specials, ground specials, and ground normals that get shielded do not suffer from any sort of additional recovery or inability to be cancelled. They continue to act as normal. This also applies to ground normals that put the player airborne and aerial dive moves.
- If a player shields and gets grd crushed, they lose the ability to use D-button moves (see above)!
- Every hit in multi-hit moves must be shielded individually.
- - Note that while players must shield the last hit in multi-hit aerial normals to get the 3 or 6 frames of reduced blockstun, the attacking player will suffer the increased landing recovery and lack of cancel routes regardless of which hit of their normal was shielded.
- If a player shields a move right before it hits him (within a few frames) and holds the D button, the game will register the shield input twice, causing him to immediately guard shield after his first shield. This can be useful when shielding multi-hit moves that are difficult to shield normally, but is also terrible if it occurs when shielding a normal jump-in.
- Aerial shielding, like all other aerial actions, counts as a move and therefore incurs landing recovery. Players mindlessly shielding in the air can allow opponents free landing punishes or grd crush opportunities.

### Throws

- Non command throws universally have a 4 frame startup.
- Throws have a 14 frame throwbreak window.
- Gold throws (throws performed on opponents who are still stuck in blockstun or hitstun) have a 28 frame throwbreak window
- If a player whiffs a throw attempt, they lose 1 block of grd.
- Players that exit blockstun or hitstun have an additional 7 frames of gold throw protection, meaning any throw performed on them will turn into a gold throw.
- - Notably, there appears to be a somewhat odd situation where players actually become invulnerable to diving command throws during this window. It is unclear if this is intended.
- Players who have just recovered from a ground or air tech are throw invulnerable for approximately 8 frames.
- If players start to perform a move before being thrown, they will always be throw countered and be unable to break the throw, even if it shows up as a gold throw. A red flash on the player's character indicates a throw counter.
- When players break throws, they gain two advantages:
- - The player breaking the throw gains 2 blocks of grd, while the opponent loses 2 blocks of grd.
- - The player breaking the throw has an 8 frame advantage over their opponent after breaking the throw.
- If a player grd crushes an opponent with their throw, the throw and subsequent combo will do more damage than usual. There appears to be no extra untech time applied to the combo, however, so it will not become longer than usual.
- If a normal throw and a hit go active on the same frame, the hit will win.
- Throws can be kara-cancelled from B moves, if the throw is inputted within the first 2 frames of the B move's startup.
- If a player guard shields, they can input a throw break while they're locked into the guard shield state. This will put the player in a yellow throw break state instead for a few frames, and then subsequently into a throw counter state.
- - If a defender uses this option, they will no longer be considered in a shield state, which means that if the attacker does not throw them and instead performs an attack, that attack will not be considered shielded. The defender will gain no vorpal and no frame advantage, and the attacker will suffer no penalties.
- - Any throw the opponent performs during the yellow throw break window WILL be teched! This includes command throws!
- - If the opponent performs a normal throw during the throw counter window, the player will not suffer from grd crush, and will instead only suffer from a yellow counter throw. (remember, grd crush throws have increased damage, so this is quite useful!)
- - If the opponent performs a command throw during that throw counter window, however, the player will still suffer grd crush.

### Assault

- Players cannot block after performing assault until they touch the ground
- Assaults, like jumps, are throw invulnerable on frame 1
- Assault does not cause any special landing recovery penalty to be applied to aerial normals
- - It should be noted that assault does count as a move, however, and therefore carries its own landing recovery, so empty assaults are punishable on landing.
- Ground assault moves towards the opponent and homes in on them
- Air assault moves towards the opponent in a set distance and arc, meaning players can jump well passed the opponent if too close
- Any aerial normals performed from assault are overheads (note: this does not include special moves like Yuzu's stance-based j.6a/b/c)
- Any normals performed during a grounded assault cannot be chained into other aerial normals
- - In contrast, aerial assaults do not prevent players from chaining moves together for multiple overheads
- Any combo started from a normal performed during assault suffers drastically reduced untech time, making the combos much shorter than normal
- - This is negated if the assault overhead causes a counterhit or a grd crush.
- Any combo started from an assault normal also suffers from slightly reduced damage (worse P2 value on starting move).
- - This is also negated if the assault normal causes a counterhit or grd crush.
- Both aerial and grounded assaults suffer the same reduced starting penalties.
- Assault has a 5 frame startup (likely universal, didn't test thoroughly, but it is true for Waldstein and a couple others)

### Grid

- Players automatically generate some grd when not doing anything.
- - Passive generation speed is directly related to how far a player's character's back is from the edge of the screen. The further away, the faster they generate.
- - - This means that players who corner their opponent not only have strong pressure options, they also passively are generating more grd!
- Actions that generate grd:
- - Concentration (5D) (see next section for details)
- - - Concentration drains the opponent's grd as well, and will drain it faster if a player spends meter during their concentration.
- - Moving forward (walking, running, jumping, etc.)
- - Using assault (generates ~0.5 grd)
- - Blocking/Shielding attacks (successfully shielding an attack generates 1 grd)
- - Aerial forward teching
- - If the opponent does an immediate ground tech from a combo
- - The opponent moving backwards
- - - If the opponent cannot actually move backwards (ie: is stuck on the edge of the screen), no grd will be gained
- - - This includes both grounded and aerial back teching
- Actions that lose grd:
- - Opponent using concentration (5D) for longer than 30 frames
- - Moving backwards (walking, backdashing, jumping, etc.)
- - - (backdashing costs 1 grd)
- - Using guard shield and not blocking anything (costs 1 grd)
- - Being thrown or having a throw broken (costs 2 grd either way)
- - Whiffing a throw
- - Ground back teching (costs 1 grd)
- - The opponent moving forwards
- - - If the defender is stuck with their back against the corner, no grd will be lost
- Certain characters can gain and steal grd by hitting the opponents with special moves, like Gordeau's command throws and Byakuya's webs.
- The more grd a player has, the less they will get for every action.

### Concentration

- Players can concentrate for up to 420f by holding the D button.
- Concentrating for more than 30f will drain meter from the player, but can be done even even if a player has no meter.
- - During the meter drain, players will drain opponent's grd significantly faster than normal. Without meter, this faster drain effect will not occur.
- Concentration starts generating grd on the first frame a player pushes the D button.
- Each character has a specific concentration modifier that controls how fast they can generate grd AND how fast they drain opponent's grd when spending meter. The higher the modifier, the faster.
- - 1x: Eltnum, Nanase
- - 2x: Orie
- - 3x: Yuzuriha, Seth, Gordeau, Carmine, Merkava, Hyde, Linne, Vatista, Byakuya, Akatsuki
- - 4x: Waldstein
- - 5x: Hilda, Chaos
- In a concentration battle, the amount of grd that can be drain from the opponent when spending meter will always outweigh the difference in amount gained from the concentration itself.
- - In other words, even Eltnum can out-generate Hilda in a concentration battle if Eltnum spends meter and Hilda has no meter to spend.
- In a mirror at the start of a round, if both players have meter and hold concentration, player 2 will fill their grd blocks slightly faster than player 1.
- - Without meter, however, both players will tie for the vorpal cycle.

### Vorpal

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

### Veil Off

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

### Counters

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

### Superflash and Screen Freeze:

- EX moves (supers), chain shifts, and infinite worths all cause the game to pause momentarily.
- - EX moves cause a 20 frame superflash (19 frame freeze).
- - Chain shift causes a 40 frame superflash (39 frame freeze).
- Superflash is throw invuln, even for non-reversal supers. This is generally useless information, unfortunately, because superflash technically only lasts for 1 frame.

### Input Buffering

- When the game pauses, input timers continue, so all inputs are lost during the duration of chain shift, EX move, and IW screen freezes. Players should buffer their inputs a second time during the flashes to make sure their moves occur.
- The input buffer in the game doesn't last as long as screen freezes do, so players should re-buffer their inputs towards the end of the freeze in order to get their moves to occur!
- (note!: this is a massive generalization) Inputs generally last for around 4 frames, so if a player wants to avoid getting 623 motions when they want 236 motions, returning to neutral for 4 frames will reset the input buffer.

### Fuzzy Protection

- This game has two distinct forms of fuzzy protection:
- - Rising overheads are not overheads. This means any aerial move that is normally an overhead will be treated as a mid until the character performing it reaches the apex of his or her jump. Notably, assaulting doesn't even allow characters to attack until they reach the apex of their jumps.
- - Characters who are holding down-back and get hit out of a move by rising 'overheads' (air normals that are normally overhead) will suffer drastically reduced damage. Any combo started from such a situation will do 50% or less of its usual damage. There is, however, no nerf to untech time in a combo started this way.
- - - (Note: this fuzzy protection appears to apply proration that scales down from about 40% starting on the second hit of the combo, all the way down to the lowest I've seen so far, at 27% on the last hit of a mid-length combo. It may not be a proration-based damage nerf.)
- - - This penalty applies to any aerial move that makes the character rise, even if it is performed during the falling portion of a jump. This is clearly seen with Eltnum's j.[C] against a down-backing opponent.
- - - This penalty can stack with the reduced assault normal proration and untech.

### Crossup Protection

- This game has a system in place to protect players from very fast crossups.
- - Players can always block attacks by blocking in the direction away from the opponent's character.
- - - Blocking away from the direction the opponent's character is facing is a similar concept that works against everything except projectiles in certain cases (see below)
- - Players can always block away from the direction of an incoming attack (if a fireball is coming from behind, you can hold forward to block), as long as the attack is originating from that direction (see below).
- - Players in blockstun will automatically block the correct direction until they exit blockstun.
- Shielding acts as though players are in blockstun, and will allow crouching or standing players to block any crossups during the duration of the shield.
- Each projectile (and attack, technically) in the game has a 'direction of facing', which players can always block away from. However, points of origins for projectiles do not always align with their visual cues. Most projectiles in the game have their directions set whenever their player performs them. Seth's orbs and Carmine's puddle-spawned pinwheels, however, set their direction when they fire, likely because of their homing property.
- Players who are walking backwards prior to getting crossed up will have some amount of extended crossup protection against some moves.

### Same Move Proration

- Using certain moves in a combo more than once will cause the combo to suffer reduced untech time (and perhaps damage).
- There is no list at the moment of all moves that suffer from SMP, but it MIGHT be all special moves. It may even apply to all moves, but at minimal effect.

### Dashing/Backdashing

- Dashing and backdashing can be done with the A+B input. 6A+B is a dash and 4A+B is a backdash.
- If a player inputs 6A+B, then holds the buttons down and flips the joystick to 4 within 2 frames, the startup of their dash will instantly become a backdash.
- Dashes have around a 2 frame startup before they start moving, but doing micro-dash moves is still possible.
- Dashes can be cancelled out of at any point by blocking, backdashing, doing a move, etc.
- Backdash frame data:
- - Akatsuki, Hyde, Gordeau: 22f total, 1-8 invuln
- - Eltnum: 25f total, 1-8 invuln
- - Linne: 26f total, 1-8 invuln
- - Vatista, Yuzuriha, Carmine: 27f total, 1-8 invuln
- - Nanase, Chaos: 28f total, 1-8 invuln
- - Byakuya: 29f total, 1-8 invuln
- - Waldstein: 32f total, 1-10 invuln
- - Hilda: 36f total, 1-9 invuln
- - Orie: 36f total, 1-8 invuln (no foot hitbox until frame 15)
- - Seth: 37f total (grounded), 1-7 invuln
- - Merkava: 37f total, 1-10 invuln

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

- The game offers the ability to record dummies and have them play back when they recover from hitstun or blockstun, or after teching. This recording does not play on the first frame that a bot exits hitstun or blockstun.
- - The game spends 1 frame determining that the bot has returned to neutral (ie: exited hitstun/blockstun) before playing its recording, causing the recording to play on the second frame after the bot recovers from hitstun/blockstun.
- When counter/high counter is enabled, the game only assumes the first hit in a string of cancels that touches the dummy is a counterhit. This means that things like cancelling a 5A (CH) into a special that is slow enough to reset the combo counter will not provide a second counterhit for the reset. The player must actually return to neutral if they want to re-enable the counter/high counter mode.

### Extra Info

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
