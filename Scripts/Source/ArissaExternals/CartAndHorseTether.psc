Scriptname CartAndHorseTether extends ObjectReference  
{Tether a horse to the prisoner cart.}

ObjectReference Property TheHorse Auto
{The horse to tether to.}

Event OnCellLoad()
	; Temp for testing
	if TestCartOn.GetValue() == 1
		enable()
	endif

	if isEnabled() == 0
		return
	endif

	; move horse to "tether" marker (if they exist)
	if TheHorse && GetLinkedRef()
		TheHorse.Moveto(GetLinkedRef())
		(TheHorse as Actor).SetRestrained(true)
	endif
	self.TetherToHorse(TheHorse)
	if StopMotionFlag
		SetMotionType(Motion_Keyframed)
	else
		SetMotionType(Motion_Dynamic)
	endif
EndEvent

bool Property StopMotionFlag  Auto  
{set to true to put cart into an immobile state}

GlobalVariable property TestCartOn auto
{ if true, enable me}
