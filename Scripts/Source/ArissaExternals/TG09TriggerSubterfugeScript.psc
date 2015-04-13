Scriptname TG09TriggerSubterfugeScript extends ObjectReference  Conditional

Quest Property pTG09Quest  Auto  Conditional
Spell Property pTG09SubterfugeSpell  Auto  Conditional

event onTriggerEnter (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG09Quest.getstage() == 70
			Game.GetPlayer().AddSpell (pTG09SubterfugeSpell)
			pTG09Quest.setstage(200)
		endif
	endif

endevent
