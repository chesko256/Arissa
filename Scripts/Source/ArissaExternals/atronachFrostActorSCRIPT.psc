scriptname atronachFrostActorSCRIPT extends actor
{behavior script for Frost Atronachs}
;===============================================
;	PROPERTIES & VARIABLES
;===============================================
import objectReference
; explosion to place when certain anims trigger it
spell property frostBurst auto
; visual effect shader that lives on the frost atronach
EffectShader Property AtronachFrostFXS Auto
; spell to shoot from right arm
spell property FrostSpell auto

;===============================================
;	EVENTS
;===============================================
EVENT onLoad()
	AtronachFrostFXS.Play(self)
	registerForAnimationEvent(self, "FrostImpactBurst")
	registerForAnimationEvent(self, "FrostShootSpell")
endEVENT
;===============================================
EVENT onAnimationEVENT(objectReference deliverator, string eventName)
; 	debug.trace(self + " caught event: " + eventName + " from " + deliverator)
	if eventName == "FrostImpactBurst"
		actor target = self.getCombatTarget()
; 		debug.trace(self + " is adding frost burst to his attack on " + target)
		frostBurst.cast(self,target)
		self.placeAtme(frostBurst)
		rampRumble(1,0.5,768)
	endif
	if eventName == "FrostShootSpell"
		actor target = self.getCombatTarget()
; 		debug.trace(self + " is using ranged power attack on " + target)
		frostSpell.cast(self)
	endif
endEVENT
;===============================================
EVENT onDeath(actor myKiller)
	AtronachFrostFXS.Stop(self)
ENDEVENT
