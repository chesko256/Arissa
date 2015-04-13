Scriptname MQ304Script extends Quest  Conditional

bool Property LostSoulFollowFlag  Auto  Conditional
{set to true if you ask Lost Soul to follow you}

bool Property HallofHeroesCombatFlag  Auto  Conditional
{set to true after MQSovngardeConv2 has started once (combat scene)}


; stuff for lightning bolt on bridge
ObjectReference property LightningMarker1 auto
ObjectReference property LightningMarker2 auto
ObjectReference property LightningMarker3 auto
ObjectReference property LightningMarker4 auto
ObjectReference property LightningMarker5 auto


Spell property SpellRef auto

import utility

; kill player with lightning from sky
function LightningStrike()
; 		debug.trace(self + " lightning strike")
		Actor TargetActor = Game.GetPlayer()

		; pick a random marker
		int marker = randomint(1,5)
		ObjectReference useMe
		if marker == 1
			useMe = LightningMarker1
		elseif marker == 2
			useMe = LightningMarker2
		elseif marker == 3
			useMe = LightningMarker3

		elseif marker == 4
			useMe = LightningMarker4

		elseif marker == 5
			useMe = LightningMarker5
		endif

		SpellRef.Cast(useMe,TargetActor)
		TargetActor.DamageActorValue("health", 100)
		; wait a random amount
		RegisterForSingleUpdate(randomFloat(0.5, 1.5))
endFunction


int strikeCount

event OnUpdate()
	if BridgeTrigger.IsTriggerReady()
		; strike the player
		strikeCount = strikeCount + 1
		LightningStrike()
		if strikeCount >= 5
			Actor player = Game.GetPlayer()
			float playerHealth = player.GetActorValue("health")
			player.DamageActorValue("health", playerHealth)
			player.Kill()
		endif
	else
		strikeCount = 0
		UnRegisterForUpdate()
	endif
endEvent

DefaultOnEnter Property BridgeTrigger  Auto  

Location Property SovngardeHallofHeroesLocation  Auto  
