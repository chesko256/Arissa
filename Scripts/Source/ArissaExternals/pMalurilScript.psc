Scriptname pMalurilScript extends Actor Conditional

Quest Property pDBSideContract10  Auto  
int Property pMalurilDie  Auto  Conditional

;This tracks Maluril getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract10.GetStage () == 10
	pDBSideContract10.SetStage (20)
endif	 

if pDBSideContract10.GetStage () == 0
	;DBScript.pMalurilAlreadyDead=1
endif	 

EndEvent

Quest Property DarkBrotherhoodQuest  Auto  
