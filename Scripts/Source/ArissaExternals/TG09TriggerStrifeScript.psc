Scriptname TG09TriggerStrifeScript extends ObjectReference  Conditional

Quest Property pTG09Quest  Auto  Conditional
Spell Property pTG09StrifeSpell  Auto  Conditional

event onTriggerEnter (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG09Quest.getstage() == 70
			Game.GetPlayer().AddSpell (pTG09StrifeSpell)
			pTG09Quest.setstage(200)
		endif
	endif

endevent
