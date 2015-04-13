ScriptName MarkarthIntroSceneTriggerScript extends ObjectReference

ReferenceAlias Property pActor1 Auto
ReferenceAlias Property pActor2 Auto
Int Property iTriggerCount Auto
Quest Property pMyQuest Auto

Function IncrementSceneCount()
	iTriggerCount = iTriggerCount + 1
; 	;Debug.Trace(iTriggerCount)
EndFunction

Function DecrementSceneCount()
	;iTriggerCount = iTriggerCount - 1
; 	;Debug.Trace(iTriggerCount)
EndFunction

auto STATE waiting
	Event OnTriggerEnter(ObjectReference akActionRef) 

		If pActor1.GetActorRef() == akActionRef
			IncrementSceneCount()
; 			Debug.Trace(pActor1.getActorRef() + "has entered Trigger")
		EndIf

		If pActor2.GetActorRef() == akActionRef
			IncrementSceneCount()
; 			Debug.Trace(pActor2.getActorRef() + "has entered Trigger")
		EndIf

			
		If (Game.GetPlayer() == akActionRef) && iTriggerCount >= 2
			pMyQuest.SetStage(10)
			gotoState("HasBeenTriggered")
; 			debug.Trace("Player has entered Markarth Intro Trigger")
		EndIf

	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)

		If pActor1.GetActorRef() == akActionRef
; 			;Debug.Trace(pActor1.getActorRef() + "has left Trigger")
			DecrementSceneCount()
		EndIf

		If pActor2.GetActorRef() == akActionRef
; 			;Debug.Trace(pActor2.getActorRef() + "has left Trigger")
			DecrementSceneCount()
		EndIf

	EndEvent
EndState

STATE HasBeenTriggered
;do nothing
endSTATE