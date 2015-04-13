scriptname MQResurrectLoadTracker extends ObjectReference

ReferenceAlias property MQResurrectDragonAlduin Auto

Event OnLoad()
; 	Debug.Trace("NOW LOADED")
EndEvent

Event OnUnload()
	if (Self.IsEnabled())
		(MQResurrectDragonAlduin as MQResurrectDragonTracking).Cleanup()
	EndIf
EndEvent