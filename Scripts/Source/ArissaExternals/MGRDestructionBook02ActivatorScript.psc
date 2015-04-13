Scriptname MGRDestructionBook02ActivatorScript extends ReferenceAlias  


Event OnActivate (ObjectReference ActionRef)

MGRDPedestal02AliasScript PedestalScript = Pedestal as MGRDPedestal02AliasScript

	if ActionRef == Game.GetPlayer()

		if PedestalScript.ReadyState == 1
			Self.GetReference().Disable()
			Game.GetPlayer().AddItem(BookOld.GetReference(), 1)
			PedestalScript.ReadyState = 0
		elseif PedestalScript.ReadyState == 2
			Self.GetReference().Disable()
			Game.GetPlayer().AddItem(BookNew.GetReference(), 1)
			PedestalScript.ReadyState = 0
		endif
	endif

EndEvent


ReferenceAlias Property Pedestal Auto

ReferenceAlias Property BookOld  Auto

ReferenceAlias Property BookNew Auto