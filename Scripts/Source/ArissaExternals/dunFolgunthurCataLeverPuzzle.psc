scriptName dunFolgunthurCataLeverPuzzle extends ObjectReference Conditional
{Synchronized lever-and-portcullis puzzle in Folgunthur. Used to keep all the levers and gates in sync and more explicitly manage the puzzle.}

import debug
import utility


Action property animAction auto
Bool Property SingleUse auto
Bool Property HasBeenUsed auto Conditional
Bool Property InPushedPosition auto
int Property PuzzleLeverNumber auto

ObjectReference Property Lever1 auto
ObjectReference Property Lever2 auto
ObjectReference Property Lever3 auto
ObjectReference Property Lever4 auto

ObjectReference Property Gate1 auto
ObjectReference Property Gate2 auto
ObjectReference Property Gate3 auto
ObjectReference Property Gate4 auto

Bool Lever1Up = False
Bool Lever2Up = False
Bool Lever3Up = False
Bool Lever4Up = False

Auto STATE WaitingForPlayer
	EVENT onActivate (objectReference triggerRef)
		GoToState("WaitingForLever")
		if (triggerRef == Lever1)
			Gate1.Activate(Self)
			Gate3.Activate(Self)
			Gate4.Activate(Self)
			if (Lever1Up)
				Lever1Up = False
				Lever1.playAnimationandWait("FullPull","FullPulledDown")
			Else
				Lever1Up = True
				Lever1.playAnimationandWait("FullPush","FullPushedUp")
			EndIf
			GotoState("WaitingForPlayer")
		ElseIf (triggerRef == Lever2)
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
			Gate3.Activate(Self)
			if (Lever3Up)
				Lever3Up = False
				Lever3.playAnimationandWait("FullPull","FullPulledDown")
			Else
				Lever3Up = True
				Lever3.playAnimationandWait("FullPush","FullPushedUp")
			EndIf
			GotoState("WaitingForPlayer")
		ElseIf (triggerRef == Lever4)
			Gate1.Activate(Self)
			Gate4.Activate(Self)
			if (Lever4Up)
				Lever4Up = False
				Lever4.playAnimationandWait("FullPull","FullPulledDown")
			Else
				Lever4Up = True
				Lever4.playAnimationandWait("FullPush","FullPushedUp")
			EndIf
			GotoState("WaitingForPlayer")
		EndIf
	EndEvent
EndState

STATE WaitingForLever
	Event onActivate(objectReference triggerRef)
		;Do Nothing
	EndEvent
EndState


