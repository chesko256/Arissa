Scriptname pAgnisScript extends Actor Conditional  

int Property AgnisDie  Auto  Conditional
Quest Property pDBSideContract09  Auto  


;This tracks Agnis getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract09.GetStage () == 10
	pDBSideContract09.SetStage (20)
endif	 

if pDBSideContract09.GetStage () == 0
	DBScript.pAgnisAlreadyDead=1
endif	 

EndEvent

Quest Property DarkBrotherhoodQuest  Auto  
