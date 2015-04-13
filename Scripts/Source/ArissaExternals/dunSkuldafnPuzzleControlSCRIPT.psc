Scriptname dunSkuldafnPuzzleControlSCRIPT extends ObjectReference  

import debug
import utility

bool property puzzleSolved auto hidden
bool property doorOpened auto hidden
int property numPillarsSolved auto hidden
BOOL property altSolution auto hidden

objectReference property puzzleDoorActivator auto
{The Parent Activator Dummy Ref for Door} 

int property pillarCount auto
{Number of Puzzle Pillars}

objectReference property refActOnSuccess01 auto
{This ref is activated when puzzle is solved and lever is pulled}

objectReference property refActOnSuccess02 auto
{This ref is activated when puzzle is solved and lever is pulled}

objectReference property refActOnFailure01 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure02 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure03 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure04 auto
{This ref is activated when puzzle is not solved and lever is pulled}

Action property animAction auto
{This is the action the idle manager is listening for}

;*****************************************

Function doorOrDarts()
	
	IF (puzzleSolved && numPillarsSolved == 2)
		refActOnSuccess01.activate(puzzleDoorActivator)
		int openState = refActOnSuccess01.getOpenState()
		if (openState == 1 || openState == 2)
			doorOpened = true
		else
			doorOpened = false
		endif
	ELSEIF(altSolution && numPillarsSolved == 2)
		refActOnSuccess02.activate(puzzleDoorActivator)
		int openState = refActOnSuccess02.getOpenState()
		if (openState == 1 || openState == 2)
			doorOpened = true
		else
			doorOpened = false
		endif
	ELSE
		wait(1)
		puzzleSolved = false
		refActOnFailure01.activate (self as objectReference)
		refActOnFailure02.activate (self as objectReference)
		refActOnFailure03.activate (self as objectReference)
		refActOnFailure04.activate (self as objectReference)
	endif
endFunction

;*****************************************

Auto STATE pulledPosition
	EVENT onActivate (objectReference triggerRef)
		gotoState("busy")
		doorOrDarts()
		playAnimationandWait("FullPush","FullPushedUp")
		gotoState("pushedPosition")
	endEVENT
endState

;*****************************************

STATE pushedPosition
	EVENT onActivate (objectReference triggerRef)
		gotoState("busy")
		doorOrDarts()
		playAnimationandWait("FullPull","FullPulledDown")
		gotoState("pulledPosition")
	endEVENT
endState

;*****************************************

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endState
