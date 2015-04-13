Scriptname DB06IncriminatingLetterScript extends ReferenceAlias  

Quest Property pDB06  Auto  
ReferenceAlias Property pGaiusMaro  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

;Tracks the player putting the Incriminating Evidence into Gaius Maro's body

;if pDB06.GetStage() >= (20)
if pDB06.IsObjectiveDisplayed (20)
	DB06Script Script = pDB06 as DB06Script
	if (akNewContainer == pGaiusMaro.getRef())
		if Script.pPlantedLetter==0 
			Script.pPlantedLetter=1
			pDB06.SetObjectiveCompleted (20)
			pDB06.SetObjectiveDisplayed(30, 1)
			;pDB06.SetStage (30)
		endif
	else
		if Script.pPlantedLetter==1
			Script.pPlantedLetter=0
			pDB06.SetObjectiveCompleted (20,0)
			pDB06.SetObjectiveDisplayed (20,1)
			pDB06.SetObjectiveDisplayed (30,0)

		endif
	endif
endif


;if pDB06.IsObjectiveCompleted (20)
	;if (akNewContainer != pGaiusMaro.getRef())
		;DB06Script Script = pDB06 as DB06Script
		;if Script.pPlantedLetter==1 
			;Script.pPlantedLetter=0
			;pDB06.SetObjectiveDisplayed (20)
		;endif
	;endif
;endif



EndEvent

