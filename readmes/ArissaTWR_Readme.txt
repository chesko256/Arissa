=================================================
*                     ARISSA
*               The Wandering Rogue
*
* Concept and Writing: 		Chesko & Nikkita
* Main Scenario Writing: 	Nikkita
* Arissa Voiced By: 		Nikkita
* Music By:			Gareth
* Modeling:			Lorelai & Apachii
* Scripting & Development:	Chesko
* Gameplay Design:		Chesko
* Arissa's Outfit By: 		TheRoadStroker & ZZJay
*
=================================================

==================================
Update 1.3
==================================
* Disabled Arissa's "snapping" feature for now. If it is improved in the future, it will be re-enabled. Note that this may result in it becoming easier to lose Arissa in outdoor areas.

* Fixed a bug wherein Arissa would refuse to talk to the player while running the avoidance AI package when attempting to move out of the player's way.

* Softened Arissa's appearance / complexion by default. She should now appear closer to her actual age (28) without the use of mods.

* You can now trade food and beverages to Arissa using "Let's manage your equipment.", adding compatibility with the follower features of iNeeds.

* Added initial support for Extensible Follower Framework 4.0 Beta.

==================================
Update 1.2
==================================
* The introduction quest has now been made fail-safe.
	* Now compatible with Immersive Patrols and other mods that modify guards.
	* No longer relies on any guards actually being alive.
	* If combat breaks out during the introduction quest (before the player has a chance to speak up for Arissa), Arissa will bail and run to the Sleeping Giant Inn in Riverwood.
	* If combat breaks out before the guard in the intro quest has a chance to give the player's gold back, Arissa will give it back instead the next time they talk.
	* Removed any points where quest could freeze up or not continue, resulting in guards reporting "This person is busy."

* Added new inventory and outfit system.
	* Items traded using "I need to trade some things with you." will never be worn.
	* Items traded using "Let's manage your equipment." will attempt to be worn. You cannot give items to Arissa that are not weapons, armor, ammo, or light sources (i.e. torches) using this option.
	* The new dialogue option requires "Distant" regard or higher, the same as the "Trade" option.
	* The "casual" / "armor" option was removed. If you would like Arissa to wear her casual clothing, remove all of her armor from her equipment management inventory.

* Added new console command: "set RecoverArissa to 1" to bring Arissa to your current location if you have well and truly lost Arissa somewhere.

* Fixed issue where Arissa would not always ride the elevator at the end of her main quest. If this currently affects you and Arissa is still stuck at the bottom of the elevator, this update will move her to your location and complete the quest for you.

* Uncapped Arissa's level. You MUST start a new game / load a previous save that never used Arissa before in order for this change to take effect.

* Arissa now must be able to see you in order for her Regard to be impacted by your actions.

* Added an entry in the Active Effects menu to display Arissa's current Regard level when Arissa is following you.

* Fixed "snap to player" behavior when traveling outdoors; Arissa should no longer fall as far behind.

* "Snap to player" behavior disabled in interiors to prevent Arissa getting stuck behind a wall or door.

* Fixed missing dialogue lines related to the Dragonstone.

* Changed Follow package types to the version that most other Followers in the game use. This will hopefully lead to slightly better pathing and performance.

* Arissa's second leg of her main quest can now be started by traveling near the Haafingar Stormcloak Camp.

* Fixed an issue where killing a certain NPC in a quest area could result in the player and/or Arissa becoming stuck.


==================================
Update 1.1a
==================================
* Fixed issue where swapping outfits no longer works following the update.

==================================
Update 1.1
==================================
* Replaced her default and casual wear with ZZJay's Huntress (Red) outfit, which is a segmented set that works much better in general and still feels like Arissa. Along with that, resolved the texture issue with her outfit.
* Arissa will no longer turn on you after hitting her repeatedly. Hitting her also no longer results in a loss of Regard.
* Fixed missing dialogue voice line regarding Arissa asking the player to go see Jarl Balgruf as part of the main quest.
* Added two missing lines related to finding and returning the Dragonstone.
* Removed a line from her opening introduction sequence to keep her from sounding too much like an advertisement.


==================================
Overview
==================================

Arissa is a Skyrim companion character with over 450 lines of dialogue, professionally recorded and beautifully voiced by the talented Nikkita. She is designed as a game-long companion that can accompany you from start to finish. She is inspired by Emma and Amgepo's Vilja, Bethesda's Serana from Dawnguard, and the kinds of characters found in Bioware games.

Arissa is an Imperial with an independent, rebellious spirit and a gift for making expensive things disappear.

