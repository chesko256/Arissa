Scriptname TGLarcenyScript extends Quest  Conditional

int Property pTGLCount Auto Conditional
int Property pTGLSay Auto Conditional
Quest Property pTGLQuest Auto Conditional
ObjectReference Property pTGL02Bee Auto
ObjectReference Property pTGL03Decanter Auto
ObjectReference Property pTGL04Map Auto
ObjectReference Property pTGL05Model Auto
ObjectReference Property pTGL06Cube Auto
ObjectReference Property pTGL07Fox Auto
ObjectReference Property pTGL08Eye Auto

function TGLCheck()

	pTGLCount += 1

	if pTGLCount == 1
		if pTGLSay == 0
			pTGLSay = 1
		endif
	endif

	if pTGLCount >= 7
		if pTGLQuest.GetStageDone(25) == 1 && pTGLQuest.GetStageDone(35) == 1 && pTGLQuest.GetStageDone(45) == 1 && pTGLQuest.GetStageDone(55) == 1 && pTGLQuest.GetStageDone(65) == 1 && pTGLQuest.GetStageDone(75) == 1 && pTGLQuest.GetStageDone(85) == 1
			if pTGLQuest.GetStage() < 200
				pTGLQuest.SetStage(200)
			endif
		endif
	endif

endFunction