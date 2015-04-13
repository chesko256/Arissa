scriptName dunPOILevelCheck extends ObjectReference
{On load, check the player's level, and enable the linkedref if the player is in the target range (inclusive).}

int property MinLevel = 0 Auto
int property MaxLevel = 999 Auto
Keyword property LinkName Auto

Event OnCellLoad()
	if (!Self.IsDisabled() && Game.GetPlayer().GetLevel() >= MinLevel && Game.GetPlayer().GetLevel() <= MaxLevel)
		Self.GetLinkedRef(LinkName).Enable()
	EndIf
EndEvent