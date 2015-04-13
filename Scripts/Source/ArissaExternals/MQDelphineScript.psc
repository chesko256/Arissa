Scriptname MQDelphineScript extends ObjectReference  
{redress Delphine when in Riverwood inn}

Event OnLoad()
	; put normal outfit on
	if MQ106.GetStage() < 50
		; if she's in Riverwood
		if GetEditorLocation() == GetCurrentLocation()
; 			debug.trace(self + "OnLoad: Delphine changing back to normal outfit")
			ObjectReference selfRef = self as ObjectReference
			(selfRef as Actor).SetOutfit(NormalOutfit)	
		endif
	endif
endEvent

Quest Property MQ106  Auto  

Outfit Property NormalOutfit  Auto  
