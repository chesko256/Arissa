Scriptname MS02BlathlocScript extends ReferenceAlias  

ReferenceAlias property pUrzoga auto

Event OnDeath(Actor akKiller)
	If akKiller != pUrzoga.GetActorRef()
		If GetOwningQuest().GetStageDone(10) == 1
			GetOwningQuest().SetStage(20)
		EndIf
	EndIf
EndEvent

Event OnUnload()
	If (GetOwningQuest().GetStageDone(17) == 1)
		Self.GetActorRef().Kill()
	EndIf
endEvent