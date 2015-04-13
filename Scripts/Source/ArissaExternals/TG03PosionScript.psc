Scriptname TG03PosionScript extends ReferenceAlias  Conditional

int Property pTG03PickedUp  Auto  Conditional
Quest Property pTG03Quest  Auto  Conditional

event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG03PickedUp == 0
			pTG03Quest.setstage(90)
			pTG03PickedUp = 1
		endif
	endif

endevent