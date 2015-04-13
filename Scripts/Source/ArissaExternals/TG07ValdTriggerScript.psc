Scriptname TG07ValdTriggerScript extends ObjectReference  Conditional

Quest Property pTG07Quest  Auto  Conditional
ReferenceAlias Property pTG07Vald Auto Conditional
Faction Property pTG07ValdFaction Auto Conditional
int Property pTG07Done Auto Conditional
GlobalVariable Property pTG07ValdTriggered Auto Conditional

Event OnTriggerEnter (ObjectReference akActionRef)

	if pTG07ValdTriggered.Value == 0
		if pTG07Done == 0
			if pTG07Quest.GetStageDone(48) == 0
				if akActionRef == Game.GetPlayer()
					pTG07Vald.GetActorRef().AddToFaction(pTG07ValdFaction)
					pTG07Done = 1
					pTG07ValdTriggered.Value = 1					
					Disable()
				endif
			endif
		endif
	endif

endEvent