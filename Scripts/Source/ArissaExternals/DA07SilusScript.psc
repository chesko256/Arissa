ScriptName DA07SilusScript extends ReferenceAlias

ObjectReference Property SilusMarker Auto

Event OnUnload()

	;move Silus to the shrine
	If (GetOwningQuest().GetStageDone(50) == 1) && (GetOwningQuest().GetStageDone(52) == 0) && (GetOwningQuest().GetStageDone(55) == 0)
		Self.GetActorRef().Moveto(SilusMarker)
		GetOwningQuest().SetStage(52)
	EndIf

EndEvent

Event OnDeath(Actor akKiller)

	;quest progresses if you kill Silus at the right time, otherwise it fails
	If GetOwningQuest().GetStageDone(70) == 1
		GetOwningQuest().SetStage(80)
	Else
		GetOwningQuest().SetStage(200)
	EndIF

EndEvent