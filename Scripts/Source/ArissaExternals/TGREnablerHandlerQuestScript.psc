Scriptname TGREnablerHandlerQuestScript extends Quest  Conditional

GlobalVariable Property pTGRMasterTotal Auto Conditional

Function CheckCount()

	if pTGRMasterTotal.Value == 5
		SetStage(10)
	elseif pTGRMasterTotal.Value == 15
		SetStage(20)
	elseif pTGRMasterTotal.Value == 25
		SetStage(30)
	elseif pTGRMasterTotal.Value == 35
		SetStage(40)
	elseif pTGRMasterTotal.Value == 45
		SetStage(50)
	elseif pTGRMasterTotal.Value == 55
		SetStage(60)
	elseif pTGRMasterTotal.Value == 75
		SetStage(70)
	elseif pTGRMasterTotal.Value == 125
		SetStage(80)
	endif

endFunction