ScriptName AltarofAzuraScript extends ObjectReference

ObjectReference Property ShrineofAzura Auto

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer()
		ShrineofAzura.Activate(Game.GetPlayer())
	EndIf
	
EndEvent
