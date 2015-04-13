Scriptname DA08FriendshipEffect extends ActiveMagicEffect  

Faction Property FriendshipFaction auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (akTarget != Game.GetPlayer())
		akTarget.AddToFaction(FriendshipFaction)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster) 
	akTarget.RemoveFromFaction(FriendshipFaction)
EndEvent

