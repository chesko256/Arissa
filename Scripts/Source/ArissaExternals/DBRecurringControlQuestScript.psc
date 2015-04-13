Scriptname DBRecurringControlQuestScript extends Quest  

;Event OnInit()

;RegisterForUpdate(5)

;EndEvent

Event OnUpdate()

 
If DBrecurring.GetStage () >= 200
	Utility.Wait(2)
	DBRecurring.SetStage (10)
endif


EndEvent

Quest Property DBRecurring  Auto  
