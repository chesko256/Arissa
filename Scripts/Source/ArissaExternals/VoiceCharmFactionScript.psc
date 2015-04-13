Scriptname VoiceCharmFactionScript extends ActiveMagicEffect  

Faction Property CharmFaction Auto
bool Property bMakePlayerTeammate = false Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddToFaction(CharmFaction)
	akCaster.StopCombat()
	akTarget.StopCombat()
	if bMakePlayerTeammate
		akTarget.SetPlayerTeammate(true, false)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveFromFaction(CharmFaction)
	if bMakePlayerTeammate
		akTarget.SetPlayerTeammate(false, false)
	endif
EndEvent