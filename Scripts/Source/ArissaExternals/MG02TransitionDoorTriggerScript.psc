Scriptname MG02TransitionDoorTriggerScript  extends ReferenceAlias


ReferenceAlias Property MG02Tolfdir  Auto  






Event OnTriggerEnter (ObjectReference ActionRef)

MG02QuestScript MG02Script = GetOwningQuest() as MG02QuestScript


	if ActionRef == MG02Tolfdir.GetReference()
		if GetOwningQuest().GetStage() == 60
			if MG02Script.MG02TransitionDoorVar == 0
				MG02Script.MG02TransitionDoorVar = 1
				Self.GetReference().Disable()
			endif
		endif
	endif

EndEvent