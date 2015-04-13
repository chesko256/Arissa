scriptName CritterMoth extends Critter
{Main Behavior script for moths and butterflies}

import Utility
import form
import debug

; Properties (set through the editor)
FormList property PlantTypes auto
{ The list of plant types this moth can be attracted to}

; Constants
float Property fTimeAtPlantMin = 5.0 auto
{The Minimum time a Moth stays at a plant}
float Property fTimeAtPlantMax = 10.0 auto
{The Maximum time a Moth stays at a plant}
float Property fActorDetectionDistance = 300.0 auto
{The Distance at which an actor will trigger a flee behavior}
float Property fTranslationSpeedMean = 150.0 auto
{The movement speed when going from plant to plant, mean value}
float Property fTranslationSpeedVariance = 50.0 auto
{The movement speed when going from plant to plant, variance}
float Property fFleeTranslationSpeed = 300.0 auto
{The movement speed when fleeing from the player}
float Property fBellShapePathHeight = 150.0 auto
{The height of the bell shaped path}
float Property fFlockPlayerXYDist = 100.0 auto
{When flocking the player, the XY random value to add to its location}
float Property fFlockPlayerZDistMin = 50.0 auto
{When flocking the player, the min Z value to add to its location}
float Property fFlockPlayerZDistMax = 200.0 auto
{When flocking the player, the max Z value to add to its location}
float Property fFlockTranslationSpeed = 300.0 auto
{When flocking the player, the speed at which to move}
float Property fMinScale = 0.5 auto
{Minimum initial scale of the Moth}
float Property fMaxScale = 1.2 auto
{Maximum initial scale of the Moth}
float property fMinTravel = 64.0 auto
{Minimum distance a wandering moth/butterfly will travel}
float property fMaxTravel = 512.0 auto 
{Maximum distance a wandering moth/butterfly will travel}
string property LandingMarkerPrefix = "LandingSmall0" auto
{Prefix of landing markers on plants, default="LandingSmall0"}
float property fMaxRotationSpeed = 90.0 auto
{Max rotation speed while mocing, default = 90 deg/s}

; Variables
int iPlantTypeCount = 0

; Constants
float fWaitingToDieTimer = 10.0


; Called by the spawner to kick off the processing on this Moth
Event OnStart()
	; Pick a plant type that we're attracted to
	iPlantTypeCount = PlantTypes.GetSize()

	; Vary size a bit
	SetScale(RandomFloat(fMinScale, fMaxScale))
	
	; Switch state and trigger a callback immediately
; ; 	Debug.TraceConditional("Moth " + self + " warping to state AtPlant", bCritterDebug)
	
	if !(Game.GetPlayer().GetDistance(self) <= fMaxPlayerDistance )
		; Kill this critter
		DisableAndDelete()
	else
		WarpToNewPlant()
; ; 		Debug.TraceConditional("Moth " + self + " registering for update", bCritterDebug)

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

; The Current plant object
ObjectReference currentPlant = none

; Moth is at the plant
State AtPlant

	Event OnUpdate()
		
		; Is the player too far?
		if !(Game.GetPlayer().GetDistance(self) <= fMaxPlayerDistance )
			; Kill this critter
			DisableAndDelete()
		elseif (spawner.iCurrentCritterCount > spawner.iMaxCritterCount) || (spawner.iCurrentCritterCount < 0)
			; something's up with the spawner.  Kill critters until it recovers
; 			debug.trace(self+" updated, but spawner ("+spawner+") has bad iCurrentCritterCount ("+spawner.iCurrentCritterCount+")")
			disableAndDelete()
		else
			if (ShouldFlockAroundPlayer())
				; Player is close enough and has the ingredient we're attracted to,
				; If applicable, play takeoff animation
				DoPathStartStuff()
				
				; Flock to the player
				FlockToPlayer()
			else
				if (Spawner.IsActiveTime())
					; Good to update, check for close actors
					Actor closestActor = Game.FindClosestActorFromRef(self, fActorDetectionDistance)

					; Check whether we should flee and move faster
					float fspeed = 0.0
					if (closestActor != none)
