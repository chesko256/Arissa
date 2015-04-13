Scriptname TG03BoardedDoorScript extends ObjectReference  Conditional

Message Property pTG03BoardsDoneMessage  Auto
Message Property pTG03BoardsStartMessage  Auto
int Property pTG03Opened  Auto  
Quest Property pTG03Quest  Auto

event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG03Opened == 0
			pTG03BoardsStartMessage.Show()
			pTG03Quest.setstage(50)
			pTG03Opened = 1
		elseif pTG03Opened == 1
			pTG03BoardsDoneMessage.Show()
		endif
	endif

endEvent