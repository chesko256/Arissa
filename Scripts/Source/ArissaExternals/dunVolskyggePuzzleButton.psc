scriptName dunVolskyggePuzzleButton extends ObjectReference
{
- This script lives on the puzzle button in Volskygge01
- When activated, checks to see if it's in the correct sequence and updates variables accordingly
}

import debug
import utility
import quest

dunVolskyggePuzzleButtonControl myLinkedRef
dunVolskyggePuzzleButton myButton01
dunVolskyggePuzzleButton myButton02
dunVolskyggePuzzleButton myButton03

ObjectReference property button01 auto
ObjectReference property button02 auto
ObjectReference property button03 auto

ObjectReference property myEnableMarker auto
ObjectReference property mySoundMarker auto

int property buttonNumber auto
{1=Snake, 2=Bear, 3=Fox, 4=Wolf}

;*******************************

Event onReset()
	myEnableMarker.disableNoWait()
endEvent

;*******************************

Event OnCellLoad()
	myLinkedRef = GetLinkedRef() as dunVolskyggePuzzleButtonControl
	myButton01 = button01 as dunVolskyggePuzzleButton
	myButton02 = button02 as dunVolskyggePuzzleButton
	myButton03 = button03 as dunVolskyggePuzzleButton
endEvent

;*******************************

Auto State waiting
	;holder does not have a puzzle piece on it
	Event onActivate (ObjectReference triggerRef)
		gotoState ("busy")
		;update the control script and check to see if puzzle has been solved
		if((buttonNumber - myLinkedRef.numPuzzleButtonsSolved) == 1)
			;player has activated the correct button in the correct sequence
			myLinkedRef.numPuzzleButtonsSolved = myLinkedRef.numPuzzleButtonsSolved + 1
			myLinkedRef.mySuccessSound.play(mySoundMarker)
			myEnableMarker.enableNoWait(1)
			playAnimationandWait("Pull","Reset")
			
			;now check to see if the puzzle is solved
			if (myLinkedRef.numPuzzleButtonsSolved == myLinkedRef.numOfPuzzleButtons)
				;puzzle has been solved
				goToState("done")
				myButton01.gotoState("done")
				myButton02.gotoState("done")
				myButton03.gotoState("done")
				myLinkedRef.puzzleSolved = True
				myLinkedRef.myLightMarker.enableNoWait(1)
				myLinkedRef.mySuccessSound.play(myLinkedRef.mySoundMarker01)
				wait(1)
				myLinkedRef.myDoor01.setOpen(true)
				myLinkedRef.myDoor02.setOpen(true)
				myLinkedRef.myMusicMarker.enable()
			endif
		else
			;player has activated the incorrect button, reset vars and handle failure activations
			myLinkedRef.puzzleSolved = False
			myLinkedRef.numPuzzleButtonsSolved = 0

			if(myButton01.myEnableMarker.isEnabled())
				myLinkedRef.myFailSound.play(myButton01.mySoundMarker)
				myButton01.myEnableMarker.disableNoWait(1)
			endif

			if(myButton02.myEnableMarker.isEnabled())
				myLinkedRef.myFailSound.play(myButton02.mySoundMarker)
				myButton02.myEnableMarker.disableNoWait(1)
			endif

			if(myButton03.myEnableMarker.isEnabled())
				myLinkedRef.myFailSound.play(myButton03.mySoundMarker)
				myButton03.myEnableMarker.disableNoWait(1)
			endif

			playAnimationandWait("Pull","Reset")

			if(myEnableMarker.isEnabled())
				myLinkedRef.myFailSound.play(mySoundMarker)
				myEnableMarker.disableNoWait(1)
			else
				myLinkedRef.myFailSoundNoLight.play(mySoundMarker)
			endif
			
			if(myLinkedRef.refActOnFailureCounter <= 3)
				if(myLinkedRef.refActOnFailureCounter == 0)
					myLinkedRef.refActOnFailure01.activate(myLinkedRef)
				elseif(myLinkedRef.refActOnFailureCounter == 1)
					myLinkedRef.refActOnFailure02.activate(myLinkedRef)
				elseif(myLinkedRef.refActOnFailureCounter == 2)
					myLinkedRef.refActOnFailure03.activate(myLinkedRef)
				else
					myLinkedRef.refActOnFailure04.activate(myLinkedRef)
				endif

				myLinkedRef.refActOnFailureCounter = myLinkedRef.refActOnFailureCounter + 1
			endif
		
		endif

		if (myLinkedRef.puzzleSolved == False)
			gotoState ("waiting")
		endif
			
	endEvent
endState

;*******************************

State busy
	Event onActivate (ObjectReference triggerRef)
		;do nothing
	endEvent
endState

;*******************************

State done
	Event onActivate (ObjectReference triggerRef)
		myLinkedRef.myMessage.show()
	endEvent
endState

;*******************************