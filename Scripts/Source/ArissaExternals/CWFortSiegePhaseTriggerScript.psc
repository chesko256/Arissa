Scriptname CWFortSiegePhaseTriggerScript extends ReferenceAlias

;This script is on the TriggerPhaseXX aliases in CWFortSiegePhase. All they do is call a function on their parent script which holds more of the logic

bool Property RequireStage10 = false Auto
{Default false; Does stage 10 need to be set before the triggerboxes work? Needed for the final siege of Solitude, so it doesn't do anything if things are running but not active waiting for Dark Brotherhood blocker}

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()

		if RequireStage10 && GetOwningQuest().GetStageDone(10) == False
; 			CWScript.Log("CWFortSiegeScript", self + "RequireStage10 is true, and stage 10 hasn't been set. NOT updating battle phase.")
			;do nothing
			
		Else
; 			CWScript.Log("CWFortSiegeScript", self + "OnTriggerEnter() Player entered, calling SetStageBasedOntrigger()")
			(GetOwningQuest() as CWFortSiegeScript).SetStageBasedOnTrigger(GetReference())

		
		EndIf

	

	EndIf
EndEvent


