scriptName DA01NelacarsBookScript extends ReferenceAlias

Int DoOnce

Event OnActivate(ObjectReference akActionRef)
	If (akActionRef == Game.GetPlayer()) && (DoOnce == 0)
		;add map markers to the warlock lairs mentioned in the book
		;convert to Papyrus as soon as the ShowMap function works
		;ShowMap MapMarkerIlinaltasDeepREF
		;ShowMap MapMarkerDarkLightCaveREF
		;ShowMap MapMarkerYngvildREF
		;ShowMap MapMarkerHobsFallCaveREF
		;ShowMap MapMarkerAnsilvundREF
		;ShowMap MapMarkerMorvunskarREF
		DoOnce = 1
	EndIf
EndEvent