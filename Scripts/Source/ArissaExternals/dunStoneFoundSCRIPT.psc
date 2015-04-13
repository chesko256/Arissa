Scriptname dunStoneFoundSCRIPT extends ObjectReference  

BOOL PROPERTY GUARDSTONE=FALSE AUTO
BOOL DOONCE=TRUE

EVENT onTriggerEnter(objectReference triggerRef)
		
	IF(DOONCE && triggerREF == game.getPlayer())
		DOONCE=FALSE
		
		IF(GUARDSTONE)
			game.incrementStat("Standing Stones Found", 3)
		ELSE
			game.incrementStat("Standing Stones Found")
		ENDIF
		
		IF(game.QueryStat("Standing Stones Found") >= 13)
			game.AddAchievement(30)
		ENDIF
	ENDIF
	
endEVENT		
		