scriptName CritterFish extends Critter
{Main Behavior script for fish schools}

import Utility
import form
import debug

; Constants
float Property fActorDetectionDistance = 300.0 auto
{The Distance at which an actor will trigger a flee behavior}
float Property fTranslationSpeedMean = 40.0 auto
{The movement speed when going from plant to plant, mean value}
float Property fTranslationSpeedVariance = 20.0 auto
{The movement speed when going from plant to plant, variance}
float Property fFleeTranslationSpeed = 70.0 auto
{The movement speed when fleeing from the player}
float Property fMinScale = 0.1 auto
{Minimum initial scale of the Fish}
float Property fMaxScale = 0.2 auto
{Maximum initial scale of the Fish}
float Property fMinDepth = 10.0 auto
{Minimum fish depth}
float Property fSplineCurvature = 200.0 auto
{Spline curvature}
float Property fMinTimeNotMoving = 1.0 auto
float Property fMaxTimeNotMoving = 5.0 auto
float Property fSchoolingDistanceX = 25.0 auto
float Property fSchoolingDistanceY = 35.0 auto
int Property iPercentChanceSchooling = 50 auto
int Property iPercentChanceStopSchooling = 5 auto
float property fMaxRotationSpeed = 360.0 auto
{Max rotation speed while mocing, default = 360 deg/s}

; Hidden property for schooling
bool Property bMoving = false auto hidden

; Constants
float fWaitingToDieTimer = 10.0
CritterFish TargetFish = none


; Called by the spawner to kick off the processing on this Fish
Event OnStart()
	; Vary size a bit
	SetScale(RandomFloat(fMinScale, fMaxScale))
	
	; Start in the random swimming state
	GotoState("RandomSwimming")
	
	if !(Game.GetPlayer().GetDistance(self) <= fMaxPlayerDistance )
		; Kill this critter
		DisableAndDelete()
	else
		WarpToRandomPoint()
; ; 		Debug.TraceConditional("Fish " + self + " registering for update", bCritterDebug)

		; Enable the critter
		Enable()

		; Wait for the 3d to be fully loaded
		int c = 0
		int max = 10 ; limit recursions
		while(!Is3DLoaded()&& (c < max))
			wait(0.1)
			c+=1
		endWhile

		if (Is3DLoaded())
			; Switch to keyframe state
			SetMotionType(Motion_Keyframed, false)

			; Get ready to start moving
			RegisterForSingleUpdate(0.0)
		else
			DisableAndDelete(false)
		endIf
	endIf
	
endEvent

State RandomSwimming
	Event OnUpdate()
		
		; Is the player too far?
		if !(Game.GetPlayer().GetDistance(self) <= fMaxPlayerDistance )
			; Kill this critter
			DisableAndDelete()
		else
			; Good to update, check for close actors
			Actor closestActor = Game.FindClosestActorFromRef(self, fActorDetectionDistance)

			; Check whether we should flee and move faster
			float fspeed = 0.0
			if (closestActor != none)
; 				;Debug.Trace(self + " Oh noes! there is an Actor " + closestActor + " nearby, Flee")
				; Move fast
				fspeed = fFleeTranslationSpeed
			else
				; Move at regular speed
				fspeed = RandomFloat(fTranslationSpeedMean - fTranslationSpeedVariance, fTranslationSpeedMean + fTranslationSpeedVariance)
			endIf

			; Time to take off for another plant
			if (RandomInt(0, 100) < iPercentChanceSchooling)
				if (PickTargetFishForSchooling())
					GotoState("Schooling")
					SchoolWithOtherFish(fspeed)
				else
					GoToNewPoint(fspeed)
				endIf
			else
				GoToNewPoint(fspeed)
			endIf
		endIf
	endEvent

	Event OnCritterGoalAlmostReached()
; 		traceConditional(self + " reached goal", bCritterDebug)
		bMoving = false
		if !(Game.GetPlayer().GetDistance(self) <= fMaxPlayerDistance )
			; Fish is too far from the player, kill it
			DisableAndDelete()
		else
			; There is an actor right there, trigger the update right away, so we'll flee
; ; 			Debug.TraceConditional("Fish " + self + " registering for immediate update", bCritterDebug)
			RegisterForSingleUpdate(0.0)
		endIf
	EndEvent
	
endState


State Schooling
	Event OnUpdate()
		if !(Game.GetPlayer().GetDistance(self) <= fMaxPlayerDistance )
			; Fish is too far from the player, kill it
			DisableAndDelete()
		else
			if ((RandomInt(0, 100) < iPercentChanceStopSchooling) || TargetFish == none || TargetFish.IsDisabled() || !TargetFish.bMoving)
				GotoState("RandomSwimming")
				GoToNewPoint(RandomFloat(fTranslationSpeedMean - fTranslationSpeedVariance, fTranslationSpeedMean + fTranslationSpeedVariance))
			else
				; If the target fish is moving, follow it
				SchoolWithOtherFish(fFleeTranslationSpeed)
			endIf
		endIf
	endEvent

	Event OnCritterGoalAlmostReached()
; 		traceConditional(self + " about to reach goal", bCritterDebug)
		RegisterForSingleUpdate(0.0)
	EndEvent
	
endState


float fTargetX
float fTargetY
float fTargetZ
float fTargetAngleZ
float fTargetAngleX

