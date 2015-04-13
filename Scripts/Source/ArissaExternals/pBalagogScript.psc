Scriptname pBalagogScript extends ReferenceAlias  

 

pDB08Script Property pDB08  Auto  
 
Event OnDying(Actor aThisGuyKilledMe)

BalagogAlias.GetReference().AddItem(PapersAlias.GetReference())

EndEvent



Event OnDeath(Actor aThisGuyKilledMe)

if pDB08.GetStage () == 10
	pDB08.SetObjectiveDisplayed(15)
	pDB08.SetStage (20)
if pDB08.BodyTriggerCount > 0
	pDB08.SetObjectiveCompleted (15)
	pDB08.pBodyHidden=1
endif
endif

if pDB08.GetStage () == 6
	pDB08.SetObjectiveDisplayed(15)
	;pDB08.SetObjectiveFailed(6)
	pDB08.SetStage (20)
if pDB08.BodyTriggerCount > 0
	pDB08.SetObjectiveCompleted (15)
	pDB08.pBodyHidden=1
endif
endif

EndEvent




ReferenceAlias Property PapersAlias  Auto  

ReferenceAlias Property BalagogAlias  Auto  
