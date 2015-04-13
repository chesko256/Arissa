Scriptname CWEscapeCityEscapeDoorScript extends ReferenceAlias  

ReferenceAlias Property Jarl Auto
ReferenceAlias Property HouseCarl Auto
ReferenceAlias Property FieldCO Auto

CWScript Property CWs Auto	;pointer to CWScript on CW quest

Event OnActivate(ObjectReference akActionRef)

	ObjectReference MarkerRef

; 	CWScript.Log("CWEscapeCityEscapeDoorScript", self + "OnActivate():" + akActionRef)	

	if akActionRef == Jarl.GetReference() || akActionRef == HouseCarl.GetReference()
; 		CWScript.Log("CWEscapeCityEscapeDoorScript", self + "calling CWScript->GetExiledMarkerForActor(" + akActionRef + ")")
		
		MarkerRef = CWs.GetExiledMarkerForActor(akActionRef as Actor)
	
	elseif akActionRef == FieldCO.GetReference()
; 		CWScript.Log("CWEscapeCityEscapeDoorScript", self + "calling CWScript->GetFactionHQMarkerForActor(" + akActionRef + ")")
		
		MarkerRef = CWs.GetFactionHQMarkerForActor(akActionRef as Actor)
	
	ElseIf akActionRef == Game.GetPlayer()		
		GetOwningQuest().setStage(100)	;completes the objective to escape with the Jarl
	
	EndIf

	if MarkerRef != None
; 		CWScript.Log("CWEscapeCityEscapeDoorScript", self + "moving " + akActionRef + " to " + MarkerRef)
	
		akActionRef.MoveTo(MarkerRef)
	EndIf
	
EndEvent
