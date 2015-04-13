scriptname dunHalldirRotatingDoorPuzzle extends objectReference
{Combined Puzzle Lever & Rotating Door Lever for Halldir's Cairn.}

import debug
import utility
import game


;Is the puzzle solved?
bool puzzleSolved

;Is the door currently closed?
bool doorClosed

;How many pillars have been solved?
int property numPillarsSolved auto

Sound property FailSFX Auto

float lastActivatedTime

objectReference property Door01 auto
{The rotating door.}

int property pillarCount auto
{Number of Puzzle Pillars}

objectReference property refActOnFailure01 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure02 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure03 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure04 auto
{This ref is activated when puzzle is not solved and lever is pulled}


EVENT onLoad()
	;We'll have to manage activation manually.
	Utility.Wait(0.25)
	door01.playAnimation("SnapOpen")
	playAnimationAndWait("FullPull","FullPulledDown")
endEVENT

Event OnReset()
	door01.playAnimation("SnapOpen")
	playAnimationAndWait("FullPull","FullPulledDown")
EndEvent

Auto STATE WaitingForPuzzle
	Event OnActivate(objectReference triggerRef)
; 		;Debug.Trace("Solved: " + numPillarsSolved + "/" + PillarCount)
		GoToState("Busy")
		if (numPillarsSolved == PillarCount)
			doorClosed = True
			GoToState("Active")
			Self.Activate(Game.GetPlayer())
		Else
			FailSFX.Play(Self)
			refActOnFailure01.activate (self as objectReference)
			refActOnFailure02.activate (self as objectReference)
			refActOnFailure03.activate (self as objectReference)
			refActOnFailure04.activate (self as objectReference)
			playAnimationAndWait("FullPush","FullPushedUp")
			playAnimationAndWait("FullPull","FullPulledDown")
			GoToState("WaitingForPuzzle")
		endif
	EndEvent
endSTATE

STATE Active
	EVENT onActivate (objectReference triggerRef)
		GoToState("Busy")
		IF(doorClosed)
			if (numPillarsSolved == PillarCount)
				door01.playAnimation("RotateClosed")
				playAnimationAndWait("FullPush","FullPushedUp")
				Utility.Wait(1.5)
				doorClosed = False	
			EndIf
		ELSE
			door01.playAnimation("RotateOpen")
			playAnimationAndWait("FullPull","FullPulledDown")
			Utility.Wait(1.5)
			doorClosed = True
		ENDIF
		if (numPillarsSolved == PillarCount)
			GoToState("Active")
		Else
			FailSFX.Play(Self)
			refActOnFailure01.activate (self as objectReference)
			refActOnFailure02.activate (self as objectReference)
			refActOnFailure03.activate (self as objectReference)
			refActOnFailure04.activate (self as objectReference)
			GoToState("WaitingForPuzzle")
		EndIf
	ENDEVENT
endSTATE

State Busy
	EVENT onActivate (objectReference triggerRef)
	EndEvent
EndState