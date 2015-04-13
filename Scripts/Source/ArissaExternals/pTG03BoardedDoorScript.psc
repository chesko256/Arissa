Scriptname pTG03BoardedDoorScript extends ObjectReference  Conditional

int Property pBoardsOpen  Auto  
Quest Property pTG03Quest  Auto  
Message Property pTG03BoardsShutMessage  Auto  
Message Property pTG03BoardsOpenMessage  Auto  

event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pBoardsOpen == 0
			pTG03BoardsOpenMessage.Show()
			pTG03Quest.setstage(50)
			pBoardsOpen == 1
		elseif pBoardsOpen == 1
			pTG03BoardsOpenMessage.Show()
		endif
	endif

endEvent