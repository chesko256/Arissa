scriptName CritterSpawn extends ObjectReference

import Critter
import Utility

;----------------------------------------------
; Properties to be set for this Critter spawn
;----------------------------------------------

; The type of critter (base object) to create
FormList property CritterTypes auto
{ The base object to create references of to spawn critters}

; The distance from this spawner that Moths are allowed to be
float property fLeashLength = 500.0 auto
{ The distance that moths are allowed to be from this spawner}
float property fLeashHeight = 50.0 auto
{ The distance that dragonflies are allowed to be from above spawner}
float property fLeashDepth = 50.0 auto
{ The distance that fish are allowed to be from below spawner}
float property fMaxPlayerDistance = 2000.0 auto
{ The distance from the player before the Spawner stops spawning critters}

int property iMaxCritterCount = 10 auto
{ The maximum number of critters this spawner can generate}
float property fFastSpawnInterval = 0.1 auto
{ When spawning critters, the interval between spawns}
float property fSlowSpawnInterval = 5.0 auto
{ When spawning critters, the interval between spawns}

GlobalVariable property GameHour auto
{ Make this point to the GameHour global }
float property fStartSpawnTime = 6.0 auto
{ The Time after which this spawner can be active}
float property fEndSpawnTime = 11.0 auto
{ The Time before which this spawner can be active}

float property fLeashOverride auto
{Optional: Manually set roaming radius for critters spawned}

bool property bSpawnInPrecipitation auto
{Should this critter spawn in rain/snow?  DEFAULT: FALSE}

