Scriptname CW01BScript extends Quest  Conditional

LocationRefType Property CWFortMonster Auto
LocationAlias Property myLocation Auto

int SuccessStage = 100

Quest Property CW00B Auto
Quest Property CW02B Auto

CWScript Property CWs Auto

Quest Property CW01WindhelmMapTableScene auto

function checkLocRefTypeAliveCount()
; 	CWScript.Log("CW01BScript", "checkLocRefTypeAliveCount()")
	
	int aliveCount = myLocation.GetLocation().GetRefTypeAliveCount(CWFortMonster)
	
	if aliveCount > 0
; 		CWScript.Log("CW01BScript", "checkLocRefTypeAliveCount() Alive Count == " + AliveCount)
		;do nothing
		
	Else
; 		CWScript.Log("CW01BScript", "checkLocRefTypeAliveCount() Alive Count == " + AliveCount + "setting stage " + SuccessStage)
		
		SetStage(SuccessStage)
	
	endif

EndFunction

LeveledItem Property CWPlayerUniformSons  Auto  
