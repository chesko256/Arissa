Scriptname NilsneKillScript extends ObjectReference  


Quest Property pDB03  Auto  
 
;This tracks Nilsine Shatter-Shield getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DB03Script pDB03Script = pDB03 as DB03Script

if pDB03.GetStage () >= 20
	if pDB03.GetStage () <= 40
		 pDB03.SetObjectiveCompleted (30)
		pDB03Script.NilsineDead=1
	endif
endif	 

 

if pDB03.GetStage () < 20
	pDB03Script.NilsineDead=1
endif	 

EndEvent

