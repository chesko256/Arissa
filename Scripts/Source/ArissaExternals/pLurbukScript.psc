Scriptname pLurbukScript extends Actor Conditional

int Property pLurbukDie  Auto  Conditional
Quest Property pDBSideContract05  Auto  

;This tracks Lurbuk getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract05.GetStage () == 10
	pDBSideContract05.SetStage (20)
endif	 

if pDBSideContract05.GetStage () == 0
	DBScript.pLurbukAlreadyDead=1
endif	 


DB04Script pDB04Script = pDB04 as DB04Script

if pDB04Script.Side >= 1
	if pDB04Script.Side <= 3
		pDB04Script.Side=4
	endif
endif


EndEvent

Quest Property DarkBrotherhoodQuest  Auto  

Quest Property pDB04  Auto  
