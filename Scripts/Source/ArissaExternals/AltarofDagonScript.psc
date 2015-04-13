ScriptName AltarofDagonScript extends ObjectReference

ObjectReference Property ShrineofDagon Auto

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer()
		ShrineofDagon.Activate(Game.GetPlayer())
	EndIf
	
EndEvent
