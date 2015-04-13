Scriptname dunBluePalaceArenaSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY playerThrallStorm AUTO
OBJECTREFERENCE PROPERTY playerThrallFrost AUTO
OBJECTREFERENCE PROPERTY playerThrallFire AUTO

OBJECTREFERENCE PROPERTY pelagiusArena AUTO
OBJECTREFERENCE PROPERTY pelagiusThrallStorm AUTO
OBJECTREFERENCE PROPERTY pelagiusThrallFrost AUTO
OBJECTREFERENCE PROPERTY pelagiusThrallFire AUTO

OBJECTREFERENCE PROPERTY bodyGuardA AUTO
OBJECTREFERENCE PROPERTY bodyGuardAWolf AUTO
OBJECTREFERENCE PROPERTY bodyGuardB AUTO
OBJECTREFERENCE PROPERTY bodyGuardBWolf AUTO

SPELL PROPERTY healSpell AUTO

; fire > ice > storm > fire

;which thrall do they have active?
;0 = Storm
;1 = Frost
;2 = Fire
INT PROPERTY pelagiusActive=0 AUTO HIDDEN
INT PROPERTY playerActive=0 AUTO HIDDEN

OBJECTREFERENCE PROPERTY activeAtr AUTO HIDDEN
INT lastState
INT maxHealth=800

BOOL startOnce=TRUE

EVENT onTriggerEnter(OBJECTREFERENCE obj)
	IF(obj == game.getPlayer() && startOnce)
		
		registerForUpdate(10)
		startOnce = FALSE
		
		activeAtr = pelagiusThrallStorm
		lastState = 0
		
		goToState("polling")
	ENDIF

ENDEVENT

STATE polling

	EVENT ONUPDATE()
		;IF(pelagiusArena.isDisabled() == TRUE)
		;ENDIF
		
		IF(lastState != playerActive)
		
			IF(playerActive == 0)
				activeAtr.disable()
				pelagiusThrallFrost.enable()
				activeAtr = pelagiusThrallFrost
				
			ELSEIF(playerActive == 1)
				activeAtr.disable()
				pelagiusThrallFire.enable()
				activeAtr = pelagiusThrallFire
			
			ELSEIF(playerActive == 2)
				activeAtr.disable()
				pelagiusThrallStorm.enable()
				activeAtr = pelagiusThrallStorm
		
			ENDIF
			
			lastState = playerActive
			
		ENDIF
		
		IF(getHealthPerc())
			combatantHeal()
		ENDIF
		
	ENDEVENT

ENDSTATE

FUNCTION combatantHeal()
	
	healSpell.cast(activeAtr)
	
	IF(playerActive == 0)
		healSpell.cast(playerThrallStorm)
	
	ELSEIF(playerActive == 1)
		healSpell.cast(playerThrallFrost)
	
	ELSEIF(playerActive == 2)
		healSpell.cast(playerThrallFire)
		
	ENDIF
	
	(playerThrallStorm AS ACTOR).forceAV("health", maxHealth)
	(playerThrallFire AS ACTOR).forceAV("health", maxHealth)
	(playerThrallFrost AS ACTOR).forceAV("health", maxHealth)
	
	(pelagiusThrallStorm AS ACTOR).forceAV("health", maxHealth)
	(pelagiusThrallFire AS ACTOR).forceAV("health", maxHealth)
	(pelagiusThrallFrost AS ACTOR).forceAV("health", maxHealth)

ENDFUNCTION

BOOL FUNCTION getHealthPerc()
	IF((pelagiusThrallFrost AS ACTOR).GetActorValuePercentage("health") <= 0.4 || (pelagiusThrallFire AS ACTOR).GetActorValuePercentage("health") <= 0.4 || (pelagiusThrallStorm AS ACTOR).GetActorValuePercentage("health") <= 0.4 || (playerThrallFrost AS ACTOR).GetActorValuePercentage("health") <= 0.4 || (playerThrallFire AS ACTOR).GetActorValuePercentage("health") <= 0.4 || (playerThrallStorm AS ACTOR).GetActorValuePercentage("health") <= 0.4)
	
			
		return TRUE
	
	ENDIF

ENDFUNCTION

