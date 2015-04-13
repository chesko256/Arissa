Scriptname MQKillDragonAliasScript extends ReferenceAlias  
{script on dead dragon which updates the effects}

import game

; move the player's effect with the player and rotate it to the dragon
event OnUpdate()
; 	debug.trace("MQKillDragonAliasScript: Update")
	; move the player's effect to the player's location
	PlayerAbsorbEffect.GetRef().Moveto(GetPlayer())
endEvent

ReferenceAlias Property DragonAbsorbEffect  Auto  

ReferenceAlias Property PlayerAbsorbEffect  Auto  
