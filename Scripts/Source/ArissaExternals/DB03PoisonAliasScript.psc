Scriptname DB03PoisonAliasScript extends ReferenceAlias  

Quest Property DB03  Auto  
Quest Property DarkBrotherhoodQuest  Auto  
int Property DoOnce  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood


;if DBScript.HavePoison == 0
	;DBScript.HavePoison = 1
;endif

if DBScript.HavePoison == 1
	If DoOnce == 0
		DBScript.HavePoison = 2
		DoOnce = 1
	endif
endif



if DB03.GetStage () == 30
	if DBScript.HavePoison == 3
		if DB03.IsObjectiveDisplayed (35)
			DB03.SetObjectiveCompleted (35,1)
		endif
	endif
endif


EndEvent




