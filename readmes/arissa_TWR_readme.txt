=================================================
*                     ARISSA
*               The Wandering Rogue
*
* Concept and Writing: 		Chesko & Nikkita
* Main Scenario Writing: 	Nikkita
* Arissa Voiced By: 		Nikkita
* Music By:			Gareth
* Scripting & Development:	Chesko
* Gameplay Design:		Chesko
*
=================================================

Date: 6/27/2015

==================================
Update 2.2.1
==================================
BUG FIXES
* Fixed an issue where, if Arissa's Regard system is disabled through the MCM or the Config spell, her ability to do follower commands would not be enabled.


==================================
Update 2.2
==================================
FEATURES
* Now uses custom body and head meshes and textures in the main install. She uses the CBBE Slim Nevernude body and textures, and eyes from The Eyes of Beauty. She continues to use her custom hair style from Kalilies and ApachiiSkyHair.
* The Arissa Customizer from ClearanceClarence is now available. Please use this, in conjunction with The Hairstyler, in order to achieve the exact look you want for Arissa.

CHANGES
* Restored a unique piece of dialogue in Rorikstead that was lost between 1.3 and 2.0.
* Arissa's carry weight when trading with her is now capped at 300.
* In accordance with using a custom body and support of the new Arissa Customizer, the Appearance Pack system is deprecated and will no longer be supported or developed. Please discontinue using the Appearance Pack in favor of the Customizer and The Hairstyler.
* Arissa speaks her after-combat dialogue lines ("That takes care of that", etc) half as often.


COMPATIBILITY
* Now compatible with Become A Bard. Jam out!
* Now compatible with Campfire. Camp out!

BUG FIXES
* Fixed an issue with certain lines of dialogue playing that should have never been able to play.
* Fixed an issue with certain areas resulting in no dialogue when prompting Arissa.
* Fixed several misc dialogue issues.
* Fixed an issue where Arissa's second main quest would start even if she had not been recruited yet.

==================================
Update 2.1.3
==================================
COMPATIBILITY
* Now fully compatible with Open Cities of Skyrim. Arissa will town roam in Windhelm, Riften, Markarth, Whiterun, and Solitude correctly when using Open Cities.

CHANGES
* Regard messages now read "Arissa's regard for you increased/decreased.", instead of "Arissa's regard for the player increased/decreased."

BUG FIXES
* Fixed a continuous Papyrus log error that could occur when Arissa was town roaming in certain cities.

==================================
Update 2.1.2
==================================
BUG FIXES
* Fixed issue where new 2.1 upgrade task would run every time Arissa was recruited, causing her default armor to be regenerated.
* Added check to ensure that her best gear is evaluated each time she is recruited.

==================================
Update 2.1.1
==================================
BUG FIXES
* Removed 15 identical-to-master navmesh edits.
* Changed legacy configuration spell name from "Arissa Config" to "Configure: Arissa"

Appearance Pack 1
* Fixed potential packaging issue which may have caused face discoloration.

==================================
Update 2.1
==================================
FEATURES
* Arissa's ponytail hair is in the base install once again.

BUG FIXES
* Fixed the dark face / neck seam issue in the base package and Appearance Pack 1.
* Fixed an issue where her second main quest would not start. It should now start after waiting about 3 in-game days.
* Fixed an issue where the second main quest cave would not be visible.
* Greatly improved her horse riding functionality. Arissa should no longer fall as far behind, should stay on her horse, and should get off her horse when in combat or when the player jumps off. Thanks to Alek of Convenient Horses for some of these enhancements.
* Fixed an issue where Arissa may no longer ride her horse.
* Fixed an issue where Convenient Horses may no longer work with Arissa.
* Fixed an issue with the title of the mod being lower case in the MCM.
* Fixed Arissa being able to walk off to a distant location when selecting her town roaming dialogue option when inside a house.
* Fixed an issue where Arissa would no longer wear the armor that the player gave her.

