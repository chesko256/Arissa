Scriptname DA05PlayerCloseInJailScript extends ObjectReference  

Quest Property DA05 auto
ReferenceAlias Property Sinding auto
Scene Property SindingEscape auto
ObjectReference Property SindingReplantSpot auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (SindingEscape.IsPlaying() || DA05.GetStage() >= 20)
		return
	endif
	if (akActivator == Game.GetPlayer())
; 		Debug.Trace("DA05: Player close to Sinding's cell.")
		(DA05 as DA05QuestScript).PlayerCloseToSinding = true
		Sinding.GetActorReference().EvaluatePackage()
	elseif (akActivator == Sinding.GetActorReference())
; 		Debug.Trace("DA05: Sinding getting close to player.")
		(DA05 as DA05QuestScript).SindingCloseToPlayer = true
		Sinding.GetActorReference().EvaluatePackage()
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (SindingEscape.IsPlaying() || DA05.GetStage() >= 20)
		return
	endif
	if (akActivator == Game.GetPlayer())
; 		Debug.Trace("DA05: Player far from Sinding's cell.")
		(DA05 as DA05QuestScript).PlayerCloseToSinding = false
		Sinding.GetActorReference().EvaluatePackage()
	elseif (akActivator == Sinding.GetActorReference())
; 		Debug.Trace("DA05: Sinding leaving player.")
		(DA05 as DA05QuestScript).SindingCloseToPlayer = false
		Sinding.GetActorReference().EvaluatePackage()
	endif
EndEvent

Event OnCellAttach()
	if (SindingEscape.IsPlaying() || DA05.GetStage() >= 20)
		Delete()
	endif

; 	Debug.Trace("DA05: Resetting jail cell trigger.")
	Sinding.GetReference().MoveTo(SindingReplantSpot)
	(DA05 as DA05QuestScript).PlayerCloseToSinding = false
	(DA05 as DA05QuestScript).SindingCloseToPlayer = false
EndEvent
