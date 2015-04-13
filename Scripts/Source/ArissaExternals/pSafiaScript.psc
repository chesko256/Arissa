Scriptname pSafiaScript extends Actor Conditional 

Quest Property pDBSideContract12  Auto  
int Property pSafiaDie  Auto  Conditional

;This tracks Safia getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract12.GetStage () == 10
	pDBSideContract12.SetStage (20)
endif	 

if pDBSideContract12.GetStage () == 0
	DBScript.pSafiaAlreadyDead=1
endif	 

EndEvent

Quest Property DarkBrotherhoodQuest  Auto  