Arissa is a rogue-type character with a dual-wielding combat style. She will readily use blades, bows, and any armor given to her. She levels as the player levels, favoring thief-oriented skills such as light armor, lockpicking and one-handed weapons.

Enjoy getting to know Arissa along your travels as you take part in her short-but-sweet two-part main quest line, complete with a new dungeon to explore. She earns every bit of her title of "wandering rogue", having criss-crossed Skyrim the better part of the last decade. She will readily chime in with witty, interesting, and insightful comments about over 40 areas across Skyrim as you travel together. If you were searching for a bold and knowledgable companion to accompany you on your long travels, look no further. She is fully embedded in Skyrim's world and fully lore-friendly.

While Arissa cannot come close to the breadth of features offered by mods such as Vilja in Skyrim, we can promise an obsessive devotion to detail and quality while offering an experience that feels like a natural extension of the normal game. The voice acting and recording quality should sound as good as any NPC you'd encounter in the main game. The recordings are free of pops and wide fluctuations in quality or volume; it needs to be heard to be appreciated. The mod should also be free of typos and other grammatical errors. Every battle cry, "Uh huh", "Sure", "No thanks", and "Lead on" was carefully voice-acted and recorded by Nikkita; all dialogue spoken by Arissa is 100% original.

Special attention was paid to adding a high level of variety to common phrases in order to keep things from sounding repetitive. Attention was also paid to trying to find a "sweet spot" in her talkativeness, erring on the side of staying quiet and allowing the player to enjoy the game. We never wanted her to be annoying or repetative, and I think you'll be pleased with what we've been able to accomplish. For us, she is a joy to adventure and spend time with, and we hope you feel the same.

Arissa does not use the standard follower system in Skyrim, so she can be recruited in addition to any other follower you might have.

Special Note: Users that are arachnophobic may have a difficult time completing a portion of Arissa's main questline. Please install a spider replacer mod if this will impact you.

==================================
How To Begin
==================================

Visit the Dead Man's Drink in Falkreath. Arissa will be waiting for you there.

==================================
Talking
==================================

Arissa can talk about the general surroundings ("What do you know about this place?"), as well as her background. She will be elusive at first, but will begin to open up as you move through her main quest.

==================================
Regard System
==================================

We wanted to give Arissa a mind of her own and add some depth to Arissa's behavior, and have her behavior change over the course of your time spent with her. Arissa features a Regard system which determines how she feels about the player, and what tasks and favors she will be willing to perform.

Arissa will respond naturally to your actions over the course of the game. As her Regard increases, her disposition toward you will improve, unlocking new abilities. Her normal dialogue options will change in tone as well, ranging from dismissive to enthusiastic. Her Regard can also be affected (sometimes greatly) by certain dialogue options.

Arissa responds positively to acts of heroism and cunning, such as defeating difficult foes, winning brawls, performing successful sneak attacks, and more. She responds negatively to acts of murder and intimidation. She will also respond negatively to being hit by the player.

|---- COMPANION
|
|	  Effect: Call of Oakshore unlocked. Summon Arissa from anywhere in Skyrim.
|
|---- FRIEND
|
|     Effect: Will give lockpicks and leveled poisons to player once / day.
|
|---- ALLY
|
|     Effect: Willing to do favors.
|
|---- DISTANT
|
|     Effect: Willing to Trade. Willing to Wait.
|
|---- DISTRUSTFUL
|
|     Effect: Nothing
|
|---- RESENTFUL
|
|     Effect: Nothing
|
|---- RIVAL

      Effect: Leaves your service. You can wait and recruit her again.


Special note: Arissa abhors cannibalism. If you feed on someone while wearing the Ring of Namira while Arissa is in your service, she will leave permanently. You will not be able to re-recruit her after this, so be careful!

Currently, Arissa is ambivalent towards vampirism and lycanthropy.

==================================
Town Roaming and Theft
==================================

When visiting a major city in Skyrim, you can tell Arissa "You go ahead. I'll catch up with you later." Arissa will the leave your side to freely roam the city while you remain in it. She will rejoin you if asked or if you leave the city gates. Arissa will prefer to hang around and shop in alchemy and general good stores. She will retire to the local inn after dark.

If you allow Arissa to roam past midnight, she may get up to no good... who knows what she might find?

I hope this feature allows you to have some time apart from each other while in cities without disturbing gameplay, leading to a more organic feeling experience.

==================================
Commentary
==================================

Arissa has been all over Skyrim, and will offer comments for a wide variety of locations in the base Skyrim game (DLC areas are not yet supported). When you come close to one of these areas, Arissa will chime in. She will only speak these lines unprompted once; however, you can ask her at any time "What do you know about this place?", and she will gladly repeat it. You can also let her know that you'd prefer to just ask about locations, and this "broadcasting" behavior will be disabled.

