ScriptName MS01DeadBodyScript extends ReferenceAlias

Quest Property MS01IntroWorldScene Auto

Event OnUnload()

	If (Self.GetActorRef().IsDead() == True) && (MS01IntroWorldScene.GetStageDone(300) == 1) && (MS01IntroWorldScene.GetStageDone(500) == 0)
; 		debug.trace(self + "clean up bodies")
		MS01IntroWorldScene.SetStage(500)
	EndIf

EndEvent