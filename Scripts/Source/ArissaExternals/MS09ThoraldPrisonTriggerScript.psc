Scriptname MS09ThoraldPrisonTriggerScript extends ObjectReference  

Quest Property MS09  Auto  

Scene Property MS09ThoraldPrisonScene  Auto  

ReferenceAlias Property MS09Avulstein  Auto  

int DoOnce


Event OnTriggerEnter(ObjectReference AkActionRef)

	if MS09.GetStage() == 55
		if AkActionRef == MS09Avulstein.GetActorReference()
			if DoOnce == 0
				MS09ThoraldPrisonScene.Start()
				DoOnce += 1
			endif
		endif
	endif			


EndEvent