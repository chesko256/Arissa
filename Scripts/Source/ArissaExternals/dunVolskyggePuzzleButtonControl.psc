scriptName dunVolskyggePuzzleButtonControl extends ObjectReference

{
-This script checks to see if puzzle has been solved and then opens portcullis
}

import debug
import utility

bool property puzzleSolved = False auto hidden
int property numPuzzleButtonsSolved = 0 auto hidden
int property refActOnFailureCounter = 0 auto hidden
int property numOfPuzzleButtons auto

ObjectReference property myMusicMarker auto
ObjectReference property myLightMarker auto

ObjectReference property mySoundMarker01 auto

Sound property mySuccessSound auto
Sound property myFailSound auto
Sound property myFailSoundNoLight auto

Message property myMessage auto

ObjectReference property refActOnFailure01 auto
ObjectReference property refActOnFailure02 auto
ObjectReference property refActOnFailure03 auto
ObjectReference property refActOnFailure04 auto

ObjectReference Property myDoor01 auto
ObjectReference Property myDoor02 auto

Event onReset()
	puzzleSolved = False
	numPuzzleButtonsSolved = 0
	refActOnFailureCounter = 0
	myLightMarker.disableNoWait()
	myMusicMarker.disableNoWait()
endEvent
