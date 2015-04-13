Scriptname MG03CallerTriggerScript extends ReferenceAlias  Conditional

Quest Property MG03  Auto

Quest property dunFellglowKeepQST Auto
int property inCombatWithCallerStage Auto
int property closedDoorStage Auto


Event OnTriggerEnter(ObjectReference AkActionRef)
	MG03QuestScript MG03Script= MG03 as MG03QuestScript

	if AkActionRef== Game.GetPlayer()
		if MG03Script.MG03CallerInit==0	
			if MG03.GetStageDone(30) == 1
				if MG03.GetStageDone(40) == 0
					
					MG03Script.MG03CallerInit=1
					if MG03OrthornAlias.GetReference().GetDistance(Game.GetPlayer()) < 1000
						MG03Script.MG03OrthornCaller = 1
					endif
					MG03CallerAlias.GetActorReference().EvaluatePackage()
				endif
			endif
		endif
	endif



; Commented out as Orthorn tends to not make it into this trigger before the FG; moving var update into player's block

	if AkActionRef == MG03OrthornAlias.GetReference()




		if MG03Script.MG03OrthornCaller == 0
			MG03Script.MG03OrthornCaller=1
		endif
	endif

	;Steve's additions...
;	if (!dunFellglowKeepQST.GetStageDone(inCombatWithCallerStage))
;		dunFellglowKeepQST.SetStage(closedDoorStage)
;	EndIf


EndEvent
ReferenceAlias Property MG03CallerAlias  Auto  
ReferenceAlias Property MG03OrthornAlias Auto
