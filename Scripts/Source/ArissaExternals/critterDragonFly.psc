scriptName CritterDragonFly extends Critter
{Main Behavior script for fish schools}

import Utility
import form
import debug

; Constants
float Property fActorDetectionDistance = 300.0 auto
{The Distance at which an actor will trigger a flee behavior}
float Property fTranslationSpeedMean = 175.0 auto
{The movement speed when going from plant to plant, mean value}
float Property fTranslationSpeedVariance = 75.0 auto
{The movement speed when going from plant to plant, variance}
float Property fFleeTranslationSpeed = 500.0 auto
{The movement speed when fleeing from the player}
float Property fMinScale = 0.5 auto
{Minimum initial scale of the Firefly}
float Property fMaxScale = 0.8 auto
{Maximum initial scale of the Firefly}
float Property fSplineCurvature = 200.0 auto
{Spline curvature}
float Property fMinTimeNotMoving = 1.0 auto
float Property fMaxTimeNotMoving = 5.0 auto
float Property fMinFleeHeight = 2000.0 auto
float Property fMaxFleeHeight = 3000.0 auto
float property fMaxRotationSpeed = 540.0 auto
{Max rotation speed while mocing, default = 540 deg/s}


; Constants
float fWaitingToDieTimer = 10.0

; Called by the spawner to kick off the processing on this Firefly
Event OnStart()

	; Vary size a bit
	SetScale(RandomFloat(fMinScale, fMaxScale))
	
	; Play the hover animation
	PlayAnimation(PathStartGraphEvent)
	;PlayAnimation("WingsFlyingAnim")
	;PlayAnimation("FlightLoop")
	
	if (Game.GetPlayer().GetDistance(self) > fMaxPlayerDistance )
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

Event OnUpdate()
	
	; Is the player too far?
	if (Game.GetPlayer().GetDistance(self) > fMaxPlayerDistance )
		; Kill this critter
		DisableAndDelete()
	else
		; Good to update, check for close actors
		Actor closestActor = Game.FindClosestActorFromRef(self, fActorDetectionDistance)

		; Check whether we should flee and move faster
		float fspeed = 0.0
		if (closestActor != none)
; 			;Debug.Trace(self + " Oh noes! there is an Actor " + closestActor + " nearby, Flee")
			; Move fast
			fspeed = fFleeTranslationSpeed
			
			; Fly far far away
			FlyAway(fspeed)
		else
			; Move at regular speed
			fspeed = RandomFloat(fTranslationSpeedMean - fTranslationSpeedVariance, fTranslationSpeedMean + fTranslationSpeedVariance)

			; Time to take off for another point
			GoToNewPoint(fspeed)
		endIf

	endIf
endEvent

Event OnCritterGoalReached()
; 	traceConditional(self + " reached goal", bCritterDebug)
	if (Game.GetPlayer().GetDistance(self) > fMaxPlayerDistance )
		; Firefly is too far from the player, kill it
		DisableAndDelete()
	else
		if (Game.FindClosestActorFromRef(self, fActorDetectionDistance) != none)
			; There is an actor right there, trigger the update right away, so we'll flee
; ; 			Debug.TraceConditional("Firefly " + self + " registering for immediate update", bCritterDebug)
			RegisterForSingleUpdate(0.0)
		else
			; Wait at the plant, then take off again
; ; 			Debug.TraceConditional("Firefly " + self + " registering for update at plant", bCritterDebug)
			RegisterForSingleUpdate(RandomFloat(fMinTimeNotMoving, fMaxTimeNotMoving))
		endIf
	endIf
EndEvent


float fTargetX
float fTargetY
float fTargetZ
float fTargetAngleZ
float fTargetAngleX

Function PickRandomPoint()

	; First find a random point within the radius
	float flength = fLeashLength * 2.0 ; So that we loop at least once
	fTargetX = 0.0
	fTargetY = 0.0
	; pick a radom point in the disk of fleashlength radius
	int c 
	int max = 10
	while (flength > fLeashLength) && (c < max)
		fTargetX = RandomFloat(-fLeashLength, fLeashLength)
		fTargetY = RandomFloat(-fLeashLength, fLeashLength)
		flength = Math.sqrt(fTargetX * fTargetX + fTargetY * fTargetY)
		c += 1
	endWhile
	fTargetX = fTargetX + Spawner.X
	fTargetY = fTargetY + Spawner.Y
	
	; Now pick a random Z
	fTargetZ = RandomFloat(0.0, fHeight)
	fTargetZ = Spawner.Z + fTargetZ
	
	; Pick random target angle
	fTargetAngleZ = RandomFloat(-180.0, 180.0)
	fTargetAngleX = 0.0
	
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
		
	; safety - make sure me and my spawner are both still loaded!
	if (is3DLoaded() && getParentCell() && spawner.getParentCell())
		; And travel to it
		SplineTranslateTo(fTargetX, ftargetY, ftargetZ, fTargetAngleX, 0.0, fTargetAngleZ, fSplineCurvature, afSpeed, fMaxRotationSpeed)
	else
		disableAndDelete()
	endif
	
endFunction

Function PickRandomPointOutsideLeash()

	; Pick a random point far away
	fTargetX = RandomFloat(fMaxPlayerDistance, fMaxPlayerDistance * 2.0)
	fTargetY = RandomFloat(fMaxPlayerDistance, fMaxPlayerDistance * 2.0)
	if (RandomInt(0,1) == 1)
		fTargetX = -fTargetX
	endIf
	if (RandomInt(0,1) == 1)
		fTargetY = -fTargetY
	endIf
	fTargetZ = RandomFloat(fMinFleeHeight, fMaxFleeHeight)

	fTargetX = fTargetX + Spawner.X
	fTargetY = fTargetY + Spawner.Y
	fTargetZ = fTargetZ + Spawner.Z
	
	fTargetAngleX = 0.0
	fTargetAngleZ = RandomFloat(-180.0, 180.0)

endFunction

Function FlyAway(float afSpeed)

	; safety - make sure me and my spawner are both still loaded!
	if (is3DLoaded() && getParentCell() && spawner.getParentCell())
		PickRandomPointOutsideLeash()
		SplineTranslateTo(fTargetX, ftargetY, ftargetZ, fTargetAngleX, 0.0, fTargetAngleZ, fSplineCurvature, afSpeed, fMaxRotationSpeed)
	else
		disableAndDelete()
	endif
	
endFunction

EVENT onCellDetach()
	; Safety measure - when my cell is detached, for whatever reason, kill me.
; 	;debug.trace("Killing self due to onCellDetach() - "+self)
	DisableAndDelete()
endEVENT