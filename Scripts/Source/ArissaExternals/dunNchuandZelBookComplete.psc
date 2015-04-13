Scriptname dunNchuandZelBookComplete extends Objectreference  

QUEST PROPERTY myQuest AUTO

BOOL PROPERTY staubsBook AUTO
BOOL PROPERTY erjBook AUTO
BOOL PROPERTY strommBook AUTO
BOOL PROPERTY kragBook AUTO
BOOL PROPERTY alethiusBook AUTO

BOOL DOONCE=TRUE

EVENT onActivate(OBJECTREFERENCE obj)

	IF(obj == game.getPlayer() && DOONCE)
	
		IF(alethiusBook && (myQuest.getStage() < 10))
			myQuest.setStage(10)
	
		ELSEIF(staubsBook && (myQuest.getStage() < 50))
			myQuest.setObjectiveCompleted(40)
			myQuest.setStage(50)
				
		ELSEIF(erjBook)
			myQuest.setObjectiveCompleted(20)
		
		ELSEIF(strommBook && (myQuest.getStage() < 20))
			myQuest.setObjectiveCompleted(10)
			myQuest.setStage(20)
			
		ELSEIF(strommBook && (myQuest.getStage() > 20))
			myQuest.setObjectiveCompleted(10)
		
		ELSEIF(kragBook)
			myQuest.setObjectiveCompleted(30)
		
		ENDIF	
	
	
		DOONCE = FALSE
		game.getPlayer().additem(SELF, 1)
	
	ENDIF

ENDEVENT
	
EVENT OnClose(OBJECTREFERENCE obj)



ENDEVENT
	