Scriptname E3demoWolfEncounterScript extends ObjectReference  

objectReference property AlphaWolf auto
objectReference property wolf01 auto
objectReference property wolf02 auto
objectReference property wolf03 auto

sound property NPCWolfHowl auto

idle property wolfAnim auto

bool done = FALSE

EVENT onLoad()
	(alphaWolf as actor).setAV("aggression", 0)
	(wolf01 as actor).setAV("aggression", 0)
	(wolf02 as actor).setAV("aggression", 0)
	(wolf03 as actor).setAV("aggression", 0)
endEVENT


EVENT onTriggerEnter(objectReference actronaut)
	if !done
		done = TRUE
		; first have the alpha walk to the rock's edge...
		;(alphaWolf as actor).pathToReference(alphaWolf.getLinkedRef(),0.8)
		
		utility.wait(2.0)
		(alphaWolf as actor).playIdle(wolfAnim)
		NPCWolfHowl.play(alphaWolf)
		;(wolf01 as actor).pathToReference(game.getPlayer(),1)
		;(wolf02 as actor).pathToReference(game.getPlayer(),1)
		;(wolf03 as actor).pathToReference(game.getPlayer(),1)
		
		utility.wait(0.14)
		;(alphaWolf as actor).pathToReference(game.getPlayer(),1)
		
		utility.wait(0.24)
		actor player = game.getPlayer() as actor
		
		(wolf01 as actor).setAV("aggression", 1)
		(wolf02 as actor).setAV("aggression", 1)
		(wolf03 as actor).setAV("aggression", 1)

		(wolf01 as actor).startCombat(player)
		(wolf02 as actor).startCombat(player)
		(wolf03 as actor).startCombat(player)
		
		utility.wait(1.55)
		(alphaWolf as actor).startCombat(player)
		(alphaWolf as actor).setActorValue("aggression", 1)
	endif
endEVENT
