Scriptname TGLarcenyItemScript extends ReferenceAlias  Conditional

int Property pTGLDone Auto Conditional
int Property pTGLStageSet Auto Conditional
Quest Property pTGLQuest Auto Conditional

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if pTGLDone == 0
		if akNewContainer == Game.GetPlayer()
;			(pTGLQuest as TGLarcenyScript).TGLCheck()
			pTGLQuest.SetStage(pTGLStageSet)
			pTGLDone = 1
		endif		
	endif
	
endEvent