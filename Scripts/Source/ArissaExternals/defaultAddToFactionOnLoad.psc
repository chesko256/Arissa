scriptName defaultAddToFactionOnLoad extends Actor
{Adds the reference to a faction on load.}

Faction property newFaction Auto

Event OnLoad()
	Self.AddToFaction(newFaction)
EndEvent