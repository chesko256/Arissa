ScriptName MS01IldeneDropDropScript extends ReferenceAlias

Quest Property pFreeformMarkarthM2 auto
ReferenceAlias Property pIldeneNote auto
GlobalVariable Property pGamehour auto
ReferenceAlias Property pIldene auto

Event OnUpdate()

	If (Self.GetRef().GetItemCount(pIldeneNote.GetRef()) == 1) && (pGameHour.GetValueInt() >= 5) && (pGameHour.GetValueInt() <= 20) && (pFreeformMarkarthM2.GetStageDone(200) == 0)
		pIldene.GetActorRef().AddItem(pIldeneNote.GetRef())
	EndIf
	
EndEvent