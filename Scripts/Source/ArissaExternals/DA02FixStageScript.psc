Scriptname DA02FixStageScript extends Quest  

DA02Script property DA02 Auto
int stageToSet

function setStageVariable()
	check(1)
	check(4)
	check(5)
	check(6)
	check(7)
	check(9)
	check(10)
	check(11)
	check(12)
	check(15)
	check(17)
	check(20)
	check(21)
	;we don't care about 30 because that is the stage that can be erroneously set
	check(40)
	check(41)
	check(50)
	check(60)
	check(70)
	check(80)
	check(81)
	check(100)
	check(200)
	
	DA02.stage = stageToSet

EndFunction

function check(int stage)
	if DA02.GetStageDone(stage)
		stageToSet = stage
	EndIf
EndFunction
