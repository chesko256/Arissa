Scriptname pNarfiScript extends Actor Conditional 

Quest Property pDBSideContract01  Auto  
Quest Property DarkBrotherhoodQuest  Auto 
int Property pNarfiDie  Auto  Conditional  

;This tracks Narfi getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract01.GetStage () == 10
       DBScript.FirstKill = DBScript.FirstKill +1
	pDBSideContract01.SetStage (20)
endif	 

if pDBSideContract01.GetStage () == 0
	DBScript.pNarfiAlreadyDead=1
endif	


DB04Script pDB04Script = pDB04 as DB04Script

if pDB04Script.Side >= 1
	if pDB04Script.Side <= 3
		pDB04Script.Side=4
	endif
endif
	
 

EndEvent

Quest Property pDB04  Auto  
