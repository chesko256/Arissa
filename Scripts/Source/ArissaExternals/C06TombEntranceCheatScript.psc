Scriptname C06TombEntranceCheatScript extends ObjectReference  

Location Property TombLoc auto

ReferenceAlias Property Aela auto
ReferenceAlias Property Farkas auto
ReferenceAlias Property Vilkas auto

ObjectReference Property AelaSpot auto
ObjectReference Property FarkasSpot auto
ObjectReference Property VilkasSpot auto

Quest Property C06 auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (C06.GetStage() >= 30 && C06.GetStage() < 40)
			; if (Aela.GetReference().GetCurrentLocation() != TombLoc)
				Aela.GetReference().MoveTo(AelaSpot)
			; endif
			; if (Farkas.GetReference().GetCurrentLocation() != TombLoc)
				Farkas.GetReference().MoveTo(FarkasSpot)
			; endif
			; if (Vilkas.GetReference().GetCurrentLocation() != TombLoc)
				Vilkas.GetReference().MoveTo(VilkasSpot)
			; endif
		endif
	endif
EndEvent
