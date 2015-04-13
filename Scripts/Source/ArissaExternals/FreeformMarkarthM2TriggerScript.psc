ScriptName FreeformMarkarthM2TriggerScript extends ObjectReference

ReferenceAlias Property pBothela Auto
ReferenceAlias Property pIldene Auto
Int iTriggerCount = 0
Scene Property pBothelaScene Auto
Quest Property pFreeformMarkarthM2 Auto

Function IncrementBothelaScene()
	iTriggerCount = iTriggerCount + 1
	If iTriggerCount == 3
		pFreeformMarkarthM2.SetStage(5)
	EndIf
EndFunction

Function DecrementBothelaScene()
	iTriggerCount = iTriggerCount - 1
EndFunction


Event OnTriggerEnter(ObjectReference akActionRef) 

	If pBothela.GetActorRef() == akActionRef
		IncrementBothelaScene()
	EndIf

	If pIldene.GetActorRef() == akActionRef
		IncrementBothelaScene()
	EndIf

		
	If Game.GetPlayer() == akActionRef
		IncrementBothelaScene()
	EndIf

EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)

	If pBothela.GetActorRef() == akActionRef
		DecrementBothelaScene()
	EndIf

	If pIldene.GetActorRef() == akActionRef
		DecrementBothelaScene()
	EndIf

		
	If Game.GetPlayer() == akActionRef
		DecrementBothelaScene()
	EndIf

EndEvent