; 						;Debug.Trace(self + " Oh noes! there is an Actor " + closestActor + " nearby, Flee")
						; Move fast
						fspeed = fFleeTranslationSpeed
					else
						; Move at regular speed
						fspeed = RandomFloat(fTranslationSpeedMean - fTranslationSpeedVariance, fTranslationSpeedMean + fTranslationSpeedVariance)
					endIf

					; Time to take off for another plant
					GoToNewPlant(fspeed)
				else
					; Time to go to bed,
					BellShapeTranslateToRefAtSpeedAndGotoState(Spawner, fBellShapePathHeight, fTranslationSpeedMean, fMaxRotationSpeed, "KillForTheNight")
				endIf
			endIf
		endIf
	endEvent
	
	Event OnCritterGoalReached()
; 		traceConditional(self + " reached goal", bCritterDebug)
		if !(Game.GetPlayer().GetDistance(self) <= fMaxPlayerDistance )
			; Moth is too far from the player, kill it
			DisableAndDelete()
		else
			if (Game.FindClosestActorFromRef(self, fActorDetectionDistance) != none)
				; There is an actor right there, trigger the update right away, so we'll flee
; ; 				Debug.TraceConditional("Moth " + self + " registering for update", bCritterDebug)
				RegisterForSingleUpdate(0.0)
			else
				; Wait at the plant, then take off again
; ; 				Debug.TraceConditional("Moth " + self + " registering for update", bCritterDebug)
				RegisterForSingleUpdate(RandomFloat(fTimeAtPlantMin, fTimeAtPlantMax))
			endIf
		endIf
	EndEvent
endState

; When the player has the ingredient we're interested in, follow him
State FollowingPlayer
	Event OnCritterGoalReached()
		; Are we too far from our spawner?
		if (!(Spawner.GetDistance(self) >= fLeashLength) && ShouldFlockAroundPlayer())
			; Nope, flock to the player
			FlockToPlayer()
		else
			; Go back to the plants
			GoToNewPlant(fFlockTranslationSpeed)
		endIf
	endEvent

endState

; When the moths go to sleep, they get deleted
State KillForTheNight
	Event OnCritterGoalReached()
		; We've reached the nest, die
; 		debug.trace ("Killing for the night: "+self)
		DisableAndDelete()
	endEvent
endState

; Catch bad OnUpdate registration
Event OnUpdate()
; ; 	Debug.TraceConditional("Moth " + self + " unregistering for update (::OnUpdate())", bCritterDebug)
	UnregisterForUpdate()
; 	Debug.Trace("Moth " + self + " receive OnUpdate() in the wrong state, killing itself", 2)
	DisableAndDelete()
endEvent

; Helper method to indicate whether the player has the ingredient
bool Function ShouldFlockAroundPlayer()
;	if (Game.GetPlayer().GetDistance(Spawner) > fRadius)
;		return false
;	endIf
;	return (Game.GetPlayer().GetItemCount(IngredientType) > 0)
	return false
endFunction

; Utility method, makes a moth flock to a random point around the player
Function FlockToPlayer()
	; Switch state
; ; 	Debug.TraceConditional("Moth " + self + " going to state FollowingPlayer", bCritterDebug)
	gotoState("FollowingPlayer")

	; Pick a random point around the player
	float ftargetX = Game.GetPlayer().X + RandomFloat(-fFlockPlayerXYDist, fFlockPlayerXYDist)
	float ftargetY = Game.GetPlayer().Y + RandomFloat(-fFlockPlayerXYDist, fFlockPlayerXYDist)
	float ftargetZ = Game.GetPlayer().Z + RandomFloat(fFlockPlayerZDistMin, fFlockPlayerZDistMax)
	float ftargetAngleZ = RandomFloat(-180, 180)
	float ftargetAngleX = RandomFloat(-20, 20)
	float fpathCurve = RandomFloat(fPathCurveMean - fPathCurveVariance, fPathCurveMean + fPathCurveVariance)

	; Travel to it
	SplineTranslateTo(ftargetX, ftargetY, ftargetZ, ftargetAngleX, 0.0, ftargetAngleZ, fpathCurve, fFlockTranslationSpeed, fMaxRotationSpeed)
endFunction

