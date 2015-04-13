Scriptname pAstridEndScript extends ReferenceAlias Conditional  

int Property pAstridEndDie  Auto  Conditional
Quest Property pDB10  Auto  

;This tracks Astrid getting killed, and advances the stage 

Event OnDeath(Actor aThisGuyKilledMe)

if pDB10.GetStage () == 70
	pDB10.SetStage (80)
endif	 

EndEvent

