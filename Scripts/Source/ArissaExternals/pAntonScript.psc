Scriptname pAntonScript extends ReferenceAlias  

 

Quest Property pDB08  Auto  
 

Event OnDeath(Actor aThisGuyKilledMe)
pDB08Script Script = pDB08 as pDB08Script

if pDB08.GetStage () == 6
	pDB08.SetStage (10)
	Script.pAntonDead=1
endif

if pDB08.GetStage () > 6
	pDB08.SetObjectiveCompleted (6,1)
	Script.pAntonDead=1
endif


EndEvent

 