; Finds a new plant to fly to
ObjectReference Function PickNextPlant()
	; Look for a random plant within the radius of the Spawner
	int isafetyCheck = 0
	ObjectReference newPlant = CurrentPlant
	bool bnewPlantValid = false
	float fspawnerX = Spawner.X
	float fspawnerY = Spawner.Y
	float fspawnerZ = Spawner.Z
	while (!bnewPlantValid && (isafetyCheck < 5))

		; Grab a random plant from the list of valid plant types
		newPlant = Game.FindRandomReferenceOfAnyTypeInList(PlantTypes, fSpawnerX, fSpawnerY, fSpawnerZ, fLeashLength)
		
		; Check whether the new plant is valid (different from current)
		; and not too close to an actor
		bnewPlantValid = false
		if (newPlant != none && newPlant != currentPlant)
			if (Game.FindClosestActorFromRef(newPlant, fActorDetectionDistance) == none)
				bnewPlantValid = true
			endIf
		endIf
		
		; Safety counter
		isafetyCheck = isafetyCheck + 1
	endWhile
	
	if (isafetyCheck == 5)
; 		Debug.Trace("Moth " + self + " couldn't find a valid plant to go to", 1)
		return none
	else
		return newPlant
	endIf
endFunction

; Picks a new plant and fly to it if possible
Function GoToNewPlant(float afSpeed)
	; Find a plant reference, trying to pick a different one than the current one
	ObjectReference newPlant = PickNextPlant()
	
	if (newPlant != none)
		; Update the current plant to the new one
		currentPlant = newPlant
		
		; Pick random landing node
		; And start moving towards it
		string landingMarkerName = LandingMarkerPrefix + RandomInt(1, 3)
		if (newPlant.HasNode(landingMarkerName))
			BellShapeTranslateToRefNodeAtSpeedAndGotoState(CurrentPlant, landingMarkerName, fBellShapePathHeight, afSpeed, fMaxRotationSpeed, "AtPlant")
		else
; 			traceConditional(self + " could not find landing marker " + landingMarkerName + " on plant " + newPlant, bCritterDebug)
			string firstMarkerName = LandingMarkerPrefix + 1
			if (newPlant.HasNode(firstMarkerName))
				BellShapeTranslateToRefNodeAtSpeedAndGotoState(CurrentPlant, firstMarkerName, fBellShapePathHeight, afSpeed, fMaxRotationSpeed, "AtPlant")
			else
; 				traceConditional(self + " could not find landing marker " + firstMarkerName + " on plant " + newPlant, bCritterDebug)
				BellShapeTranslateToRefAtSpeedAndGotoState(CurrentPlant, fBellShapePathHeight, afSpeed, fMaxRotationSpeed, "AtPlant")
			endIf		
		endIf
			
	else
		; This moth is stuck, wait until the player is far enough away that it can delete itself
; 		Debug.Trace("Moth " + self + " is stuck and will wait to kill itself", 1)
		RegisterForSingleUpdate(fWaitingToDieTimer)
	endIf
endFunction

Function WarpToNewPlant()
	; Find a plant reference, trying to pick a different one than the current one
	ObjectReference newPlant = PickNextPlant()
	
	if (newPlant != none)
		; Update the current plant to the new one
		currentPlant = newPlant
		
		; Pick random landing node
		; And start moving towards it
		string landingMarkerName = LandingMarkerPrefix + RandomInt(1, 3)
		if (newPlant.HasNode(landingMarkerName))
			WarpToRefNodeAndGotoState(CurrentPlant, landingMarkerName, "AtPlant")
		else
; 			traceConditional(self + " could not find landing marker " + landingMarkerName + " on plant " + newPlant, bCritterDebug)
			string firstMarkerName = LandingMarkerPrefix + 1
			if (newPlant.HasNode(firstMarkerName))
				WarpToRefNodeAndGotoState(CurrentPlant, firstMarkerName, "AtPlant")
			else
; 				traceConditional(self + " could not find landing marker " + firstMarkerName + " on plant " + newPlant, bCritterDebug)
				WarpToRefAndGotoState(CurrentPlant, "AtPlant")
			endIf
		endIf
			
	else
		; This moth is stuck, wait until the player is far enough away that it can delete itself
; 		Debug.Trace("Moth " + self + " is stuck and will wait to kill itself", 1)
		RegisterForSingleUpdate(fWaitingToDieTimer)
	endIf
endFunction

EVENT onCellDetach()
	; Safety measure - when my cell is detached, for whatever reason, kill me.
; 	; debug.trace("Killing self due to onCellDetach() - "+self)
	DisableAndDelete()
endEVENT
