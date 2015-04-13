Scriptname C04GlenmorilWitchHeadScript extends ObjectReference

Quest Property C04 auto
Quest Property CR13 auto
ReferenceAlias Property Head auto ; on CR13
ActorBase Property C04GlenmorilWitch auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		Utility.Wait(0.1)
		if (akOldContainer.GetBaseObject() == C04GlenmorilWitch)
			ObjectReference body = GetLinkedRef()
; 			Debug.Trace("C04: Collecting head; new body is " + body)
			body.MoveTo(akOldContainer)
			body.Enable()
			akOldContainer.RemoveAllItems(body)
			akOldContainer.Delete()
		endif
		if (30 > C04.GetStage())
			if (Game.GetPlayer().GetItemCount(self) >= 1) ; >= (C04 as C04QuestScript).TotalWitches)
				C04.SetStage(30)
			endif
		endif
		if (CR13.IsRunning())
			if (Head.GetReference() == None)
				Head.ForceRefTo(self)
			endif
			if (CR13.GetStage() == 10)
				CR13.SetStage(15)
			endif
		endif
	endif
EndEvent


