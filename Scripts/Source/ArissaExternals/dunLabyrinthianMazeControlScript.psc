Scriptname dunLabyrinthianMazeControlScript extends ObjectReference  

import game

bool property bDestructionClear auto
bool property bIllusionClear auto
bool property bRestorationClear auto
bool property bAlterationClear auto

bool hasSolved

activator property SummonTargetFXActivator auto
objectReference property summonPoint auto
objectReference property DremoraPoint auto
objectReference property ReappearPlayerPoint auto
objectReference property ReappearDremoraPoint auto

actorBase property lvlAtronachAny auto

objectReference property atronach01SummonPoint auto
objectReference property atronach02SummonPoint auto

actorBase property LvlDremoraMelee auto
armor property dunLabyrinthianMazeCircletReward auto

objectReference property myPortal auto

imageSpaceModifier property dunLabyrinthianMazeFadeImod auto

FUNCTION checkMaze()
	if bDestructionClear == TRUE && bIllusionClear == TRUE && bRestorationClear == TRUE && bAlterationClear == TRUE
; 		debug.trace("Labyrinthian Maze Elements all set!")
		; add an extra check here to avoid double-up if player double-casted at the last tablet
		if hasSolved == FALSE
			hasSolved = TRUE
			solveMaze()
		endif
	else
; 		debug.trace("Labyrinthian Maze not solved yet")
	endif
endFUNCTION

FUNCTION SolveMaze()
	; this function is fired from one of the dunLabyrinthianMazeTabletScript objects
	; whenever the four magical tablets have been "solved"
; 	debug.trace("Labyrinthian Maze: Player has used four pre-requisite Elements, now conjure player")
	
	; enable the portal beneath the maze
	myPortal.enable()
	utility.wait(0.1)
	myPortal.playAnimation("playAnim02")
	
	objectReference dremoraREF = dremoraPoint.placeatme(LvlDremoraMelee)
	(dremoraREF as actor).addItem(dunLabyrinthianMazeCircletReward,1)
	(dremoraREF as actor).equipItem(dunLabyrinthianMazeCircletReward,TRUE)
	
	While getPlayer().getDistance(summonPoint) > 256
		; wait until player has come through the portal
		utility.wait(2.0)
	endWhile
	
	while (dremoraREF as actor).getActorValuePercentage("Health") > 0.75
		; wait until dremora falls below 75% HP
		utility.wait(1.0)
	endWhile
	
	myPortal.disable()
	dremoraREF.placeatme(SummonTargetFXActivator)
	
	utility.wait(0.33)
	(dremoraREF as actor).moveto(reappearDremoraPoint)
	getPlayer().placeatme(SummonTargetFXActivator)
	
	utility.wait(0.33)
	getPlayer().moveto(reappearPlayerPoint)
	reappearPlayerPoint.placeatme(SummonTargetFXActivator)
	reappearDremoraPoint.placeatme(SummonTargetFXActivator)
	
	; summon in reinforcements
	utility.wait(1.75)
	atronach01SummonPoint.placeatme(SummonTargetFXActivator)
	utility.wait(0.33)
	atronach01SummonPoint.placeatMe(lvlAtronachAny)
	atronach02SummonPoint.placeatme(SummonTargetFXActivator)
	utility.wait(0.33)
	atronach02SummonPoint.placeatMe(lvlAtronachAny)
	
	while (dremoraREF as actor).isDead() == FALSE
		; wait until dremora has been killed
		utility.wait(1.0)
	endWhile
	
endFUNCTION

	;;this function is fired from one of the dunLabyrinthianMazeTabletScript objects
	;;whenever the four magical tablets have been "solved"
; 	; debug.trace("Labyrinthian Maze: Player has used four pre-requisite Elements, now conjure player")
	;;pause a moment so it's not too jarring
	; utility.wait(0.25)
	; shakeController(0.1,0.5,2.0)
	; getPlayer().placeatme(SummonTargetFXActivator)
	; objectReference dremoraREF = dremoraPoint.placeatme(LvlDremoraMelee)
	; dunLabyrinthianMazeFadeImod.apply()
	; disablePlayerControls(true,false)
	
	; utility.wait(1.66)
	; getPlayer().placeatme(SummonTargetFXActivator)
	; summonPoint.placeatme(SummonTargetFXActivator)
	
	; utility.wait(0.33)
	; getPlayer().moveTo(summonPoint)
	; dunLabyrinthianMazeFadeImod.remove()
	;;enable the player controls and spawn in the enemy
	
	; utility.wait(0.33)
	; (dremoraREF as actor).setAV("aggression",0)
	; (dremoraREF as actor).addItem(dunLabyrinthianMazeCircletReward,1)
	; (dremoraREF as actor).equipItem(dunLabyrinthianMazeCircletReward,TRUE)
	
	;;Need a better way to wait for the Dremora to finish his anim/ritual...
	; utility.wait(10.0)
	; dunLabyrinthianMazeFadeImod.apply()
	
	; utility.wait(1.66)
	; dremoraREF.placeatme(SummonTargetFXActivator)
	; getPlayer().placeatme(SummonTargetFXActivator)
	;;standard wait time for summon FX
	
	; utility.wait(0.33)
	; enablePlayerControls()
	; (dremoraREF as actor).moveto(reappearDremoraPoint)
	; getPlayer().moveto(reappearPlayerPoint)
	; reappearPlayerPoint.placeatme(SummonTargetFXActivator)
	; reappearDremoraPoint.placeatme(SummonTargetFXActivator)
	
	;;give a grace period while the player is disoriented
	; utility.wait(0.33)
	; (dremoraREF as actor).setAV("variable07",1)
	; (dremoraREF as actor).setAV("aggression",2)
	; (dremoraREF as actor).startCombat(getPlayer())
	; (dremoraREF as actor).evaluatePackage()
