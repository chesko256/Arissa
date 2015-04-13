Scriptname dunDeadMensRespiteUnsealDoorScript extends ObjectReference  

Quest property DMRQST Auto

Event OnInit()
	DMRQST.SetStage(95)
	Self.Disable()
	Self.Delete()
EndEvent