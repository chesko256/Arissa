Scriptname dunLabyrinthianMazeTabletScript extends ObjectReference  
{Script for the magic target tablets in Labyrinthian's Maze}

bool property isDestruction auto
bool property isAlteration auto
bool property isRestoration auto
bool property isIllusion auto

Sound Property WrongSpellSFX  Auto  
Sound Property CorrectSpellSFX  Auto  

dunLabyrinthianMazeControlScript property MazeControl auto

bool property done auto
bool property FXon auto hidden

objectReference property linkToActivate auto
bool continueUpdating = FALSE

EVENT onLoad()
	continueUpdating = TRUE
	registerForSingleUpdate(1.0)
endEVENT

EVENT onUpdate()
	if !FXon
		if game.getPlayer().getDistance(self) < 512 && done == FALSE
			; if the player is nearby, turn on the FX anim
			playAnimation("playanim02")
			FXon = TRUE
		endif
	else
		if game.getPlayer().getDistance(self) > 768 && done == FALSE
			; and if the player walks away without solving, turn them off
			playAnimation("playanim01")
			FXon = FALSE
		endif
	endif
	
	if continueUpdating
		registerForSingleUpdate(1.0)
	endif
	
endEVENT

EVENT onActivate(ObjectReference actronaut)
	; Not meant to be activated directly.  Play negative feedbackSFX
	WrongSpellSFX.play(self)
endEVENT

EVENT OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	debug.trace("hit by "+akCaster+" with "+akEffect)
	; for now we can't test school so react to any magic effect
	if done == FALSE
		if (akEffect.getAssociatedSkill() == "Destruction") && isDestruction
			solveMe(akCaster)
		elseif (akEffect.getAssociatedSkill() == "Alteration") && isAlteration
			solveMe(akCaster)
		elseif (akEffect.getAssociatedSkill() == "Restoration") && isRestoration
			solveMe(akCaster)
		elseif (akEffect.getAssociatedSkill() == "Illusion") && isIllusion
			solveMe(akCaster)
		else
			; Must have been hit with an incorrect spell type.  Play negative feedback SFX
			WrongSpellSFX.play(self)
		endif
	endif
endEVENT

FUNCTION SolveMe(objectReference whoSolved)
	if isDestruction
		MazeControl.bDestructionClear = TRUE
	elseif isAlteration
		MazeControl.bAlterationClear = TRUE
	elseif isRestoration
		MazeControl.bRestorationClear = TRUE
	elseif isIllusion
		MazeControl.bIllusionClear = TRUE
	endif
	done = TRUE
	;unregisterForUpdate()
	continueUpdating = FALSE
	playAnimation("playanim01")
	CorrectSpellSFX.play(self)
	linkToActivate.Activate(whoSolved)
	linkToActivate.setOpen()
	mazeControl.checkMaze()
endFUNCTION

