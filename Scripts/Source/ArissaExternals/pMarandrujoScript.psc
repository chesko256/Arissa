Scriptname pMarandrujoScript extends Actor Conditional  

Quest Property pDBSideContract07  Auto  
int Property pMarandrujoDie  Auto Conditional 

;This tracks Ma'randru-jo getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDBSideContract07.GetStage () == 10
	pDBSideContract07.SetStage (20)
endif	 

if pDBSideContract07.GetStage () == 0
	DBScript.pMarandrujoAlreadyDead=1
endif	 

EndEvent

Quest Property DarkBrotherhoodQuest  Auto  
