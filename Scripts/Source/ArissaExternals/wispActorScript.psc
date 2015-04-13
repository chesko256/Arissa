Scriptname WispActorScript extends ActiveMagicEffect  
{Abilities and FX for Wisp/Glimmerwitch}
;======================================================================================;
;	IMPORTS     /
;=============/
import utility
import form
import debug
;======================================================================================;
;	PROPERTIES  /
;=============/
keyword property wispChild01 auto
keyword property wispChild02 auto
keyword property wispChild03 auto

spell property wispBuff01 auto
spell property wispBuff02 auto
spell property wispBuff03 auto

spell property Phase1ConcSpell auto
{A long range concentration spell for phase #1}
spell property Phase2ConcSpell auto
{Shorter range spell for phase #2}

actorBase property encWispShade auto

VisualEffect Property WispFXAttachEffect Auto
explosion property ExplosionIllusionLight01 auto
Activator property AshPileObject auto
{The object we use as a pile.}

float property PhaseThreeHPPercent auto
{At what % of HP should I spawn my dopplegangers?. DEFAULT: 0.2}


;======================================================================================;
;	VARIABLES   /
;=============/
ObjectReference selfRef

; let's refer to the witchlights as "orbs" to avoid confusion.
objectReference orb01
objectReference orb02
objectReference orb03

objectReference Shade01 
objectReference Shade02

;track number of living orb babies
int liveLights = 3

; have my FX been attached?
bool bFX = FALSE
;======================================================================================;
;	EVENTS	    /
;=============/
	EVENT onLoad()
		trace("Wisp: Has Loaded 3D ("+selfRef+")")
		EVPall()
	endEVENT

	EVENT OnEffectStart(Actor Target, Actor Caster)
		trace("AbWisp Effect Start on: "+SelfRef+"")
		selfRef = caster
		
		if selfref.getLinkedRef() == NONE
			; only attack FX at this point if I am not in an ambush link
			WispFXAttachEffect.Play(selfRef, -1)
			bFX = TRUE
		endif

		orb01 = selfref.getLinkedRef(WispChild01)
		orb02 = selfRef.getLinkedRef(WispChild02)
		orb03 = selfRef.getLinkedRef(WispChild03)
		EVPall()

		if phaseThreeHPpercent > 1.0
			; if we passed a high value, the user probably meant a whole number percentage like 30%
			phaseThreeHPpercent = phaseThreeHPpercent/100
		endif	
	ENDEVENT
	
	EVENT onGetup(ObjectReference akFurniture)
		if akFurniture == selfRef.getLinkedRef() && bFX == FALSE
			; if I was in a furniture ambush, then add my FX when I leave it
			WispFXAttachEffect.Play(selfRef, -1)
			bFX = TRUE
		endif
	endEVENT
	
	Event OnCombatStateChanged(Actor victim, int aeCombatState)
		if aeCombatState != 0 ; 0 means not in combat, so non-zero means we entered combat
; 			debug.trace("Wisp began combat with "+victim+"  ("+self+")")
			if aeCombatState == 1	
				(orb01 as actor).startCombat(victim)
				(orb02 as actor).startCombat(victim)
				(orb03 as actor).startCombat(victim)
				; Start listening for critically low HP
				registerforSingleupdate(1.0)
			endif
		endif
	endEVENT
	
	EVENT onActivate(objectReference actronaut)
; 		debug.trace("Wisp Activated")
		if actronaut == orb01 || orb02 || orb03
			utility.wait(0.1)
; 			debug.trace("Actronaut was one of my orbs")
			liveLights -= 1
; 			debug.trace("Livelights = "+livelights)
			if liveLights <= 0
; 				debug.trace("All child lights dead for "+selfref)
				;Variable07 sets up the berserk package/combat style
				(selfRef as actor).setActorValue("Variable07",1)
				;also "eliminate" her ability to cast spells - take all her magicka away.
				trace("WISPS: move to combat phase 2")
				; Take away her magicka (she'll regen) and shuffle her spell set
				(selfRef as actor).damageActorValue("Magicka", -((selfref as actor).getActorValue("Magicka"))) 
				(selfref as actor).removeSpell(Phase1ConcSpell)
				(selfref as actor).addSpell(Phase2ConcSpell)
			endif
		endif
	endEVENT
	
	EVENT onUpdate()
		; Check HP for Phase 3 Combat - Last ditch doppleganger attack!
		if (selfRef as actor).getActorValuePercentage("health") >  phaseThreeHPpercent
			; HP still high, so hold off.
			;utility.wait(0.5)
			RegisterforSingleUpdate(0.5)
		else
			; create my dopplegangers and unregister for update
			Shade01 = (selfref as actor).placeAtMe(EncWispShade)
			Shade02 = (selfref as actor).placeAtMe(EncWispShade)

			;Set AV06 to 1 as a flag for being in this state (used in Frostmere Crypt)
			(selfref as actor).SetAV("Variable06", 1)

			; Dump the orbs.
			(orb01 as actor).kill()
			(orb02 as actor).kill()
			(orb03 as actor).kill()
			; restore her longer-range spell
			(selfref as actor).addSpell(Phase1ConcSpell)
		endif
	endEVENT
	
	EVENT OnDying(Actor akKiller)
		; Effects automatically finish onDeath so use this EVENT hook instead 
		trace("Actor has died: "+selfref)
		(selfRef as actor).SetCriticalStage((selfRef as actor).CritStage_DisintegrateStart)
		WispFXAttachEffect.Stop(selfRef)
		utility.wait(0.90)
		selfRef.placeatme(ExplosionIllusionLight01)
		(selfRef as actor).AttachAshPile(AshPileObject)
		; pause a second before killing inheritors - I've seen massive damage skip over this
		utility.wait(0.5)
		(orb01 as actor).kill()
		(orb02 as actor).kill()
		(orb03 as actor).kill()
		(Shade01 as actor).kill()
		(Shade02 as actor).kill()
		(selfRef as actor).SetCriticalStage((selfRef as actor).CritStage_DisintegrateEnd)
	ENDEVENT


	FUNCTION EVPall()
		trace("Sending EVP to self and witchlight children ("+selfRef+")")
		trace("Witchlights are the Following:")
		trace("--------------------------------")
		trace(orb01)
		trace(orb02)
		trace(orb03)
		trace("--------------------------------")
		(orb01 as actor).evaluatePackage()
		(orb02 as actor).evaluatePackage()
		(orb03 as actor).evaluatePackage()
	endFUNCTION
	