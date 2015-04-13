Scriptname MG02TolfdirTunnelSceneTriggerScript extends ReferenceAlias  

ReferenceAlias Property MG02Tolfdir  Auto  

Event OnTriggerEnter (ObjectReference ActionRef)

int DoOnce


MG02QuestScript MG02Script = GetOwningQuest() as MG02QuestScript

	if ActionRef == MG02Tolfdir.GetReference()
		if DoOnce == 0
			MG02Script.MG02TolfdirTunnelSceneVar += 1
			DoOnce = 1
			Self.GetReference().Disable()
		endif
	endif

EndEvent