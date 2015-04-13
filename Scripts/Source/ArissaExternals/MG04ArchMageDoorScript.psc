Scriptname MG04ArchMageDoorScript extends ReferenceAlias  

Quest Property MG04  Auto  

ReferenceAlias Property MG04AncanoAlias  Auto  

ObjectReference Property AncanoMoveMarker  Auto  

Cell Property ArchMageQuarters  Auto  

int DoOnce

Event OnTriggerEnter (ObjectReference ActivateRef)

	if ActivateRef == Game.GetPlayer()
		if MG04.GetStage() == 30
			if MG04AncanoAlias.GetReference().IsInLocation(WinterholdCollegeArchMagesQuartersLocation) == 0
				if DoOnce == 0
					MG04AncanoAlias.GetReference().MoveTo(AncanoMoveMarker)
					MG04AncanoAlias.GetActorReference().EvaluatePackage()
					DoOnce=1
					Self.GetReference().Disable()
				endif
			endif
		endif
	endif

EndEvent
Location Property WinterholdCollegeArchMagesQuartersLocation  Auto  
