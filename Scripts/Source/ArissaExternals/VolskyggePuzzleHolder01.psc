scriptName VolskyggePuzzleHolder01 extends ObjectReference
{
- This script lives on the puzzle holders in Volskygge02
- When activated, checks to see if player has puzzle pieces, if so, place it on the holder
}

import debug
import utility
import quest

dunVolskyggePuzzleControl myLinkedRef
bool property holderSolved auto hidden

MiscObject property puzzlePiece auto
{puzzle piece taken by player}

Static property puzzlePieceStatic auto
{puzzle piece placed on holder}

ObjectReference property puzzleHolderLight auto
{light to enable once puzzle piece is placed}

ObjectReference property puzzleHolder auto
{xmarker where the puzzle piece will be placed}

Message property holderMessage auto

Quest property dunVolskyggeQST auto
dunVolskyggeQstSCRIPT myQuest


Event OnLoad()
	myLinkedRef = GetLinkedRef() as dunVolskyggePuzzleControl
	myQuest = dunVolskyggeQST as dunVolskyggeQstSCRIPT
endEvent

Auto State holderEmpty
	;holder does not have a puzzle piece on it
	Event onActivate (ObjectReference triggerRef)
		if (game.GetPlayer().GetItemCount(puzzlePiece) >=1)
			gotoState ("done")
			;remove item from inventory
			game.GetPlayer().RemoveItem(puzzlePiece, 1)
			;place puzzle piece on puzzleHolder
			puzzleHolder.placeAtMe(puzzlePieceStatic, 1)
			puzzleHolderLight.enable(1)
			;update the control script and check to see if puzzle has been solved
			myLinkedRef.numPuzzleHoldersSolved = myLinkedRef.numPuzzleHoldersSolved + 1
			if (myLinkedRef.puzzleSolved == False)
				if (myLinkedRef.numPuzzleHoldersSolved == myLinkedRef.puzzleHolderCount)
					;puzzle has been solved
					myLinkedRef.puzzleSolved = True
					myQuest.puzzleSolved = True
					myLinkedRef.refActOnSuccess01.activate(myLinkedRef.puzzleDoorActivator)
					myQuest.setstage(30)
				endif
			endif
		else
			holderMessage.Show()
		endif
	endEvent
endState

State done
	Event onActivate (ObjectReference triggerRef)
		;do nothing
	endEvent
endState

	