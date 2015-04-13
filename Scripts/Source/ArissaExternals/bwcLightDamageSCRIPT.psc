Scriptname bwcLightDamageSCRIPT extends ObjectReference  
{the trigger that deals damage to the player if they are in the light}

; false = minimum damage
; true = maximum damage
BOOL PROPERTY maxDmg AUTO
EFFECTSHADER PROPERTY effect AUTO

INT INTRIGGER=0


EVENT ONTRIGGERENTER(objectreference ref)

	IF(ref as ACTOR == game.getPlayer())
		
		INTRIGGER += 1
		
		effect.play(game.getPlayer())
		
		while(INTRIGGER > 0)
			IF(maxDMG)
				game.getPlayer().damageAV("health", (game.getPlayer().getBaseAV("health") * 0.2))
	
			ELSEIF(maxDMG == FALSE)
				game.getPlayer().damageAV("health", (game.getPlayer().getBaseAV("health") * 0.05))
	
			ENDIF
			
			utility.wait(0.5)
		endWHILE
		
		effect.stop(game.getPlayer())
	
	ENDIF

ENDEVENT


EVENT ONTRIGGERLEAVE(objectreference ref)

	IF(ref as ACTOR == game.getPlayer())
		INTRIGGER -= 1
		
	ENDIF

ENDEVENT
