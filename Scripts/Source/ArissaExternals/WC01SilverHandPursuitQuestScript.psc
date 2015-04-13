Scriptname WC01SilverHandPursuitQuestScript extends Quest  

ReferenceAlias Property LeadHunter auto
ObjectReference Property HunterStartingPoint auto
Quest Property CureQuest auto

bool Property ResHunter auto
bool Property ForceResHunter auto

Event OnUpdate()
	if (CureQuest.GetStage() >= 10)
		if (!LeadHunter.GetReference().IsNearPlayer())
			LeadHunter.GetReference().Disable()
			SetStage(100)
		endif
		return
	endif

	if (ForceResHunter)
		LeadHunter.GetReference().Reset()
		LeadHunter.GetReference().Enable()
		ForceResHunter = false
		return
	endif

	if (ResHunter)
		;Debug.MessageBox("Trying to resurrect hunter...")
		if (!LeadHunter.GetReference().IsNearPlayer() && !HunterStartingPoint.IsNearPlayer())
			;Debug.MessageBox("Resurrecting hunter")
			LeadHunter.GetReference().Reset()
			LeadHunter.GetReference().Enable()
			ResHunter = false
		endif
	endif

	if (LeadHunter.GetActorReference().IsDead())
		ResHunter = true
	endif
endEvent