COMPATIBILITY
* iNeed - Arissa now finds 5 apples and 3 bottles of mead per day if her regard is too low for you to trade with her.
* Imperious - The Green Pact ability now counts as cannibalism and Arissa will react accordingly.
* Open Cities - If Open Cities is installed, the town roam dialogue prompt will appear only while in Dawnstar, Morthal, or Winterhold. This will prevent Arissa from walking off into the distance when in an Open Cities city.

CHANGES
* Enhanced the functionality of the MCM's location field; should no longer display "Unknown" as often.
* Reduced the number of spiders that spawn during the spider encounter on Arissa's second main quest.
* Slightly modified the entrance of the cave for Arissa's second main quest.
* Added a boulder to the entrance of the cave for Arissa's second main quest if the quest has not started.
* Arissa should no longer change into casual clothes when town roaming, in order to reduce complexity and prevent outfit bugs.
* Removed unneeded meshes and textures from the archives.


==================================
Update 2.0
==================================
* Please see the file page for update details.


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

Arissa is a Skyrim companion character with over 600 lines of dialogue, professionally recorded and beautifully voiced by the talented Nikkita. She is designed as a game-long companion that can accompany you from start to finish. She is inspired by Bethesda's Serana from Dawnguard, and the kinds of characters found in Bioware games.

Arissa is an Imperial with an independent, rebellious spirit and a gift for making expensive things disappear.

Arissa is a rogue-type character with a dual-wielding combat style. She will readily use blades, bows, and any armor given to her. She levels as the player levels, favoring thief-oriented skills such as light armor, lockpicking and one-handed weapons. Her level is uncapped.

Enjoy getting to know Arissa along your travels as you take part in her short-but-sweet two-part main quest line, complete with a new dungeon to explore. She earns every bit of her title of "wandering rogue", having criss-crossed Skyrim the better part of the last decade. She will readily chime in with witty, interesting, and insightful comments about over 40 areas across Skyrim as you travel together. If you were searching for a bold and knowledgable companion to accompany you on your long travels, look no further. She is fully embedded in Skyrim's world and fully lore-friendly.

We promise an obsessive devotion to detail and quality while offering an experience that feels like a natural extension of the normal game. The voice acting and recording quality should sound as good as any NPC you'd encounter in the main game. The recordings are very high quality; it needs to be heard to be appreciated. The mod should also be free of typos and other grammatical errors. Every battle cry, "Uh huh", "Sure", "No thanks", and "Lead on" was carefully voice-acted and recorded by Nikkita; all dialogue spoken by Arissa is 100% original.

Special attention was paid to adding a high level of variety to common phrases in order to keep things from sounding repetitive. Attention was also paid to trying to find a "sweet spot" in her talkativeness, erring on the side of staying quiet and allowing the player to enjoy the game. We never wanted her to be annoying or repetative, and I think you'll be pleased with what we've been able to accomplish. For us, she is a joy to adventure and spend time with, and we hope you feel the same.

Arissa does not use the standard follower system in Skyrim, so she can be recruited in addition to any other follower you might have.

Special Note: Users that are arachnophobic may have a difficult time completing a portion of Arissa's main questline. Please install a spider replacer mod if this will impact you.

==================================
How To Begin
==================================

Visit the Dead Man's Drink in Falkreath. Arissa will be waiting for you there.

==================================
Talking and Commentary
==================================

Arissa can talk about the general surroundings ("What do you know about this place?"), as well as her background. She will be elusive at first, but will begin to open up as you move through her main quest.

Arissa has been all over Skyrim, and will offer comments for a wide variety of locations in the base Skyrim game (DLC areas are not yet supported). When you come close to one of these areas, Arissa will chime in. She will only speak these lines unprompted once in a fixed amount of time in order to avoid repetition.

You can select "Keep it down for a while." in order to surpress her ambient dialogue for up to 12 hours, or until you ask her to speak up again.

She will also comment on successfully picking locks, choice of armor, nearby dungeons, and more.

==================================
Regard System
==================================

We wanted to give Arissa a mind of her own and add some depth to Arissa's behavior, and have her behavior change over the course of your time spent with her. Arissa features a Regard system which determines how she feels about the player, and what tasks and favors she will be willing to perform.

