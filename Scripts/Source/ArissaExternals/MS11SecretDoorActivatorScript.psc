Scriptname MS11SecretDoorActivatorScript extends ObjectReference  


ReferenceAlias Property Viola auto
Scene Property ViolaYak auto

bool __ViolaYakked = false

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && Viola.GetReference().GetDistance(Game.GetPlayer()) < 500)
		if (!__ViolaYakked)
			ViolaYak.Start()
			__ViolaYakked = true
		endif
	endif
EndEvent
