ScriptName DA01ShrineofAzuraScript extends ReferenceAlias

ReferenceAlias Property pAzura auto

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer()
		If GetOwningQuest().GetStageDone(60) == 1 || GetOwningQuest().GetStageDone(62) == 1
			Self.GetRef().Activate(Game.GetPlayer())
			;pAzura.GetActorRef().Activate(Game.GetPlayer())
		EndIf
	EndIf

EndEvent