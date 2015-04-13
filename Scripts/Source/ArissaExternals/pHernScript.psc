Scriptname pHernScript extends actor Conditional 

int Property pHernDie  Auto Conditional
Quest Property pDBSideContract04  Auto 
Quest Property DarkBrotherhoodQuest  Auto   

 

;This tracks Hern getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract04.GetStage () == 10
	pDBSideContract04.SetStage (20)
endif	 

if pDBSideContract04.GetStage () == 0
	DBScript.pHernAlreadyDead=1
endif


DB04Script pDB04Script = pDB04 as DB04Script

if pDB04Script.Side >= 1
	if pDB04Script.Side <= 3
		pDB04Script.Side=4
	endif
endif	 

EndEvent



Quest Property pDB04  Auto  
