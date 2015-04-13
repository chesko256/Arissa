Scriptname TG07MercersPlansScript extends ReferenceAlias  Conditional

int Property pTG07Obtained  Auto  Conditional
Quest Property pTG07Quest  Auto  Conditional

event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG07Quest.getstage() >= 50 && pTG07Quest.getstage() < 60
			pTG07Quest.setstage(60)
			pTG07Obtained = 1
		endif
	endif

endevent