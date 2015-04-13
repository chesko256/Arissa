Scriptname pGrelodScript extends Actor Conditional 

Quest Property pDB01  Auto  
int Property pGrelodDie  Auto  Conditional
 
;This tracks Grelod getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DB01QuestScript pDB01Script = pDB01 as DB01QuestScript

if pDB01.GetStage () == 20
	pDB01.SetStage (30)
endif	 

if pDB01.GetStage () < 20
	pDB01Script.GrelodAlreadyDead=1
endif

pChildrenScene.Start()

EndEvent

Scene Property pChildrenScene  Auto  