Arissa will respond naturally to your actions over the course of the game. As her Regard increases, her disposition toward you will improve, unlocking new abilities. Her normal dialogue options will change in tone as well, ranging from dismissive to enthusiastic. Her Regard can also be affected (sometimes greatly) by certain dialogue options.

Arissa responds positively to acts of heroism and cunning, such as defeating difficult foes, winning brawls, performing successful sneak attacks, and more. She responds negatively to acts of murder and intimidation. She will also respond negatively to being hit by the player.

|---- COMPANION
|
|     Effect: Call of Oakshore unlocked. Summon Arissa from anywhere in Skyrim.
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


Special note: Arissa hates cannibalism. If you feed on someone while wearing the Ring of Namira while Arissa is in your service, she will leave permanently. You will not be able to re-recruit her after this, so be careful!

Currently, Arissa is accepting towards vampirism and lycanthropy.

==================================
Town Roaming and Theft
==================================

When visiting a major city in Skyrim, you can tell Arissa "You go ahead. I'll catch up with you later." Arissa will the leave your side to freely roam the city while you remain in it. She will rejoin you if asked or if you leave the city gates. Arissa will prefer to hang around and shop in alchemy and general good stores. She will retire to the local inn after dark. Arissa will not want to roam around Winterhold, it's far too cold for her tastes.

If you allow Arissa to roam past midnight, she may get up to no good... who knows what she might find?

If you leave the city, Arissa will run to rejoin you; you don't have to track her down yourself.

I hope this feature allows you to have some time apart from each other while in cities without disturbing gameplay, leading to a more organic feeling experience. Town Roaming is compatible with Open Cities of Skyrim.

==================================
Movement and Traveling
==================================

Arissa will attempt to intelligently get out of the player's way when Arissa and the player are too close, hopefully un-jamming her from doorways and halls.

When riding a horse, Arissa will automatically call her own and ride right behind you. Her horse is dismissed as soon as you dismount. Arissa is also compatible with Convenient Horses (with the available compatibility patch)! If you would like mounted combat options for Arissa, please use Convenient Horses.

==================================
Attire
==================================

Arissa wears her normal "casual" attire at the start of your journey together, and then quickly switches to a set of thief-based armor. This armor is sub-par and should be upgraded at the earliest opportunity. Arissa was designed with the modded game in mind, so please upgrade her gear to whatever you find suitable. Since her gear has lower armor value than any other armor found in the game, she should automatically wear whatever you give her.

Arissa changes to her more casual attire when left to her own devices when roaming in towns or when dismissed. She will re-equip her best equipment when you rerecruit her.

When Arissa's regard for you is high enough, you can begin managing her worn equipment. Note that this is distinct from trading with her; things given when saying "I'd like to trade some things with you." will not be worn. Select "Let's manage your equipment." instead.

==================================
Requirements
==================================

The latest version of Skyrim.

==================================
Compatibility
==================================

Compatible with other custom follower mods.
Compatible with Convenient Horses. Please download the compatibility patch.
Compatible with Wearable Lanterns.
Compatible with Campfire.
Compatible with Become A Bard.
Compatible with Open Cities of Skyrim.
Compatible with Imperious.
Compatible with SkyUI and features an optional Mod Configuration Menu. Without SkyUI, a configuration spell is given instead.

No compatibility was added for multi-follower mods; however, your gameplay should not be negatively impacted. Do not elect to "manage" Arissa using UFO or AFT or bugs may occur. EFF should be OK.

Arissa 2.2 has already been cleaned with TES5Edit for identical-to-master (ITM) edits and errors, and the edits that remain are intentional. Specifically, these edits are intentional:
* Edits to defaultWICommentTRIG
* Edits to WICommentTriggerScript
* Edits to MilitaryCampHaafingarSonsLocation
* Edits to Worldspace Tamriel 00000D74 and Block -1, 0 and children (MilitaryCampHaafingarSonsLocation, MilitaryCampHaafingarSons03, etc)

==================================
Troubleshooting
==================================

