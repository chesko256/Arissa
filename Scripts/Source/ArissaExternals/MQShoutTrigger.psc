Scriptname MQShoutTrigger extends ObjectReference 
{used for clearing fog through shouts. high level shouts clear fog for longer}
;===============================================================================
import debug
import utility
;===============================================================================
Spell property VoiceClearSkies1 auto		; level 1 shout
Spell property VoiceClearSkies2 auto		; and 2
Spell property VoiceClearSkies3 auto		; and 3, the most powerful

spell property MQClearSkyFogSpell auto
{The negative effect, so we can remove it}

int timeToClear								; this variable is set according to what power of shout hit the fog

int property ClearTimeWeak = 5 auto			
{tweak setting for how long fog stays cleared by weakest shout}

int property ClearTimeMed = 10 auto
{tweak setting for how long fog stays cleared by medium shout}

int property ClearTimeStrong = 15 auto
{tweak setting for how long fog stays cleared by strongest shout}

bool property allowEnableFlag = true auto
{when true, trigger will enable after clear time is up
 when false, trigger will stay disabled}

; return value for IsFogOn function
; hidden property for use in child scripts
bool property bIsFogOn = true auto hidden

bool property bDebug = FALSE auto hidden
{Switch to TRUE to see debug log info}

globalVariable property MQClearSkyFogGlobal auto
{This global is set to 0 when out the fog, 1 when within.  Prevents hampering effect from sticking when not in a fog volume}

 ;===============================================================================

Auto STATE WaitingForTrigger
	Event OnTriggerEnter (objectReference TriggerRef)
		;trace(self + "OnTriggerEnter " + TriggerRef)
		resolveTriggerLogic(TriggerRef)
		if TriggerRef == game.getPlayer() && bIsFogOn == TRUE
			MQClearSkyFogGlobal.setValueInt(1)
			if MQClearSkyFogSpell
				MQClearSkyFogSpell.cast(game.getPlayer())
			endif
			; Add the spell to the player as an ability.  Don't broadcast it.
			;bool spelled = game.getPlayer().addSpell(MQClearSkyFogSpell,FALSE)
; 			;debug.trace("MQ CLOUD: Was fog effect applied? "+spelled)			
		endif
	endEvent
	
	EVENT onTriggerLeave(objectReference triggerRef)
		; Remove detrimental "ability" when exiting
		if triggerRef == game.getPlayer()
			MQClearSkyFogGlobal.setValueInt(0)
			;bool dispelled = (triggerRef as actor).removeSpell(MQClearSkyFogSpell)
; 			;debug.trace("MQ CLOUD: Was fog effect dispelled? "+dispelled)
		endif
	endEVENT

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		trace(self + "OnHit akSource=" + akSource)
		resolveTriggerLogic(None, akSource as Spell)
	endEvent
endSTATE

;===============================================================================

STATE	HasBeenTriggered
	; Nothing happens - this is a holding state
endSTATE

;===============================================================================
;===============================================================================

Function resolveTriggerLogic(ObjectReference TriggerRef = None, Spell SpellRef = None)

	; respond if struck by one of the shout projectiles
	if bDebug
; 		debug.trace( self + "MQShoutTrigger: resolveTriggerLogic ObjectRef=" + TriggerRef + ",  SpellRef=" + spellRef)
	endif
	
	if spellRef ;&& (spellRef == VoiceClearSkies1 || spellRef == VoiceClearSkies2 || spellRef == VoiceClearSkies3)
		goToState("HasBeenTriggered")
		fireTriggerEvent(spellRef)
	endif

endFunction
;===============================================================================
Function fireTriggerEvent(Spell akSpell)
	if bDebug
; 		debug.trace(self + "MQShoutTrigger: fireTriggerEvent from " + akSpell)
	endif
	; set the time that this fog portion will stay cleared based on strength of the shout
	if akSpell == VoiceClearSkies1
		timeToClear = clearTimeWeak
	elseif akSpell == VoiceClearSkies2
		timeToClear = clearTimeMed
	elseif akSpell == VoiceClearSkies3
		timeToClear = clearTimeStrong
	endif
	setFogState(false)
	trace(self + "Waiting " + timeToClear)
	wait(timeToClear)
	if allowEnableFlag
		;self.enable()
		setFogState(true)
	endif
	goToState("WaitingForTrigger")
endFunction

Function setFogState(bool bTurnOnFog)
	bIsFogOn = bTurnOnFog
	if bTurnOnFog
		trace(self + ": Re-fogging")
		; playAnimation("playAnim01")
		enable(1)
	else
		if bDebug
; 			debug.trace(self + ": unfogging")
		endif
		Disable(1)
		; playAnimation("playAnim02")
	endif
endFunction

bool function IsFogOn()
	return bIsFogOn
endFunction