She will also comment on successfully picking locks, choice of armor, nearby dungeons, and more.

==================================
Movement and Traveling
==================================

Arissa will attempt to intelligently get out of the player's way when Arissa and the player are too close, hopefully un-jamming her from doorways and halls.

When riding a horse, Arissa will automatically call her own and ride right behind you. Her horse is dismissed as soon as you dismount. Arissa is also compatible with Convenient Horses! If you would like mounted combat options for Arissa, please use Convenient Horses.

If Arissa starts to lag too far behind when walking, running, or riding, she will jump to a position closer to the player when the player isn't looking. If you lose track of Arissa, just keep going, she'll spring close to you soon. This was a compromise to compensate for the normal pathing behavior that all NPCs exhibit in Skyrim.

==================================
Attire
==================================

Arissa wears her normal "casual" attire only at the start of your journey together, and then quickly switches to a set of thief-based armor. This armor is sub-par and should be upgraded at the earliest opportunity. Arissa was designed with the modded game in mind, so please upgrade her gear to whatever you find suitable. Since her gear has lower armor value than any other armor found in the game, she should automatically wear whatever you give her.

You can ask Arissa to switch to her more casual attire, however:

* This outfit offers 0 armor. Not suitable for combat!
* Because of the way this outfit's mesh is constructed, you may experience graphical errors, including neck seam issues and skin textures that look terrible. It is not compatible with body replacers, which will cause issues with its appearance.
* Again, because of the way this outfit's mesh is constructed, giving Arissa things to wear while in the casual clothing state may cause strange errors such as her feet and hands popping out of her gloves and boots.

