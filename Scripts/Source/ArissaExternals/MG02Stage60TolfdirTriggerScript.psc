Scriptname MG02Stage60TolfdirTriggerScript extends ObjectReference  Conditional

ObjectReference Property DraugrTrigger  Auto  

ReferenceAlias Property Tolfdir  Auto  

int Property DoOnce  Auto  Conditional


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Tolfdir.GetReference()
		if MG02.GetStage() >= 50
			if DoOnce == 0
				Activate(Self)
				disable()
				DoOnce = 1
			endif
		endif
	endif

EndEvent
Quest Property MG02  Auto  
