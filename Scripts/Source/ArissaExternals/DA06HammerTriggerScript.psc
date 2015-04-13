Scriptname DA06HammerTriggerScript extends ObjectReference  

ObjectReference Property ShagrolsHammer  Auto  

ReferenceAlias Property DA06ShagrolsHammerAlias  Auto


ObjectReference Property Volendrung  Auto  

Quest Property DA06  Auto  


Event OnActivate (ObjectReference ActionRef)

	if DA06.GetStage() == 120
		if ActionRef == Game.GetPlayer()
			Game.DisablePlayerControls()
			Game.GetPlayer().RemoveItem(DA06ShagrolsHammerAlias.GetReference(), 1)
			ShagrolsHammer.Enable(true)
			Utility.Wait(2)
			ShagrolsHammer.Disable()
			Volendrung.Enable()
			Game.EnablePlayerControls()
			DA06.SetStage(200)
			Self.Disable()
		endif
	endif

EndEvent