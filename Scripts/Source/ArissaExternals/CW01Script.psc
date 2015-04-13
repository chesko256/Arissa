Scriptname CW01Script extends Quest  Conditional

LocationRefType Property CWFortMonster Auto
LocationAlias Property Fort Auto

int SuccessStage = 100

Quest Property CW00A Auto
Quest Property CW02A Auto

CWScript Property CWs Auto

Quest Property CW01SolitudeMapTableScene Auto

function checkLocRefTypeAliveCount()
; 	CWScript.Log("CW01Script", "checkLocRefTypeAliveCount()")
	
	int aliveCount = Fort.GetLocation().GetRefTypeAliveCount(CWFortMonster)
	
	if aliveCount > 0
; 		CWScript.Log("CW01Script", "checkLocRefTypeAliveCount() Alive Count == " + AliveCount)
		;do nothing
		
	Else
; 		CWScript.Log("CW01Script", "checkLocRefTypeAliveCount() Alive Count == " + AliveCount + "setting stage " + SuccessStage)
		
		SetStage(SuccessStage)
	
	endif

EndFunction


Quest Property CW01AOutfitImperial  Auto  
