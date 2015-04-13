Scriptname SnowVeilKeyholeScript extends ObjectReference  
{
- This script lives on the Hall of Stories keyhole
- Each ring should have its linkedRef point to the keyhole
}


import debug
import utility

bool property puzzleSolved auto hidden
bool property doorOpened auto hidden
int property numRingsSolved auto hidden

Message property ActivateWithoutObjMessage auto

objectReference property doorBase auto
{base piece of the door} 

objectReference property largeRing auto
{large rotating disk of the door}

objectReference property mediumRing auto
{medium rotating disk of the door}

objectReference property smallRing auto
{small rotating disk of the door}

objectReference property doorFX auto
{dust FX for when doors opens}

int property ringCount auto
{number of rotating disks}

objectReference property refActOnFailure01 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure02 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure03 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure04 auto
{This ref is activated when puzzle is not solved and lever is pulled}

MiscObject property myMiscObject auto
{the MiscObject needed to activate the keyhole}

Quest property myQuest auto
{if needed, the quest to update}

Quest Property AltQuest auto
{if needed, the alternate quest to update}

int property myQuestStageSuccess auto
{if needed, what stage to set the quest upon success}

int Property myAltQuestStageSuccess auto
{if needed, what alternate stage to set the quest upon success}

objectReference property backDoorActivator auto
{This ref is the the activator that opens the door from behind regardless of solve state}

;************************************

Function openDoor()
	gotoState("done")
	;play FX
	doorFX.playAnimation("FXDoorOpen")
	
	;open main door
	doorBase.playAnimation("Open")
	
	;open the the pieces
	largeRing.playAnimation("Open")
	mediumRing.playAnimation("Open")
	smallRing.playAnimation("Open")
	
	;open self
	playAnimation("Open")
	
	;if there is a myQuest, and it's running, set it's stage.
	if (myQuest)
		if myQuest.IsRunning()
			myQuest.setStage(myQuestStageSuccess)
		endif
	endif	
	
	;if there is an AltQuest, and it's running, set it's stage.
	if (AltQuest)
		if AltQuest.IsRunning()
			AltQuest.setStage(myAltQuestStageSuccess)
		endif
	endif	
	
endFunction

;************************************

Auto STATE mainState
	EVENT onActivate (objectReference triggerRef)
	if triggerref == Game.GetPlayer()
		ActivateWithoutObjMessage.Show()
	else
		Actor actorRef = triggerRef as Actor
		HallofStoriesDiskScript LRing = largeRing as HallofStoriesDiskScript
		HallofStoriesDiskScript MRing = mediumRing as HallofStoriesDiskScript
		HallofStoriesDiskScript SRing = smallRing as HallofStoriesDiskScript
		gotoState("busy")
		playAnimation("Trigger01")
		wait(3)
		gotoState("done")
		puzzleSolved = True
		openDoor()
	endif
	endEVENT
endState

;************************************

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endState

;************************************

State done
	; This is the state when the puzzle is solved and the door is opened
	; created new state for clarity, could've used busy
	Event onActivate (objectReference triggerRef)
		;do nothing
	endEvent
endState
