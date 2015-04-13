Scriptname CWMonitorDeathQuestScript extends Quest  
{Used with aliases who's death you want to monitor using the CWMonitorDeathSoldierScript}

int Count	;count of how many soldiers we are monitoring deaths for

int property StageToSet = 100 auto 	;what stage should be set if Count is 0 when we check for it
{Default = 100; What stage to set when all the soldiers are dead.}

Function IncrementCount()
	count += 1
	
EndFunction

Function DecrementCount()
	count -= 1
	CheckCount()
	
EndFunction

Function CheckCount()
	if Count <= 0
		setStage(StageToSet)
	EndIf

EndFunction