Function PickRandomPoint()

	; Pick a point inside the upside down cone of height fWaterDepth and radius fLeashLength
	; Since most ponds will look like a bowl, we don't want fish close to the edge to clip through the ground
	
	; make sure our spawner is loaded.
	if spawner.getParentCell()
		; First find a random point within the radius
		float flength = fLeashLength * 2.0 ; So that we loop at least once
		fTargetX = 0.0
		fTargetY = 0.0
		; pick a random point in the disk of fleashlength radius
		int c
		int max = 10 ; hwo many recrusions to allow before giving up?
		while (flength > fLeashLength) && (c < max)
			fTargetX = RandomFloat(-fLeashLength, fLeashLength)
			fTargetY = RandomFloat(-fLeashLength, fLeashLength)
			flength = Math.sqrt(fTargetX * fTargetX + fTargetY * fTargetY)
			c += 1
		endWhile
		fTargetX = fTargetX + Spawner.X
		fTargetY = fTargetY + Spawner.Y
		
		; Now pick a random Z based on the length.
		; If flength == fleashLength, then it must be 0
		; If length == 0, then it can be -fWaterDepth
		fTargetZ = RandomFloat(fMinDepth, (fDepth - ((flength * fDepth) / fLeashLength)))
		fTargetZ = Spawner.Z - fTargetZ
		
		; Pick random target angle
		fTargetAngleZ = RandomFloat(-180.0, 180.0)
		fTargetAngleX = 0.0
	else
		; Spawner must be unloaded.  Abort!
		disableAndDelete()
	endif
		
endFunction

bool Function PickTargetFishForSchooling()
	if Spawner.is3Dloaded()
		TargetFish = Game.FindRandomReferenceOfAnyTypeInList(Spawner.CritterTypes, Spawner.X, Spawner.Y, Spawner.Z, fLeashLength - fSchoolingDistanceX) as CritterFish
		return (targetFish != none && targetFish != self)
	else
		return false
	endif
endFunction


Function PickRandomPointBehindTargetFish()

	if TargetFish
		float flength = fLeashLength * 2.0
		int max = 10   ; how many times before we give up?
		int c
		float fSpawnerX = Spawner.X
		float fSpawnerY = Spawner.Y
		float fSpawnerZ = Spawner.Z
		while ((flength > fLeashLength) && (c < max))
			; Pick random point around fish, accounting for depth
			float flocalDeltaX = RandomFloat(-fSchoolingDistanceX, fSchoolingDistanceX)
			float flocaldeltaY = RandomFloat(-fSchoolingDistanceY, 0.0) ; To be behind the other fish
			
			; Now turn that into absolute X Y offset
			float ftargetFishHeading = targetFish.GetAngleZ()
			float fdeltaX = Math.cos(ftargetFishHeading) * flocalDeltaX + Math.sin(ftargetFishHeading) * flocalDeltaY
			float fdeltaY = Math.cos(ftargetFishHeading) * flocalDeltaY - Math.sin(ftargetFishHeading) * flocalDeltaX
			
			fTargetX = targetFish.X + fdeltaX - fSpawnerX
			fTargetY = targetFish.Y + fdeltaY - fSpawnerY
			flength = Math.sqrt(fTargetX * fTargetX + fTargetY * fTargetY)
			
			; increment our recursion counter
			c += 1
		endWhile
		fTargetX = fTargetX + fSpawnerX
		fTargetY = fTargetY + fSpawnerY

		; Now pick a random Z
		; If flength == fleashLength, then it must be 0
		; If length == 0, then it can be -fWaterDepth
		fTargetZ = RandomFloat(fMinDepth, (fDepth - ((flength * fDepth) / fLeashLength)))
		fTargetZ = fSpawnerZ - fTargetZ
		
		fTargetAngleZ = targetFish.GetAngleZ()
		fTargetAngleX = 0.0
	else
; 		debug.trace("Tried to run PickRandomPointBehindTargetFish, but no valid TargetFish.  "+self)
	endif
	
endFunction

Function WarpToRandomPoint()
	
	; Pick a random point
	PickRandomPoint()

	; And warp to it
	SetPosition(fTargetX, fTargetY, fTargetZ)
	SetAngle(fTargetAngleX, 0.0, fTargetAngleZ)
	
endFunction

Function GoToNewPoint(float afSpeed)

	; Pick a random point
	PickRandomPoint()
	
	; And travel to it
	bMoving = true
	SplineTranslateTo(fTargetX, ftargetY, ftargetZ, fTargetAngleX, 0.0, fTargetAngleZ, fSplineCurvature, afSpeed, fMaxRotationSpeed)

endFunction

Function SchoolWithOtherFish(float afSpeed)

	if (TargetFish != none)
		PickRandomPointBehindTargetFish()

		bMoving = true
		SplineTranslateTo(fTargetX, ftargetY, ftargetZ, fTargetAngleX, 0.0, fTargetAngleZ, fSplineCurvature, afSpeed, fMaxRotationSpeed)
	else
; 		debug.trace("Tried to run SchoolWithOtherFish, but no valid TargetFish.  "+self)
	endif
endFunction

EVENT onCellDetach()
	; Safety measure - when my cell is detached, for whatever reason, kill me.
; 	;debug.trace("Killing self due to onCellDetach() - "+self)
	DisableAndDelete()
endEVENT
