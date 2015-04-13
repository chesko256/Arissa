Scriptname dunPOIAvalanche extends ObjectReference

ObjectReference property OtherSideMarker Auto
ObjectReference property AvalancheMarker Auto
ObjectReference property FXMarker Auto
Sound property ShakeSFX Auto

;Disable the avalanche if the player is closer to it than to the other side of the mountain (i.e., they'd see it).
Event OnLoad()
	Utility.Wait(5)
	if (Game.GetPlayer().GetDistance(Self) < Game.GetPlayer().GetDistance(OtherSideMarker))
		AvalancheMarker.Enable()
	Else
		AvalancheMarker.Disable()
		Self.Disable()
	EndIf
EndEvent

Event OnActivate(ObjectReference obj)
	if (!Self.IsDisabled())
		AvalancheMarker.Activate(Self)
		FXMarker.Enable()
		ShakeSFX.Play(FXMarker)
		Utility.Wait(12)
		FXMarker.Disable()
		Self.Disable()
	EndIf
EndEvent