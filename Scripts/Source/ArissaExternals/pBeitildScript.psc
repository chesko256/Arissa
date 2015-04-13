Scriptname pBeitildScript extends Actor Conditional

int Property pBeitildDie  Auto  Conditional

Quest Property pDBSideContract03  Auto  

Quest Property DarkBrotherhoodQuest  Auto  


;This tracks Betild getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract03.GetStage () == 10
	DBScript.FirstKill = DBScript.FirstKill +1
	pDBSideContract03.SetStage (20)
endif	 

if pDBSideContract03.GetStage () == 0
	DBScript.pBetildAlreadyDead=1
endif	 


DB04Script pDB04Script = pDB04 as DB04Script

if pDB04Script.Side >= 1
	if pDB04Script.Side <= 3
		pDB04Script.Side=4
	endif
endif


EndEvent

Quest Property pDB04  Auto  
