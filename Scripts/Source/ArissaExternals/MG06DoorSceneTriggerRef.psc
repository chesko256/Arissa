Scriptname MG06DoorSceneTriggerRef extends ObjectReference  

Quest Property MG06  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

MG06QuestScript MG06Script = MG06 as MG06QuestScript

	if ActionRef == Game.GetPlayer()
		if MG06.GetStage() == 60
			if MG06Script.MG06DoorSceneFlag == 0
				MG06Script.MG06DoorSceneFlag =1
				MG06Sergius.GetReference().MoveTo(UragRef)
			endif
		endif
		if MG08.GetStage() >= 10
			if MG08.GetStage() < 30
				MG08.SetStage(30)
			endif
		endif


	endif





EndEvent


Quest Property MG08  Auto  

ReferenceAlias Property MG06Sergius  Auto  

ObjectReference Property UragRef  Auto