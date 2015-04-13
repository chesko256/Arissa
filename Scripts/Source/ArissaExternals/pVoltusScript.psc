Scriptname pVoltusScript extends ReferenceAlias Conditional 

Quest Property pDB06  Auto  
int Property pVoltusDie  Auto Conditional 


;Event OnInit()
;GetActorRef().RegisterForUpdate(1)
;EndEvent

Event OnUpdate()


;If the NPC is killed, this block updates the stage in the corresponding Dark Brotherhood contract
;if GetStage DB06 >= 10 && GetStage DB06 <= 20 
if pDB06.GetStage () >= 10
	if pDB06.GetStage () <= 20
		;if VoltusDie == 0
		if pVoltusDie == 0
			;if VoltusAgallonRef.GetDead == 1
			if Self.GetActorRef().IsDead() == 1
				;SetObjectiveCompleted DB06 10 1
				pDB06.SetObjectiveCompleted(10, 1)
				;SetStage DB06 30
				pDB06.SetStage (30)
				;Set VoltusDie to 1
				pVoltusDie = 1
			endif
		endif
	endif
endif


EndEvent

