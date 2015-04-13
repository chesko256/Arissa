Scriptname VoiceAllegianceFactionScript extends ActiveMagicEffect  

Faction Property AllegianceFaction Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddToFaction(AllegianceFaction)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveFromFaction(AllegianceFaction)
EndEvent