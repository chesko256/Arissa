Scriptname MG02TolfdirLectureTriggerScript extends ReferenceAlias  

Quest Property MG02  Auto  



int DoOnce


Event OnTriggerEnter(ObjectReference ActionRef)

	MG02QuestScript MG02Script = MG02 as MG02QuestScript

	if ActionRef == MG02Tolfdir.GetReference()
		if MG02.GetStage() == 20
			if DoOnce == 0
				MG02Script.MG02TolfdirLecture += 1
				DoOnce = 1
				Self.GetReference().Disable()
			endif	
		endif
	endif

EndEvent
ReferenceAlias Property MG02Tolfdir  Auto  
