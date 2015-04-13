Scriptname MQGreybeardAbsorbScript extends Quest  
{script allowing Greybeard absorb}

import Game
import utility


; for Greybeard effect
VisualEffect Property FXGreybeardAbsorbEffect Auto
EffectShader Property GreybeardPowerAbsorbFXS Auto
EffectShader Property GreybeardPlayerPowerAbsorbFXS Auto
sound property NPCDragonDeathSequenceWind auto
sound property NPCDragonDeathSequenceExplosion auto

; for dragon effect
VisualEffect Property DragonAbsorbEffect Auto
VisualEffect Property DragonAbsorbManEffect Auto
EffectShader Property DragonPowerAbsorbFXS Auto

ObjectReference Property KnockAreaEffectMarker  Auto  

; use this for Greybeards
function AbsorbEffect(Actor target, int stageToSet = 0)

       ;Play art and fx shaders on player and targeted grybeard
       FXGreybeardAbsorbEffect.Play(target, 7, GetPlayer())
       GreybeardPowerAbsorbFXS.Play(target)
	GreybeardPlayerPowerAbsorbFXS.Play(GetPlayer())

	;Wait for the art to play
	;Wait(7.0)
	; INSTEAD - break up the 7 seconds:

	; damage target to simulate absorption
	float damage = target.GetActorValue("health")/5		; use 3 if bleedout looks good
	target.DamageActorValue("health", damage)
;	KnockAreaEffectMarker.Moveto(target)
;	KnockAreaEffectMarker.KnockAreaEffect(0.2, 5)
	target.PlayIdle(BracedPainIdle)

	; Sounds for when the wispy particles being to fly at the player.
	NPCDragonDeathSequenceWind.play(target) 
	NPCDragonDeathSequenceExplosion.play(target) 

	wait(2)
	target.DamageActorValue("health", damage)
;	KnockAreaEffectMarker.Moveto(target)
;	KnockAreaEffectMarker.KnockAreaEffect(0.5, 5)
;	target.PlayIdle(BracedPainIdle)


	wait(2)
	target.DamageActorValue("health", damage)
;	KnockAreaEffectMarker.Moveto(target)
;	KnockAreaEffectMarker.KnockAreaEffect(0.8, 5)
;	target.PlayIdle(BracedPainIdle)

	wait(2)
	target.DamageActorValue("health", damage)
;	KnockAreaEffectMarker.Moveto(target)
;	KnockAreaEffectMarker.KnockAreaEffect(1.0, 5)
;	target.PlayIdle(BracedPainIdle)


	Wait(1.0)

	;remove magic shaders
	GreybeardPowerAbsorbFXS.Stop(target)
	GreybeardPlayerPowerAbsorbFXS.Stop(GetPlayer())

	; set stage when finished
	if stageToSet > 0
		setstage(stageToSet)
	endif

endFunction

; use this for Paarthurnax
function DragonAbsorbEffect(Actor target, int stageToSet = 0)

	;display dragon absorb effect art. One part on dragon one part on player.
	DragonAbsorbEffect.Play(target, 8, GetPlayer())
	DragonAbsorbManEffect.Play(GetPlayer(), 8, target)
	
	; Sounds for when the wispy particles being to fly at the player.
	NPCDragonDeathSequenceWind.play(target) 
	NPCDragonDeathSequenceExplosion.play(target) 
	
	wait(0.1)
		
	; On man power absorb effect shader.
	DragonPowerAbsorbFXS.Play(GetPlayer())
	
	wait(2)
	
	wait(4)

	;Stop fx shader on player showing power absorb.	
	DragonPowerAbsorbFXS.Stop(GetPlayer())
	
	wait(4)
	
	; Get rid of art attached to dragon and player showing streaming magic.
	DragonAbsorbEffect.Stop(target)
	DragonAbsorbManEffect.Stop(GetPlayer())

	; set stage when finished
	if stageToSet > 0
		setstage(stageToSet)
	endif

endFunction
Idle Property BracedPainIdle  Auto  