;----------------------------------------------
; Constants (shouldn't need to modify these)
;----------------------------------------------
float fCheckPlayerDistanceTime = 2.0

;----------------------------------------------
; Variables to keep track of spawned critters
;----------------------------------------------
int property iCurrentCritterCount = 0 auto hidden
bool bLooping
bool bPrintDebug = FALSE			; should usually be set to false.
int recursions

; Do initial stuff when my 3D has loaded up.
EVENT OnLoad()
	; The Spawner will register for update and periodically check whether the player is close or not
	; - JOEL REFACTOR - Going to use onLoad() & onUnload() instead of states?
	; GotoState("WaitingForPlayer")
	; - JOEL REFACTOR - also no longer need to update
	; RegisterForSingleUpdate(fCheckPlayerDistanceTime)
	
	if bPrintDebug == TRUE
; 		debug.trace("spawner " + self + " loaded.")
		recursions = 0
	endif
	
	; set our control bool to start the loop
	bLooping = TRUE
	
	while bLooping == TRUE
		if bPrintDebug == TRUE
			recursions += 1
; 			debug.trace("spawner " + self +  " while loop #" + recursions)
		endif
		
		if shouldSpawn() == FALSE
			; wait a bit, then see if the player is close again.
			; Removing this to eliminate some TPLOG spam
; ; 			debug.TraceConditional("player not yet near spawner " + self, bPrintDebug)
			utility.wait(fCheckPlayerDistanceTime)
		else
; ; 			debug.TraceConditional("spawner " + self + " ready to spawn!!!", bPrintDebug)
			; player must be nearby - spawn our initial critters
			; don't follow up as we no longer wish to re-generate new critters until the player leaves entirely
			spawnInitialCritterBatch()
			bLooping = FALSE
		endif
	endWhile
	
endEVENT

EVENT onUnload()
	; when our 3D unloads, stop looping until loaded again.
	bLooping = FALSE
; ; 	debug.TraceConditional("spawner " + self + " unloading due to onUnload() EVENT.", bPrintDebug)
endEVENT

EVENT onCellDetach()
	bLooping = FALSE
; ; 	debug.TraceConditional("spawner " + self + " unloading due to onCellDetach() EVENT.", bPrintDebug)
endEVENT

Function SpawnInitialCritterBatch()
	; How many do we need to spawn?
	int icrittersToSpawn = iMaxCritterCount - iCurrentCritterCount
	
	; Create that many critters
	int i = 0;
	while (i < icrittersToSpawn)
		; Create one critter at a time
		SpawnCritter()

		; Wait a bit before the next spawn
		;Wait(fFastSpawnInterval)
		
		; Next
		i = i + 1
	endWhile
endFunction

; Called by critters when they die
Event OnCritterDied()
	; Decrement current critter count, next time OnUpdate
	; gets called, we'll spawn a new one
	if iCurrentCritterCount > 0
		iCurrentCritterCount = iCurrentCritterCount - 1
	elseif iCurrentCritterCount == 0
		; don't do anything if already @ zero
	else
		; iCurrentCritterCount must be in the negatives.  Something is up, but for now increment towards zero
		iCurrentCritterCount = iCurrentCritterCount + 1
	endif
endEvent

; Spawns one Critter
bool Function SpawnCritter()
	if (iCurrentCritterCount < iMaxCritterCount) && (iCurrentCritterCount >= 0)
		; Go ahead with the actual spawn
		SpawnCritterAtRef(self)
		; Increment count
		iCurrentCritterCount = iCurrentCritterCount + 1
		return true
	elseif iCurrentCritterCount < 0
; 		debug.trace("("+self+") has invalid iCurrentCritterCount of "+iCurrentCritterCount+", abort!")
		; turn off loop
		bLooping = FALSE
	else
; 		debug.trace("("+self+") SpawnCritter() failed because iCurrentCritterCount is "+iCurrentCritterCount)
; 		;debug.trace("("+self+") iMaxCritterCount: "+iMaxCritterCount)
	endif
endFunction

; Spawns one Critter at a specific location
Function SpawnCritterAtRef(ObjectReference arSpawnRef)
	; Pick a random critter type
	Activator critterType = CritterTypes.GetAt(RandomInt(0, CritterTypes.GetSize() - 1)) as Activator
	
	; Create the critter and cast it to the critter base class
	ObjectReference critterRef = arSpawnRef.PlaceAtMe(critterType, 1, false, true)
	Critter thecritter = critterRef as Critter
	
	; Set initial variables on the critter
; ; 	Debug.TraceConditional("Spawner " + self + " is creating Critter " + thecritter, bPrintDebug);
	thecritter.SetInitialSpawnerProperties(fLeashLength, fLeashHeight, fLeashDepth, fMaxPlayerDistance + fLeashLength, self)
endFunction

; Utility method that returns the player's distance
float Function GetPlayerDistance()
	return Game.GetPlayer().GetDistance(self)
endFunction

; Utility method that tells the spawner whether it should spawn critters
bool Function ShouldSpawn()
	;DREW - Added an extra safety measure for if the object is stuck in the spawn check loop while the 3d is not loaded
	;	NOTE - is3dLoaded dumps an error when the 3d is not loaded, but the function still returns false which should
	;		set bLooping to false and jump out of the bLooping While, at which point no additional errors will be thrown
	if self.is3dLoaded()
		if !(GetPlayerDistance() <= fMaxPlayerDistance)
			return false
		endIf
		; Otherwise, base value on time of day (no handling of wrap around though...)
		return IsActiveTime()
	else		;if the 3d is not loaded jump out of the looped state. Just an extra safety measure.
; 		;debug.Trace(self + ": should be setting bLooping to False")
		bLooping = FALSE
		return false
	endif
endFunction

bool Function IsActiveTime()
	bool binTimeRange = false
	if (fEndSpawnTime >= fStartSpawnTime)
		binTimeRange = (GameHour.GetValue() >= fStartSpawnTime) && (GameHour.GetValue() < fEndSpawnTime)
	else
		binTimeRange = (GameHour.GetValue() >= fStartSpawnTime) || (GameHour.GetValue() < fEndSpawnTime)
	endIf
	return binTimeRange && ((Weather.GetCurrentWeather() == none) || \
								 (Weather.GetCurrentWeather().GetClassification() < 2) || \
								 (bSpawnInPrecipitation == TRUE))
endFunction
