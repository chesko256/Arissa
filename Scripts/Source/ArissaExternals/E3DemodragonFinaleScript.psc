scriptName E3DemodragonFinaleScript extends objectReference
{Script to handle outro details when final Dragon dies for 2011 demo}

import utility

imageSpaceModifier property fadeOutFX auto
{fade to black and hold for a long while to endcap the demo}
imageSpaceModifier property BlackOutFX auto
{fade to black and hold for a long while to endcap the demo}
dragonActorScript property dragon auto
{set to the ref of the dragon this same script lives on}
spell property fireStorm auto
{the firestorm spell for anim}
sound property QSTDemoFinalShout auto
{Battle cry for player while sucking up the juices}

bool safetyOne
bool safetyTwo

EVENT onLoad()
	blockActivation()
endEVENT

EVENT onDeath(actor killer)

	if dragon == NONE
; 		debug.trace("E3 Demo: Something is wrong. Dragon var is NONE on "+self)
		dragon = (self as ObjectReference) as dragonActorScript
	endif

; 	debug.trace("DEMODRAGON: Dragon has Died")
	while dragon.getState() != "deadDisintegrated"
		utility.wait(0.1)
	endWhile
	
; 	debug.trace("DEMODRAGON: Player is close now")
	
	; add firestorm & skill if needed
	if (game.getPlayer()).hasSpell(fireStorm) == FALSE
		(game.getPlayer()).addSpell(fireStorm)
		(game.getPlayer()).setActorValue("destruction", 100)
	endif
	
	; kick off the sequence
	finale()
		
endEVENT

EVENT onActivate(objectReference Actronaut) 
	if actronaut == game.getPlayer() && (dragon as actor).isDead() == TRUE
		if safetyOne == FALSE
; 			debug.trace("[E3 Demo]Finale Safety Net ONE")
			dragon.gotoState("deadAndWaiting")
			safetyOne = TRUE
		elseif safetyOne == TRUE && safetyTwo == FALSE
; 			debug.trace("[E3 Demo]Finale Safety Net TWO")
			finaleQuick()
			safetyTwo == TRUE
		elseif safetyOne == TRUE && safetyTwo == TRUE
; 			debug.trace("[E3 Demo]Finale Safety Net THREE")
			game.QuitToMainMenu()
			game.playBink("skyrimlogo.bik")
		endif
	endif
endEVENT

FUNCTION finale()
; 	debug.trace("DEMODRAGON: Begin Finale Func")
	; player is within range.  Wait a bit for FX to ramp up
	
	utility.wait(7.1)
	(game.getPlayer()).equipSpell(fireStorm, 0)
	utility.wait(3.0)
	
	utility.wait(3.0)
	QSTDemoFinalShout.Play(game.getPlayer())
	
	utility.wait(1.5)
	fadeOutFX.apply(1.0)
	
	utility.wait(3.0)
	blackOutFX.apply(1.0)
	;fadeOutFX.remove()
	game.QuitToMainMenu()
	game.PlayBink("skyrimlogo.bik")
endFUNCTION

FUNCTION finaleQuick()
	; part of the safety net to attempt a graceful end if something fails.
	;QSTDemoFinalShout.Play(game.getPlayer())
	;(game.getPlayer()).equipSpell(fireStorm, 0)

	;utility.wait(1.5)
	fadeOutFX.apply(1.0)
	
	utility.wait(3.0)
	blackOutFX.apply(1.0)
	;fadeOutFX.remove()
	game.QuitToMainMenu()
	game.PlayBink("skyrimlogo.bik")
endFUNCTION
