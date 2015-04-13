ScriptName DA10LogrolfScript Extends ReferenceAlias

ObjectReference Property DA10LogrolfWaitMarkerREF Auto

Event OnUnload()

	;Move Logrolf on Unload
	If (GetOwningQuest().GetStageDone(90) == 1) && (GetOwningQuest().GetStageDone(92) == 0) && (GetOwningQuest().GetStageDone(95) == 0)
		Self.GetActorRef().Moveto(DA10LogrolfWaitMarkerREF)
		GetOwningQuest().SetStage(92)
	EndIf

EndEvent

Event OnDeath(Actor akkiller)

	;Fail quest if you kill Logrolf before he's at the altar
	If GetOwningQuest().GetStageDone(100) == 0
		GetOwningQuest().SetStage(550)
	EndIf

	;Resurrect Logrolf the first time
	If (GetOwningQuest().GetStageDone(100) == 1) && (GetOwningQuest().GetStageDone(110) == 0)
		GetOwningQuest().Setstage(110)
	EndIf

	;Logrolf dies the second time
	If (GetOwningQuest().GetStageDone(130) == 1) && (GetOwningQuest().GetStageDone(140) == 0)
		GetOwningQuest().Setstage(140)
	EndIf

EndEvent


Event OnEnterBleedout()

	If (GetOwningQuest().GetStageDone(110) == 1) && (GetOwningQuest().GetStageDone(120) == 0)
		GetOwningQuest().SetStage(120)
	EndIf

EndEvent
