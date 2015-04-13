Scriptname MG08GateScript extends ReferenceAlias

Scene Property MG08AncanoTauntScene  Auto  

Quest Property MG08  Auto  

int DoOnce

Event OnActivate(ObjectReference AkActionRef)


	if AkActionRef == Game.GetPlayer()
		if MG08.GetStage() > 10
			if DoOnce == 0
				if MG08Tolfdir.GetReference().GetDistance(Game.GetPlayer()) > 600
					MG08Tolfdir.GetReference().MoveTo(MG08TolfdirMarker)
					MG08Tolfdir.GetActorReference().EvaluatePackage()
				endif

				MG08AncanoTauntScene.Start()
				DoOnce = 1
			endif
		endif
	endif

EndEvent
ObjectReference Property MG08TolfdirMarker  Auto  

ReferenceAlias Property MG08Tolfdir  Auto  
