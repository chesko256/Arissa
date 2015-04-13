Scriptname pAlainScript extends ReferenceAlias Conditional

Quest Property pDB03  Auto  
Location Property pWindhelmBloodworksLocation  Auto  
ReferenceAlias Property pAlainAlias  Auto  
 
;This tracks Alain getting killed, and advances the stage or sets a variable, depending

Event OnDeath(Actor aThisGuyKilledMe)

DB03Script pDB03Script = pDB03 as DB03Script


if pDB03.GetStage () == 20 
	pDB03.SetStage (40)
endif	 


if pDB03.GetStage () < 20
	pDB03Script.AlainAlreadyDead=1
endif	 

EndEvent