These are technical issues that I cannot fix because I did not create the armor (which, for what it's worth, looks great all things considered).

With that in mind, it is recommended that you leave her in her "armor" state most of the time and use armors and outfits suited to your level, chosen body replacer, and collection of mods. Her "casual" attire was left in the game primarily because that's how most people have come to know her through the images that I've shared of her over the past year, and I didn't feel like she would be "her" without seeing her in that outfit at least once. I highly recommend you leave her switched to her "armored" state and only switch to her casual state just because that's the particular set of gear you want to see her in and intend to switch back to armored later.

Switching between "armored" and "casual" is not a sophisticated outfit management system, so please use sparingly. An advanced outfit management system will be investigated for the future, possibly compatibility with an existing best-in-class outfit management mod.

==================================
Requirements
==================================

The latest version of Skyrim.

==================================
Compatibility
==================================

Compatible with other custom follower mods.
Compatible with Convenient Horses.
Compatible with Wearable Lanterns.

No compatibility was added for multi-follower mods; however, your gameplay should not be negatively impacted. Features added by EFF, UFO or AFT will probably not work on Arissa.

Arissa has already been cleaned with TES5Edit and the edits that remain are intentional. Specifically, these edits are intentional:
* Edits to defaultWICommentTRIG
* Edits to WICommentTriggerScript
* Edits to MilitaryCampHaafingarSonsLocation
* Edits to Worldspace Tamriel 00000D74 and Block -1, 0 and children (MilitaryCampHaafingarSonsLocation, MilitaryCampHaafingarSons03, etc)

==================================
Troubleshooting
==================================

"I can't talk to Arissa during the first part of her quest outside of Falkreath. It says 'This person is busy.' and people are still around her."
Wait a few more seconds. This scene can sometimes be slow to proceed.

"I told Arissa to relax into casual wear, but strange graphical errors appeared / it looks like she has a skin disease."
See "Attire", above.

"I lost Arissa! I can't find her!"
Don't panic! If Arissa disappears, you can:
 * Keep walking. If you lost her while walking across Tamriel, she should spring behind you soon while you're not looking.
 * If you told her to Wait and forgot where, she will return to the Dead Man's Drink in Falkreath after 2 days and will give up.
 * If you dismissed her, she will be waiting in the Dead Man's Drink in Falkreath.
 * If you told her to roam freely while in a city, leave the city. She will run to you. You may need to wait an hour for her to catch up to you.

"Arissa said "Excuse me" when I bumped into her, and then cowered, as if frightened."
This is a known issue that is part of her "avoidance" package to try to get her out of your way when you bump into her.

"Arissa started sandboxing / started waiting somewhere, and now she's not following me even if I move away."
Chances are high that your game (specifically your scripting system) is running poorly and my scripts are not being allowed to run. Try a new game or try disabling all other mods and see if it still happens. Arissa uses a system identical to the one used by Serana in Dawnguard to allow her to sandbox around an area when you are standing still.

==================================
FAQ
==================================

"Can you marry Arissa?"
Not at this time. Making her a fun and pleasing character to adventure with was more important during development.

"I am a cannibal and now Arissa hates me. Is there any way to re-recruit her?"
No, sorry.

"Is Arissa compatible with mod XYZ?"
I don't know. Why don't you try it, and let me know? There are too many things for me to test by myself. Please report incompatibilities.

"Can Arissa die?"
Yes. She is "Protected", which means that enemies cannot kill her, but you can (for whatever reason, it's your game). You won't be able to kill her during a certain portion of her main quest.

"Why won't Arissa do what I tell her to do?!"
Because her Regard is too low for what you're asking her to do. See "Regard", above.

"Is Arissa compatible with multi-follower mods such as EFF, UFO, and AFT?"
Nothing will break, but their additional follower features (probably) won't work. I haven't added compatibility for these.

"How do I cheat and max out her Regard from the get-go?"
Open the console (~) and type "set _Arissa_Regard to 10". Note the space between "set" and the underscore. Then, go kill an enemy of some kind or wait 24 hours. All features should be unlocked.

"If I clean-save or uninstall Arissa, will all of her progress be lost?"
Yes.

"How do I check my current Regard with Arissa?"
Currently, you can't through dialogue. We will work on improving this. You can check it using the console (~) by typing "show _Arissa_Regard". Her Regard ranges from +10.0 to -10.0.

"I don't like the Regard notifications. How do I disable them?"
They can currently be disabled through the console (~) by entering:
Disable changes to Regard notifications: "set _Arissa_Setting_ShowRegardChanges to 0" (note the space between "set" and the underscore)
Disable Regard level notifications: "set _Arissa_Setting_ShowRegardLevels to 0" (note the space between "set" and the underscore)
Set either of these to 1 to turn these features back on.

==================================
Spoilers
==================================
"How do I start the second part of Arissa's main quest?"
She will approach you automatically after about 3 days of gameplay. You can also use the Wait key to wait about 7 days, after which she should offer you the next leg of her quest.

"How do I get past the barred gate?"
You need to pull on something near the gate. There are two of them; one opens the way.

"That's it? That's all there is to her quest?"
Yes, and I am sorry if it is disappointingly shortlived. I started an indie game studio around the half-way point of Arissa's development, and some things ended up getting cut a bit short. Please make sure to talk to Arissa following her second quest and have her talk about her past in order to get an idea of what she's been through. I hope that exposition will help wrap things up.

"What is the full list of things that increase Regard? What is the full list of things that decrease it?"

Her Regard is increased by:
Days spent together
Brawls Won
Backstabs
Locations Discovered
Dungeons Cleared
Persuasions
Bribes
Quests Completed
Spells Learned
Pockets Picked
Locks Picked
Horses Stolen
Dragon Souls Collected
People Killed (but not Murders)
Undead Killed
Daedra Killed
Automatons Killed
Times Shouted
Words Of Power Learned
Sneak Attacks
Items Stolen

Her Regard is decreased by:
Murders
Intimidations
Attacking her
Feeding as a Cannibal (results in permanent disband)

==================================
Thanks
==================================

* It's been a great privilege to work with someone as talented as Nikkita. Thank you for breathing life into Arissa; without your hard work, she would have never been possible.
* Thanks to Gareth for the excellent music track that opens her first quest.
* Thanks to Lorelai's 3D modeling and texturing support.
* Thanks to TheRoadStroker for use of his excellent-looking Rogue Sorceress outfit.
* Thanks to Apachii for use of Arissa's hairstyle.
* Thanks to Mitchalek, for Convenient Horses compatibility.

* And last but not least, thanks to YOU for your patience and for playing Arissa. I hope you have great adventures together and that we get to hear about them.

==================================
What's Next?
==================================

Let us know what features you'd like to see in Arissa; we're listening. We will continue to fix bugs as identified and to add some features slowly over time.

Adventure awaits!

==================================
Chesko and Indie Game Development
==================================

As mentioned up above, I started an indie game studio during Arissa's development. We are hard at work on Hazewalker, a game that I think will be fun for fans of Skyrim, and especially Castlavania: Symphony of the Night fans. Please check out our work below and follow us on social media if you think it's something you'd be interested in. I hope to continue modding well into the future, but for now the bulk of my sweat and effort is being poured into making a great game. Thank you everyone for your support!

www.hazewalker.com



==================================
Permissions
==================================
You may not copy or redistribute any portion of this mod, in whole or in part, without the author's express permission. He can be reached at chesko.tesmod@gmail.com.

If the author is unreachable for up to 6 months, you are free to do whatever you wish with this file.

You may freely upload, modify, and redistribute this file for translation purposes.