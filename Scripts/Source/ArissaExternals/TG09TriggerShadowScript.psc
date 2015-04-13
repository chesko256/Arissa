Scriptname TG09TriggerShadowScript extends ObjectReference  Conditional

Quest Property pTG09Quest  Auto  Conditional
Spell Property pTG09ShadowSpell  Auto  Conditional

event onTriggerEnter (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG09Quest.getstage() == 70
			Game.GetPlayer().AddSpell(pTG09ShadowSpell)
			pTG09Quest.setstage(200)
		endif
	endif

endevent