"I lost Arissa! I can't find her!"
If Arissa disappears, you can:
 * Fast travel to another location and see if she re-appears
 * Wait one in-game hour
 * If you told her to Wait and forgot where, she will return to the Dead Man's Drink in Falkreath after 2 days.
 * If you dismissed her, she will be waiting in the Dead Man's Drink in Falkreath.
 * If you told her to roam freely while in a city, leave the city. She will run to you. You may need to wait an hour for her to catch up to you.
 * If none of these solve the problem, open the console and type "set RecoverArissa to 1" and she will be returned to you in a few seconds.

"Arissa said "Excuse me" when I bumped into her, and then cowered, as if frightened."
This is a known issue that is part of her "avoidance" package to try to get her out of your way when you bump into her.

"Arissa started sandboxing / started waiting somewhere, and now she's not following me even if I move away."
Chances are high that your game (specifically your scripting system) is running poorly and my scripts are not being allowed to run. Try a new game or try disabling all other mods and see if it still happens. Arissa uses a system identical to the one used by Serana in Dawnguard to allow her to sandbox around an area when you are standing still.

"Sometimes Arissa appears that she is continuously running even though she is standing still."
This is a bug in the vanilla game. Unsheathing and sheathing your weapon usually fixes the problem.

==================================
FAQ
==================================

"Does Arissa use a custom body, face, hair, etc?"
Yes. Her body mesh and textures in the main install are the CBBE Slim Nevernude body. Her eyes are from The Eyes of Beauty. Her hair is a custom combination from Kalilie and ApachiiSkyHair. Please use the Arissa Customizer and The Hairstyler to choose exactly how you would like Arissa to look.

"Can you marry Arissa?"
Not at this time. Making her a fun and pleasing character to adventure with was more important during development.

"I am a cannibal and now Arissa hates me. Is there any way to re-recruit her?"
No, sorry.

"Is Arissa compatible with mod XYZ?"
I don't know. Why don't you try it, and let me know? There are too many things for me to test by myself. Please report incompatibilities.

"Can Arissa die?"
Only during a specific portion of her recruitment quest, if you select a certain aggressive option. Otherwise, she cannot die.

"Why won't Arissa do what I tell her to do?!"
Because her Regard is too low for what you're asking her to do. See "Regard", above.

"Is Arissa compatible with multi-follower mods such as EFF, UFO, and AFT?"
Nothing will break, but their additional follower features (probably) won't work. I haven't added compatibility for these.


==================================
Spoilers
==================================
"How do I start the second part of Arissa's main quest?"
She will approach you automatically after about 3 days of gameplay. You can also use the Wait key to wait about 3 days to force this.

"How do I get past the barred gate?"
Pull the right torch near the gate.

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
* (1.3) Thanks to Lorelai's 3D modeling and texturing support.
* (1.3) Thanks to TheRoadStroker for use of his excellent-looking Rogue Sorceress outfit.
* Thanks to Apachii, Kalilies and Nouk for Arissa's hairstyle
* Thanks to Mitchalek, for Convenient Horses compatibility.
* Thanks to ClearanceClarence, for the excellent Arissa Customizer.
* Thanks to Caliente, for the CBBE body, which Arissa uses as of Arissa 2.2.
* Thanks to LogRaam, for Arissa's eyes from The Eyes of Beauty.

* And last but not least, thanks to YOU for your patience and for playing Arissa. I hope you have great adventures together and that we get to hear about them.

==================================
Contact
==================================

Contact Chesko at chesko.tesmod@gmail.com

==================================
Permission
==================================

YOU DO NOT NEED PERMISSION TO TRANSLATE THIS MOD. YOU SHOULD CREATE A TRANSLATION PLUG-IN THAT USES COMPANIONARISSA.ESM AS A MASTER INSTEAD OF TRANSLATING THE ESM ITSELF!

You may not re-upload Arissa, in whole or in part, to any site, without express permission from the author, with the exception of archival / availability purposes in the event that Skyrim Nexus no longer exists.

You may create a plug-in file that uses CompanionArissa.esm as a master file for any reason without permission. This includes translations.


Adventure awaits!