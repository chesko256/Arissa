scriptname sprigganCallAnimalsAOE extends activeMagicEffect
{Prototype for an ability where SPriggans call helper animals}

faction property creatureFaction auto
faction property sprigganFaction auto

actor caster
objectReference casterRef

float myConfidence
float myAggression

bool property bDebug = FALSE auto

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	caster = akCaster
	casterRef = (caster as ObjectReference)
	
	if bDebug
; 		debug.trace("TEST: applied Spriggan AoE to :"+akTarget)
; 		debug.trace("TEST: AoE was cast by: "+casterRef)
; 		debug.trace("TEST: Enemy of Spriggan: "+caster.getCombatTarget())
	endif
	
	if akTarget.isInFaction(creatureFaction) == TRUE && !akTarget.isDead() 
		
		; save my conf/aggro values so they can be reset
		myConfidence = akTarget.getActorValue("confidence")
		myAggression = akTarget.getActorValue("aggression")
		
		; make my enemies the spriggan's enemies temporarily
		akTarget.addToFaction(sprigganFaction)
		
		; if the spriggan caster has a combat target (she should) then I will beeline to attack it!
		if caster.getCombatTarget()
			akTarget.startCombat(caster.getCombatTarget())
		endif

		; make this animal very aggressive/confident for the duration of the spell
		akTarget.setActorValue("confidence", 4)
		akTarget.setActorValue("aggression", 1)
		
	endif
	
endEVENT

EVENT OnEffectFinish(Actor akTarget, Actor akCaster)

; 	debug.trace("TEST: Released from Spriggan Enthrallment: "+self)

	akTarget.setActorValue("confidence", myConfidence)
	akTarget.setActorValue("aggression", myAggression)
	akTarget.RemoveFromFaction(sprigganFaction)
	akTarget.evaluatePackage()
endEVENT
