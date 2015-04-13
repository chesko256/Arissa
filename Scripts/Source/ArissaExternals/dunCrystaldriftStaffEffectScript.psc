Scriptname dunCrystalDriftStaffEffectScript extends ActiveMagicEffect  

Faction Property dunCrystalDriftCaveFaction Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddToFaction(dunCrystalDriftCaveFaction)
	akCaster.AddToFaction(dunCrystalDriftCaveFaction)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveFromFaction(dunCrystalDriftCaveFaction)
	akCaster.RemoveFromFaction(dunCrystalDriftCaveFaction)
EndEvent
