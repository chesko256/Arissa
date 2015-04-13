Scriptname TG09PedestalScript extends ObjectReference  Conditional

Quest Property pTG09Quest  Auto  Conditional
MiscObject Property pTG08SkeletonKey  Auto  Conditional

event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG09Quest.getstage() == 40
			pTG09Quest.setstage(45)
			game.getplayer().removeitem(pTG08SkeletonKey,1)
			Disable()
		endif
	endif

endevent