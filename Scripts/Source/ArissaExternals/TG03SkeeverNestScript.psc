Scriptname TG03SkeeverNestScript extends ObjectReference  Conditional

int Property pTG03NestPoisoned  Auto  
Message Property pTG03SkeeverNestBeforeMessage  Auto  
Message Property pTG03SkeeverNestAfterMessage  Auto  
Quest Property pTG03Quest  Auto  

event OnLoad()

	Self.SetNoFavorAllowed()	

endEvent

event onActivate (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pTG03NestPoisoned == 0
			pTG03SkeeverNestBeforeMessage.Show()
			pTG03Quest.setstage(45)
			pTG03NestPoisoned = 1
		elseif pTG03NestPoisoned == 1
			pTG03SkeeverNestAfterMessage.Show()
		endif
	endif

endEvent