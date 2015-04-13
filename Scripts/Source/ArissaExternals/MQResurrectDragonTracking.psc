scriptname MQResurrectDragonTracking extends ReferenceAlias

Quest property MQResurrectDragon Auto
Scene property MQResurrectDragonScene Auto
bool cleanup = False

;Cleanup when CleanupOldScenes is called, or when the mound Alduin is at unloads.
Function Cleanup()
; 	Debug.Trace(self + "Cleanup() START")
	;When Alduin unloads, the MQResurrectDragon scene aborts, if it was running.
	MQResurrectDragonScene.Stop()
		
	;For each of the three scenes, check to see if the scene finished. If not, enable the dragon at that mound if the player retuns.
	If (MQResurrectDragon.GetStageDone(11) && !MQResurrectDragon.GetStageDone(18) && !MQResurrectDragon.GetStageDone(19))
		;We were in the first scene, and it didn't finish.
		MQResurrectDragon.SetStage(18)
	EndIf
	If (MQResurrectDragon.GetStageDone(21) && !MQResurrectDragon.GetStageDone(28) && !MQResurrectDragon.GetStageDone(29))
		;We were in the second scene, and it didn't finish.
		MQResurrectDragon.SetStage(28)
	EndIf
	If (MQResurrectDragon.GetStageDone(31) && !MQResurrectDragon.GetStageDone(38) && !MQResurrectDragon.GetStageDone(39))
		;We were in the third scene, and it didn't finish.
		MQResurrectDragon.SetStage(38)
	EndIf

	;Clear the Actor Variable used to flag Alduin for escape.
	Self.GetActorRef().SetAV("Variable06", 0)

	;Make sure Alduin gets disabled.
	if (!Self.GetActorRef().Is3DLoaded())
		Self.GetActorRef().Disable()
	EndIf
	
; 	Debug.Trace(self + "Cleanup() DONE")
EndFunction

Function OnUnload()
; 	Debug.Trace(self + "OnUnload()")
	int stage = MQResurrectDragon.GetStage()
	if (stage == 18 || stage == 28 || stage == 38 || stage == 19 || stage == 29 || stage == 39)
		Self.GetActorRef().Disable()
	EndIf
EndFunction