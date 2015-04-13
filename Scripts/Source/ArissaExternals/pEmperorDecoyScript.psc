Scriptname pEmperorDecoyScript extends ReferenceAlias Conditional 

int Property pDecoyDie  Auto  Conditional
Quest Property pDB09  Auto  

;This tracks the Emperor's decoy getting killed, and advances the stage 

Event OnDeath(Actor aThisGuyKilledMe)



if pDB09.GetStage () == 50
	pDB09Script Script = pDB09 as pDB09Script
	;If Script.pPotagePoisoned ==  1
	 If Script.DeadPoison == 1
		Script.pDecoyDeadPoison = 2
		pGuardReactScene.Start()
		Actor Decoy = DecoyAlias.GetReference() as Actor
		Decoy.SendAssaultAlarm()
		pDB09.SetStage (60)
	endif
endif	


if pDB09.GetStage () == 50
	pDB09Script Script = pDB09 as pDB09Script
	Script.pDecoyDeadPoison = 1
       pGuardReactScene.Start()
	Actor Decoy = DecoyAlias.GetReference() as Actor
	Decoy.SendAssaultAlarm()
	pDB09.SetStage (60)
endif	 

EndEvent

Scene Property pGuardReactScene  Auto  

ReferenceAlias Property DecoyAlias  Auto  
