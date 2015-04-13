scriptName dunShroudHearthSpinnerPuzzleController extends ObjectReference
{
- A variant of BFBPuzzle01Control.psc, used for the spinner puzzle in Shroud Hearth Barrow. Key changes:
  - Activator is a pressure plate instead of a lever.
  - Once solved, the puzzle can never be un-solved-- the exit always remains open.
  - Adds the ability to delay the success links (for timing on the exit portcullis).
}

import debug
import utility

bool property puzzleSolved auto hidden
int property numPillarsSolved auto hidden

int property pillarCount auto
{Number of Puzzle Pillars}

objectReference property refActOnSuccess01 auto
{This ref is activated when puzzle is solved and lever is pulled}

objectReference property refActOnSuccess02 auto
{This ref is activated when puzzle is solved and lever is pulled}

int property refActOnSuccess01Delay auto
{Delay before activating success link #1}

int property refActOnSuccess02Delay auto
{Delay before activating success link #2. This is cumulative with refActOnSuccess01Delay.}

objectReference property refActOnFailure01 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure02 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure03 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure04 auto
{This ref is activated when puzzle is not solved and lever is pulled}


;*****************************************

EVENT onActivate(objectReference triggerRef)
; 	;Debug.Trace(puzzleSolved + " " +  numPillarsSolved + " " + pillarCount)
	if (!puzzleSolved)
		if (numPillarsSolved == pillarCount)
			puzzleSolved = True
			wait(refActOnSuccess01Delay)
			refActOnSuccess01.Activate(Self)
			wait(refActOnSuccess02Delay)
			refActOnSuccess02.Activate(Self)
		Else
			refActOnFailure01.Activate(Self)
			refActOnFailure02.Activate(Self)
			refActOnFailure03.Activate(Self)
			refActOnFailure04.Activate(Self)
		EndIf
	EndIf
EndEvent