scriptName defaultTeleportAbility extends activeMagicEffect
{Attempt at a generic script for NPCs to teleport to XXX markers when threatened by melee}

import game
import utility

;VFX
Activator property SummonFX Auto

;Summon parameters
activator property teleportBase auto
{Base object to search for as a teleport point}
float property fSearchRadius = 1600.0 auto
{How far near me to search for teleport points? DEFAULT = 768u}
int property iMinToTeleport = 2 auto
{Min # of hits I'll take before teleporting.  DEFAULT = 2}
int property iMaxToTeleport = 4 auto
{Max # of hits I'll take before teleporting.  DEFAULT = 4}
effectShader property fadeOutFX auto
effectShader property fadeInFX auto
visualEffect property TrailFX auto
;{Let's try some trailing FX to show where I'm going to pop out}

;Internal variables.
bool combatStarted
int hitCount
ObjectReference teleportGoal 
ObjectReference player
actor caster
objectReference casterRef
bool inBleedout
objectReference opponent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	player = game.getPlayer()
	caster = akCaster
	casterRef = (caster as ObjectReference)
endEVENT

;Every 2 hits, the Caller teleports.
Event OnHit(ObjectReference akAggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	opponent = akAggressor
	int hitTolerance = RandomInt(iMinToTeleport, iMaxToTeleport)
	hitCount = hitCount + 1
	if (hitCount > hitTolerance && !caster.IsDead())
		hitCount = 0
		if inBleedout == FALSE && caster.isDead() == FALSE
			Teleport()
		endif
	EndIf
	
	; additional check - seen instances where NPC with this ability would not die!
	if Caster.getActorValue("Health") < 0
		caster.kill()
; 		debug.trace("teleport NPC killed by self (HP<0 safety net): "+caster)
	endif
	
EndEvent

Event Teleport()
		
	;Where's the Caller going?
	int i = 0					; incrementer for while
	int maxSearch = 10		; limit number of while recursions
	while i < maxSearch
		teleportGoal = FindRandomReferenceOfTypeFromRef(teleportBase, casterRef, fSearchRadius)
		if teleportGoal.getDistance(opponent) < 512 || (player as actor).hasLoS(teleportGoal) == FALSE
; 			;debug.trace(caster.getActorBase()+" found but doesn't prefer "+teleportGoal)
			; this teleport marker isn't the best, but hold onto it as a backup option
			; therefore don't kick out of the loop just yet
		elseif teleportGoal.getDistance(opponent) > 512 || (player as actor).hasLoS(teleportGoal) == TRUE
			; if we found a teleport marker that works, just use it!
; 			;debug.trace(caster.getActorBase()+" found a good goal and kicking out of while loop "+teleportGoal)
			i = maxSearch
		endif
		i += 1
; 		;debug.trace("While Recursion #"+i+" on "+self)
	endWhile
			

	;Perform the swap.
	;casterRef.Disable()
	fadeOutFX.play(casterRef)
	caster.setGhost(TRUE)
	objectReference previousLoc = casterRef.PlaceAtMe(SummonFX)
	Utility.Wait(0.5)
	
	TrailFX.Play(previousLoc, 0.5, teleportGoal)
	
	casterRef.MoveTo(teleportGoal)
	casterRef.PlaceAtMe(SummonFX)
	Utility.Wait(0.5)
	
	;casterRef.Enable()
	fadeOutFX.stop(casterRef)
	caster.setGhost(FALSE)
	caster.evaluatePackage()
	caster.startCombat(opponent as actor)
EndEvent

EVENT onEnterBleedout()
	inBleedout = TRUE
	; For now never reset this boolean.  Considering it part of the flow that bleeding out turns the ability off
endEVENT
