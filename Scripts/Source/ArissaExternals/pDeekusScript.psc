Scriptname pDeekusScript extends Actor Conditional

int Property pDeekusDie  Auto  Conditional
Quest Property pDBSideContract06  Auto  

;This tracks Deekus getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract06.GetStage () == 10
	pDBSideContract06.SetStage (20)
endif	 

if pDBSideContract06.GetStage () == 0
	DBScript.pDeekusAlreadyDead=1
endif	 

EndEvent

Quest Property DarkBrotherhoodQuest  Auto  
