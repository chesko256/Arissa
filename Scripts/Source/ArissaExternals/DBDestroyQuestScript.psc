Scriptname DBDestroyQuestScript extends Quest Conditional  

int Property pAssassinsKilled  Auto Conditional  

;Event OnInit()

;RegisterForUpdate(5)

;EndEvent



Event OnUpdate()

If GetStage () == 35
    	if pAssassinsKilled == 5 
		SetStage (40)
	endif
endif	 



EndEvent
