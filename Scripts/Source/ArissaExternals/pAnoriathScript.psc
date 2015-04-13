Scriptname pAnoriathScript extends Actor Conditional

int Property pAnoriathDie  Auto Conditional

Quest Property pDBSideContract08  Auto  


;This tracks Anoriath getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract08.GetStage () == 10
	pDBSideContract08.SetStage (20)
endif	 

if pDBSideContract08.GetStage () == 0
	DBScript.pAnoriathAlreadyDead=1
endif	 

EndEvent

Quest Property DarkBrotherhoodQuest  Auto  
