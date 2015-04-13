Scriptname DB05MoveRefOnLostLOS extends ObjectReference  
{move reference alias when player isn't looking at target}

ReferenceAlias property myRefAlias auto

ObjectReference property myLookTarget auto
{the target that when player looks away, triggers the enable/disable}

ObjectReference property myMoveToTarget auto

Quest property myQuest auto

;************************************

Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
	if((myRefAlias) && (myQuest.getStage() == 20))
		myRefAlias.getReference().moveto(myMoveToTarget)
             DB05Script pScript = pDB05 as DB05Script
		pScript.VeezaraShowed = 1
	endif
endEvent

;************************************

auto State doNothing
	;do nothing - waiting for DB to put me in a new state
endState

;************************************

State Waiting
	Event onBeginState()
		gotoState("doNothing")
		RegisterForSingleLOSLost(Game.GetPlayer(), myLookTarget)
	endEvent
endState

;************************************
quest Property pDB05  Auto  
