Scriptname pEnnodiusScript extends Actor Conditional 

Quest Property pDBSideContract02  Auto  
int Property pEnnodiusDie  Auto Conditional 
Quest Property DarkBrotherhoodQuest  Auto  

;This tracks Ennodius getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract02.GetStage () == 10
       DBScript.FirstKill = DBScript.FirstKill +1
	pDBSideContract02.SetStage (20)
endif	 

if pDBSideContract02.GetStage () == 0
	DBScript.pEnnodiusAlreadyDead=1
endif	 

DB04Script pDB04Script = pDB04 as DB04Script

if pDB04Script.Side >= 1
	if pDB04Script.Side <= 3
		pDB04Script.Side=4
	endif
endif
	

EndEvent

Quest Property pDB04  Auto  
