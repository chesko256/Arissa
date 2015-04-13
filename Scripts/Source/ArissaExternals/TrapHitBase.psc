scriptName TrapHitBase extends objectReference
;
;
;
;=========================================

import utility

int property damage auto hidden
int property soundLevel = 10 auto 
int property trapPushBack auto
sound property TrapHitSound auto
weapon property hitFX auto
ammo property hitFXAmmo auto
bool property trapCausesStagger = false Auto
{does this trap stagger actors
	default = false}
bool property rumble = false Auto
float property rumbleAmount = 0.7 Auto
float property rumbleDuration = 0.5 auto
bool property cameraShake = false Auto
float property cameraShakeAmount = 0.7 auto
float property staggerAmount = 0.0 auto
bool property soundCanPlay = TRUE auto hidden
float property soundDelay = 1.0 auto
bool property throttleSound = TRUE auto
spell property ghostAbility auto
bool property hitOnlyOnce = false auto
{This variable to act as a safety mechanism,
if this is true, after one trap hit this will put itself
into the cannotHit State, Mainly for bearTrap
	Default == FALSE}

	
explosion property pushbackExplosion auto
objectReference placedExplosion

bool property canDisease auto
{this property says whether this can apply diseases on hit
	diseaseChance determines the odds if this is true
	default = false}

float property diseaseChance = 2.5 auto
{if canDisease is true, this determines the chance of a disease being applied
	default = 2.5%}
	
spell property TrapDiseaseAtaxia auto
spell property TrapDiseaseBoneBreakFever auto
spell property TrapDiseaseBrainRot auto
spell property TrapDiseaseRattles auto
spell property TrapDiseaseRockjoint auto
spell property TrapDiseaseWitbane auto

faction property noHitFaction auto
{This faction will not be affected by hits from this trap}

;This only processes the hits, another script should tell this one when to be in the CanHit state
state CanHit	
	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
; 		;debug.Trace(self + " has hit " + akTarget)
		if !(akTarget as actor).hasSpell(ghostAbility) && !(akTarget as actor).IsInFaction(noHitFaction)
			if hitOnlyOnce
				goToState("CannotHit")
			endif
			akTarget.ProcessTrapHit(self, damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount)
			if throttleSound
				if soundCanPlay
					soundCanPlay = False
					if TrapHitSound
						TrapHitSound.play( self as ObjectReference)		;play hit sound
					endif
					registerForSingleUpdate(soundDelay)
				endif
			Else
				TrapHitSound.play( self as ObjectReference)		;play hit sound
			endif
			
			bool isPlayer = false
			if akTarget == game.getPlayer()
				isPlayer = True
			endif
			
			actor myTarget
			myTarget = akTarget as Actor
			
			if canDisease && isPlayer
				if randomFloat(0.0, 100.0) <= diseaseChance
					int diseasePick
					diseasePick = randomInt(1,6)
					if diseasePick == 1
						myTarget.addSpell(TrapDiseaseAtaxia)
					elseif diseasePick == 2
						myTarget.addSpell(TrapDiseaseBoneBreakFever)
					elseif diseasePick == 3
						myTarget.addSpell(TrapDiseaseBrainRot)
					elseif diseasePick == 4
						myTarget.addSpell(TrapDiseaseRattles)
					elseif diseasePick == 5
						myTarget.addSpell(TrapDiseaseRockjoint)
					elseif diseasePick == 6
						myTarget.addSpell(TrapDiseaseWitbane)
					endif
				endif
			endif
			
			if hitFX
				hitFX.fire(self, hitFxAmmo)
			endif
			CreateDetectionEvent(myTarget, soundLevel) ; creates a detection event
			;/if trapCausesStagger
				placedExplosion = self.placeatme(pushbackExplosion)
				placedExplosion.moveto(self, afXoffset = afXpos, afYoffset = afYpos, afZoffset = afZpos)
			endif/;
			if rumble && isPlayer
				game.ShakeController(rumbleAmount, rumbleAmount, rumbleDuration)
			EndIf
			if cameraShake && isPlayer
				game.ShakeCamera(game.getPlayer(),cameraShakeAmount, rumbleDuration)
			endif
		endif
		;Trace("Damage =")
		;Trace(damage)
			
	endEvent
endState

auto state CannotHit
	Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	endEvent
endState
	
event onUpdate()
	soundCanPlay = TRUE
EndEvent
	