scriptName dunShroudHearthCataLeverPuzzle extends ObjectReference Conditional
{Activation manager for the catacomb lever puzzle at the beginning of Shroud Hearth Barrow. Ensures the levers stay in sync so the player can't get stuck.}

import debug
import utility


Quest property dunShroudHearthQST auto
Action property animAction auto
Bool Property SingleUse auto
Bool Property HasBeenUsed auto Conditional
Bool Property InPushedPosition auto
int Property PuzzleLeverNumber auto

ObjectReference Property Lever1 auto
ObjectReference Property Lever2 auto
ObjectReference Property Lever3 auto

ObjectReference Property Gate1 auto
ObjectReference Property Gate2 auto
ObjectReference Property Gate3 auto

Bool Lever1Up = False
Bool Lever2Up = False
Bool Lever3Up = False

Auto STATE WaitingForPlayer
	EVENT onActivate (objectReference triggerRef)
; 		Debug.Trace("Activation in Waiting for Player State")
		GoToState("WaitingForLever")
		dunShroudHearthQST.SetStage(15)
		if (triggerRef == Lever1)
			Gate1.Activate(Self)
			Gate3.Activate(Self)
			if (Lever1Up)
				Lever1Up = False
				Lever1.playAnimationandWait("FullPull","FullPulledDown")
			Else
				Lever1Up = True
				Lever1.playAnimationandWait("FullPush","FullPushedUp")
			EndIf
			GotoState("WaitingForPlayer")
		ElseIf (triggerRef == Lever2)
			Gate1.Activate(Self)
			Gate2.Activate(Self)
			Gate3.Activate(Self)
			if (Lever2Up)
				Lever2Up = False
				Lever2.playAnimationandWait("FullPull","FullPulledDown")
			Else
				Lever2Up = True
				Lever2.playAnimationandWait("FullPush","FullPushedUp")
			EndIf
			GotoState("WaitingForPlayer")
		ElseIf (triggerRef == Lever3)
			Gate1.Activate(Self)
			Gate2.Activate(Self)
			if (Lever3Up)
				Lever3Up = False
				Lever3.playAnimationandWait("FullPull","FullPulledDown")
			Else
				Lever3Up = True
				Lever3.playAnimationandWait("FullPush","FullPushedUp")
			EndIf
			GotoState("WaitingForPlayer")
		EndIf
	EndEvent
EndState

STATE WaitingForLever
	Event onActivate(objectReference triggerRef)
; 		Debug.Trace("Activation in Waiting for Lever State")
		;Do Nothing
	EndEvent
EndState

Event OnReset()
	;All the portculli reset automatically, so just reset the levers.
	Lever1.playAnimation("FullPull")
	Lever2.playAnimation("FullPull")
	Lever3.playAnimation("FullPull")
EndEvent


