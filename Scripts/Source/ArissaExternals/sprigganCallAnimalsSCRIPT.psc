scriptname sprigganCallAnimalsSCRIPT extends activeMagicEffect
{Prototype for an ability where SPriggans call helper animals}

spell property spellToCast auto
faction property creatureFaction auto
faction property sprigganFaction auto

actor caster
objectReference casterRef
bool done

Event OnEffectStart(Actor result01, Actor akCaster)
	caster = akCaster
	casterRef = (caster as ObjectReference)
	
; 	debug.trace("TEST: setup for "  +self)
; 	debug.trace("caster = "+caster)
	
;	result01.startCombat(caster.getCombatTarget())
endEVENT

Event OnCombatStateChanged(Actor result01, int aeCombatState)
; 	debug.trace("TEST: combatStateChanged on "+caster)
	if aeCombatState == 1 && done == FALSE
		spellToCast.cast(caster)
		findNearbyActors()
; 		debug.trace("attempt to cast the spell...")
		done = TRUE
	endif
endEVENT

EVENT onActivate(objectreference actronaut)
; 	debug.trace("activated "+self)
	;spelltoCast.cast(caster)
endEVENT

FUNCTION findNearbyActors()

	actor result01
	actor result02
	actor result03
	int c = 0

	WHILE result01 == NONE || result01.isDead() || result01 == game.getPlayer() || result01 == caster && c < 10
		result01 = game.FindRandomActorFromRef(casterRef, 9600)
; 		debug.trace("TEST: Found "+result01)
		c += 1
; 		debug.trace("result02 attempt #" +c)
	endWHILE
	
; 	debug.trace("TEST: Result01 is "+result01)
	if result01.isInFaction(creatureFaction) == TRUE
		if result01.getActorValue("confidence") <= 0
			result01.setActorValue("confidence", 1)
		endif
		result01.addToFaction(sprigganFaction)
		result01.startCombat(caster.getCombatTarget())
; 		debug.trace("TEST: Start combat for "+result01)
	endif
	
	;===============================;
	; reset our counter
	c = 0
	WHILE result02 == NONE || result02.isDead() || result02 == game.getPlayer() || result01 == caster || result02 == result01 && c < 10
		result02 = game.FindRandomActorFromRef(casterRef, 9600)
; 		debug.trace("result02 = "+result02)
		c += 1
; 		debug.trace("result02 attempt #" +c)
	endWHILE

; 	debug.trace("TEST: Result02 is "+result02)
	if result02.isInFaction(creatureFaction) == TRUE
		if result02.getActorValue("confidence") <= 0
			result02.setActorValue("confidence", 1)
		endif
		result02.addToFaction(sprigganFaction)
		result02.startCombat(caster.getCombatTarget())
; 		debug.trace("TEST: Start combat for "+result02)
	endif
	
	;===============================;
	; reset our counter
	c = 0
	WHILE result03 == NONE || result03.isDead() || result03 == game.getPlayer() || result01 == caster || result03 == result02 || result03 == result01 && c < 10
		result03 = game.FindRandomActorFromRef(casterRef, 9600)
; 		debug.trace("result03 = "+result03)
		c += 1
; 		debug.trace("attempt #"+c)
	endWHILE
	
; 	debug.trace("TEST: Result03 is "+result03)
	result03 = game.FindRandomActorFromRef(casterRef, 9600)
	if result03.isInFaction(creatureFaction) == TRUE
		if result03.getActorValue("confidence") <= 0
			result03.setActorValue("confidence", 1)
		endif
		result03.addToFaction(sprigganFaction)
		result03.startCombat(caster.getCombatTarget())
; 		debug.trace("TEST: Start combat for "+result03)
	endif
endFUNCTION

