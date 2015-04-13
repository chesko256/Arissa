Scriptname MG02SaarthalExteriorDoorScript extends ReferenceAlias  

Quest Property MG02  Auto  

ReferenceAlias Property MG02TolfdirAlias  Auto  

ReferenceAlias Property MG02OnmundAlias  Auto  

ReferenceAlias Property MG02JzargoAlias  Auto  

ReferenceAlias Property MG02BrelynaAlias  Auto  

ObjectReference Property MG02TolfdirDoorMarker  Auto  

ObjectReference Property MG02OnmundDoorMarker  Auto  

ObjectReference Property MG02BrelynaDoorMarker  Auto  

ObjectReference Property MG02JzargoDoorMarker  Auto  

int DoOnce

Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MG02.GetStage() == 20
			if DoOnce == 0
				MG02TolfdirAlias.GetReference().MoveTo(MG02TolfdirDoorMarker)
				MG02OnmundAlias.GetReference().MoveTo(MG02OnmundDoorMarker)
				MG02JzargoAlias.GetReference().MoveTo(MG02JzargoDoorMarker)
				MG02BrelynaAlias.GetReference().MoveTo(MG02BrelynaDoorMarker)
				DoOnce = 1
			endif
		endif
	endif

EndEvent