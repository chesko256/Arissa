Scriptname pHelvardScript extends Actor Conditional

Quest Property pDBSideContract11  Auto  
int Property pHelvardDie  Auto Conditional 

;This tracks Helvard getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract11.GetStage () == 10
	pDBSideContract11.SetStage (20)
endif	 

if pDBSideContract11.GetStage () == 0
	DBScript.pHelvardAlreadyDead=1
endif	 

EndEvent

Quest Property DarkBrotherhoodQuest  Auto  
