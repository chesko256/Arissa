ScriptName DA10MaceTriggerScript extends ReferenceAlias

ReferenceAlias Property pMace Auto
ReferenceAlias Property AltarofMolagBal Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	If (akActionRef == Game.GetPlayer()) && (GetOwningQuest().GetStageDone(50) == 0)
		pMace.GetRef().Activate(Game.GetPlayer())
		AltarofMolagBal.GetRef().Activate(Game.GetPlayer())
	EndIf

EndEvent