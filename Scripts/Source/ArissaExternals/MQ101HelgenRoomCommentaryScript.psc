ScriptName MQ101HelgenRoomCommentaryScript extends ObjectReference

Quest Property MQ101 Auto
Actor Property RalofRef Auto
Actor Property HadvarRef Auto


Event OnTriggerEnter(ObjectReference akActionRef)

	If akActionRef == HadvarRef
		MQ101.SetStage(368)
		Self.Disable()
	EndIf

	If akActionRef == RalofRef
		MQ101.SetStage(368)
		Self.Disable()
	EndIf
	
EndEvent