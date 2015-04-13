Scriptname MG02Stage20FGTriggerScript extends ReferenceAlias  


Event OnTriggerEnter (ObjectReference ActionRef)

MG02QuestScript MG02Script = GetOwningQuest() as MG02QuestScript

	if ActionRef == Game.GetPlayer()
		if PlayerIn == 0
			PlayerIn=1
			if TolfdirIn == 1
				if MG02Script.MG02Stage20FG == 0
					MG02Script.MG02Stage20FG=1
					MG02Tolfdir.GetActorReference().EvaluatePackage()
					Self.GetReference().Disable()
				endif
			endif
		endif
	elseif ActionRef == MG02Tolfdir.GetReference()
		if TolfdirIn == 0
			TolfdirIn=1
			if PlayerIn== 1
				if MG02Script.MG02Stage20FG == 0
					MG02Script.MG02Stage20FG=1
					MG02Tolfdir.GetActorReference().EvaluatePackage()
					Self.GetReference().Disable()
				endif
			endif
		endif
	endif

EndEvent
ReferenceAlias Property MG02Tolfdir  Auto  

Quest Property MG02  Auto  


int PlayerIn

int TolfdirIn