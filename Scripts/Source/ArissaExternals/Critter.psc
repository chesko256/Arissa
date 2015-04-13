scriptName Critter extends ObjectReference

; Imported for RandomFloat()
import Utility
import debug

;----------------------------------------------
; Properties to be set for this Critter
;----------------------------------------------

; Randomness added to location and orientation at a plant
float Property fPositionVarianceX = 20.0 auto
{When picking a destination reference, how much variance in he X coordinate the critter to travel to.}
float Property fPositionVarianceY = 20.0 auto
{When picking a destination reference, how much variance in he Y coordinate the critter to travel to.}
float Property fPositionVarianceZMin = 50.0 auto
{When picking a destination reference, how much variance in he Z coordinate the critter to travel to, lower bound}
float Property fPositionVarianceZMax = 100.0 auto
{When picking a destination reference, how much variance in he Z coordinate the critter to travel to, upper bound}
float Property fAngleVarianceZ = 90.0 auto
{When picking a destination reference, how much variance from the ref's Z angle the critter can end at}
float Property fAngleVarianceX = 20.0 auto
{When picking a destination reference, how much variance from the ref's X angle the critter can end at}

; Path Curviness
float Property fPathCurveMean = 100.0 auto
{When moving, how "curvy" the path can be, mean (see associated Variance)}
float Property fPathCurveVariance = 200.0 auto
{When moving, how "curvy" the path can be, variance (see associated Mean)}

; For bell-shaped paths, where along the path to place waypoints
float Property fBellShapedWaypointPercent = 0.2 auto
{When moving on a bell-shaped path, how far along the path to place the bell waypoint (so that the critter doesn't go straight up, but up and forward)}

; Animation events to be sent to the graph, and associated delays
string Property PathStartGraphEvent = "" auto
{Animation event to send when starting a path}
float Property fPathStartAnimDelay = 1.0 auto
{Duration of the path start animation (delay used before the critter actually moves)}
string Property PathEndGraphEvent = "" auto
{Animation event to send when ending a path}
float Property fPathEndAnimDelay = 1.0 auto
{Duration of the path end animation (delay used before the critter returns path complete)}

; properties relevant to collection items
ingredient property lootable auto
{ingredient gathered from this critter}
formlist property nonIngredientLootable auto
{Optional: If our loot item is not an ingredient, use this instead.}
formlist  property fakeCorpse auto
{Optional: If we want to leave a fake "Corpse" behind, point to it here.}
bool property bPushOnDeath = FALSE auto
{apply a small push on death to add english to ingredients?  Default: False}
explosion property deathPush auto
{a small explosion force to propel wings on death}
int property lootableCount = 1 auto
{How many lootables do I drop on Death? Default: 1}
bool property bIncrementsWingPluckStat = FALSE auto
{do I count towards the wings plucked misc stat?  will be false for majority}

; properties relevant to landing behavior
Static property LandingMarkerForm auto
{What landing marker to use to compute offsets from landing position}
float property fLandingSpeedRatio = 0.33 auto
{The speed percentage to use when landing, Default = 0.33 (or 33% of flight speed)}
string property ApproachNodeName = "ApproachSmall01" auto
{The name of the approach node in the landing marker, Default=ApproachSmall01}


;----------------------------------------------
; Hidden Properties for AI Sim
;----------------------------------------------
bool property reserved auto hidden
{should this object be invalidated for searches?}
objectReference property hunter auto hidden
{if being hunted, by whom?}
bool bKilled = false
; if been killed once, don't do Die() a second time

;----------------------------------------------
; Properties set by the spawner
;----------------------------------------------

; The distance from the spawner this critter can be
float Property fLeashLength auto hidden
; The distance from the player this critter can be
float Property fMaxPlayerDistance auto hidden
; The Height above the spawner that critters be move to (when applicable: dragonfly)
float Property fHeight auto hidden
; The Depth below the spawner that critters be move to (when applicable: fish)
float Property fDepth auto hidden
; The spawner that owns this critter
CritterSpawn Property Spawner auto hidden

;----------------------------------------------
; Debugging
;----------------------------------------------
bool Property bCritterDebug = false auto hidden

;----------------------------------------------
; Events
;----------------------------------------------

FUNCTION Die()
	if bKilled == false
		bKilled = true
		disableAndDelete(false)
		int i = 0
		while i < lootableCount
			i += 1
			objectReference createdLootable
			if fakeCorpse ; do we have the optional fakeCorpse parameter? 
				; we have to jump through a hoop here to get the more open-ended functionality of using a formlist
				int total = fakeCorpse.getSize()  ; it would unusual if this was > 1, but just in case...
				int current = 0
				while current < total
					createdLootable = placeAtMe(fakeCorpse.getAt(current), 1)
					current += 1
				endWhile
			else
				createdLootable = placeatMe(lootable, 1)
			endif
			createdLootable.moveTo(createdLootable, randomFloat(self.getWidth(), 2*self.getWidth()), randomFloat(self.getWidth(), 2*self.getWidth()), -1*(randomFloat(self.getHeight(), 2*self.getHeight())), false)
		endWhile
		if bPushOnDeath == TRUE			
			placeatMe(deathPush)
		endif
	endif
endFUNCTIOn

EVENT onActivate(objectReference actronaut)
	if (bKilled == false)
		bKilled = true
		disableAndDelete(false) ; Nuke the critter as early as possible so the player knows something happened
		;Player receives loot for direct activation?  Probably need a bool here for other critters in future
		if nonIngredientLootable ; do I have the optional non-ingredient lootable parameter set?
			actronaut.additem(nonIngredientLootable, lootableCount)
		else
			actronaut.addItem(lootable, lootableCount)
		endif
		if bIncrementsWingPluckStat == TRUE
			game.IncrementStat("Wings Plucked", lootableCount)
		endif
	endIf
endEVENT

EVENT onHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	debug.trace(self + " got hit by " + akAggressor)
	Die()
endEVENT

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	debug.trace(self + " got hit by magic of " + akCaster)
	Die()
EndEvent

; This event is called once the Critter is ready to kick off its processing
Event OnStart()
endEvent

; Triggered when the critter is about to reach its destination
Event OnCritterGoalAlmostReached()
endEvent

; Triggered when the critter reaches its destination
Event OnCritterGoalReached()
endEvent

; Triggered if critter failed reaching the destination
Event OnCritterGoalFailed()
endEvent

; Indicates whether the critter has had everything  initialized
;bool b3DInitialized = false
bool bDefaultPropertiesInitialized = false
bool bSpawnerVariablesInitialized = false

; Prevent getting event for 3D loaded after move to
bool bfirstOnStart = true

; These are used to store location/orientation
ObjectReference landingMarker = none
ObjectReference dummyMarker = none

; Called as soon as the critter is loaded
;Event OnLoad()
; ; ;	Debug.TraceConditional("Critter " + self + " OnLoad() called!", bCritterDebug)
;	if (bfirstOnStart)
;		; We know the 3D is good
;		b3DInitialized = true
;		; If everything else is also good, start doing stuff
;		CheckStateAndStart()
;		bfirstOnStart = false
;	endIf
;endEvent

; Called when properties for this object have been initialized
Event OnInit()
	; We know default properties are good
	bDefaultPropertiesInitialized = true
	; If everything else is also good, start doing stuff
	CheckStateAndStart()
endEvent

; Called by the spawner when it has set the initial variables
float fradiusPropVal
float fmaxPlayerDistPropVal
float fheightPropVal
float fdepthPropVal
CritterSpawn spawnerPropVal
Function SetInitialSpawnerProperties(float afRadius, float afHeight, float afDepth, float afMaxPlayerDistance, CritterSpawn arSpawner)
	; Set initial variables to be set once default properties have been set
	fradiusPropVal = afRadius
	fheightPropVal = afHeight
	fdepthPropVal = afDepth
	fmaxPlayerDistPropVal = afMaxPlayerDistance
	spawnerPropVal = arSpawner
	; We know spawner-set variables are good now
	bSpawnerVariablesInitialized = true
	; If everything else is also good, start doing stuff
	CheckStateAndStart()
endFunction

; Stores initial spawner properties temporarily until object is ready to have them overwritten
Function SetSpawnerProperties()
	fLeashLength = fradiusPropVal
	fHeight = fheightPropVal
	fDepth = fDepthPropVal
	fMaxPlayerDistance = fmaxPlayerDistPropVal
	Spawner = spawnerPropVal
endFunction

; Checks that the critter is all initialized, and if so, kick off the behavior
Function CheckStateAndStart()
; ; 	Debug.TraceConditional("Critter " + self + "bDefaultPropertiesInitialized=" + bDefaultPropertiesInitialized + ", bSpawnerVariablesInitialized=" + bSpawnerVariablesInitialized, bCritterDebug)

	if (bDefaultPropertiesInitialized && bSpawnerVariablesInitialized)
	
		; Set actual properties from the spawner
		SetSpawnerProperties()
		
		; Do the next part asynchronously, to allow the spawner to keep creating more critters
		GotoState("KickOffOnStart")
		RegisterForSingleUpdate(0.0)
	endIf
endFunction

state KickOffOnStart
Function OnUpdate()
	GotoState("")
; ; 	Debug.TraceConditional("Critter " + self + " is creating landing markers", bCritterDebug)
	; Create our landing and dummy markers
	landingMarker = PlaceAtMe(LandingMarkerForm)
	while(!landingMarker.Is3DLoaded() && is3DLoaded())
		wait(0.1)
	endWhile

	dummyMarker = PlaceAtMe(LandingMarkerForm)
	while(!dummyMarker.Is3DLoaded() && is3DLoaded())
		wait(0.1)
	endWhile

	; We're all set to go, start doing stuff
; ; 	Debug.TraceConditional("Critter " + self + " is triggering OnStart", bCritterDebug)
	OnStart()
	Enable()
endFunction
endState


; Called to remove the critter
; This should be called when a critter is too far from the player to be seen for instance
Function DisableAndDelete(bool abFadeOut = true)

	; Unregister for any kind of update
	UnregisterForUpdate()
	UnregisterForUpdateGameTime()

	; Disable the critter - don't wait if we aren't fading
	if !abFadeOut
		DisableNoWait()
	else
		Disable(abFadeOut)
	endIf
	
	; Stop Any movement
	CurrentMovementState = "Idle"

	if (GetParentCell())
		StopTranslation()
	endIf

	; Delete dummy marker
	if (landingMarker != none)
		landingMarker.Delete()
	endIf
	if (dummyMarker != none)
		dummyMarker.Delete()
	endIf

	; And delete ourselves
	if getParentCell()
		Delete()
	endif

	; Notify spawner
	if (Spawner != none)
		Spawner.OnCritterDied()
	endIf

	; Debug
; 	;Debug.Trace("Critter " + self + " just killed itself.")
endFunction 

; Variable used to store the desired state after translation
string CurrentTargetState = ""

; Target Node name
string CurrentTargetNode = ""

; Internal state used when moving
string CurrentMovementState = "Idle"

Function PlaceLandingMarker(ObjectReference arTarget, string asTargetNode)
; ; 	Debug.TraceConditional("Critter " + self + " placing landing marker " + landingMarker, bCritterDebug)
	while(!landingMarker.Is3DLoaded() && is3DLoaded())
		wait(0.1)
	endWhile

	if (asTargetNode != "")
		landingMarker.MoveToNode(arTarget, asTargetNode)
	else
		; Use random offset from ref pivot point
		landingMarker.SetPosition(arTarget.X + RandomFloat(-fPositionVarianceX, fPositionVarianceX), arTarget.Y + RandomFloat(-fPositionVarianceY, fPositionVarianceY), arTarget.Z + RandomFloat(fPositionVarianceZMin, fPositionVarianceZMax))
		landingMarker.SetAngle(arTarget.GetAngleX() + RandomFloat(-fAngleVarianceX, fAngleVarianceX), arTarget.GetAngleY(), arTarget.GetAngleZ() + RandomFloat(-fAngleVarianceZ, fAngleVarianceZ))
	endIf

	; MoveTo might have temporarily disabled 3D
	while (!landingMarker.Is3DLoaded() && is3DLoaded())
		wait(0.1)
	endWhile
endFunction

Function PlaceDummyMarker(ObjectReference arTarget, string asTargetNode)
; ; 	Debug.TraceConditional("Critter " + self + " placing Dummy marker " + dummyMarker, bCritterDebug)
	while(!dummyMarker.Is3DLoaded() && is3DLoaded())
		wait(0.1)
	endWhile
	dummyMarker.MoveToNode(arTarget, asTargetNode)
	while(!dummyMarker.Is3DLoaded() && is3DLoaded())
		wait(0.1)
	endWhile
endFunction

; Variables used during spline paths
float fStraightLineTargetX
float fStraightLineTargetY
float fStraightLineTargetZ
float fStraightLineTargetAngleX
float fStraightLineTargetAngleY
float fStraightLineTargetAngleZ
float fStraightLineSpeed
float fStraightLineMaxRotationSpeed

; Travel to the given reference at a given speed
; This function will call the OnCritterGoalReached() event upon completion
Function SplineTranslateToRefAtSpeed(ObjectReference arTarget, float afSpeed, float afMaxRotationSpeed)
	; Make sure we're keyframed so we can be moved around
	SetMotionType(Motion_Keyframed, false)

	; If applicable, play animation
	DoPathStartStuff()

	; We're about to kick off a standard spline stranslation, so switch to that state
; ; 	Debug.TraceConditional("Critter " + self + " going to state SplineTranslation", bCritterDebug)
	CurrentMovementState = "SplineTranslation"
	
	; Compute target location
	float ftargetX
	float ftargetY
	float ftargetZ

	; Use a dummy marker to get the node location
	PlaceLandingMarker(arTarget, CurrentTargetNode)

	; Place a dummy marker to store the position / orientation
	PlaceDummyMarker(landingMarker, ApproachNodeName)

	; Use the X,Y and Z of the dummy marker
	fStraightLineTargetX = dummyMarker.X
	fStraightLineTargetY = dummyMarker.Y
	fStraightLineTargetZ = dummyMarker.Z
	fStraightLineTargetAngleX = dummyMarker.GetAngleX()
	fStraightLineTargetAngleY = dummyMarker.GetAngleY()
	fStraightLineTargetAngleZ = dummyMarker.GetAngleZ()
	
	float fdeltaX = fStraightLineTargetX - X
	float fdeltaY = fStraightLineTargetY - Y
	float fdeltaZ = fStraightLineTargetZ - Z
	ftargetX = X + fdeltaX * 0.9
	ftargetY = Y + fdeltaY * 0.9
	ftargetZ = Z + fdeltaZ * 0.9

	; Clear target node for next time
	CurrentTargetNode = ""

	fStraightLineSpeed = afSpeed
	fStraightLineMaxRotationSpeed = afMaxRotationSpeed
	
	; Kick off the the translation
	SplineTranslateTo(ftargetX, ftargetY, ftargetZ, fStraightLineTargetAngleX, fStraightLineTargetAngleY, fStraightLineTargetAngleZ, RandomFloat(fPathCurveMean - fPathCurveVariance, fPathCurveMean + fPathCurveVariance), afSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference's named node
; This function will call the OnCritterGoalReached() event upon completion
Function SplineTranslateToRefNodeAtSpeed(ObjectReference arTarget, string arNode, float afSpeed, float afMaxRotationSpeed)
	; Set target node name
	CurrentTargetNode = arNode
	
	; Call base version
	SplineTranslateToRefAtSpeed(arTarget, afSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference and then switch to the given state
; This function will call the OnCritterGoalReached() event upon completion
Function SplineTranslateToRefAtSpeedAndGotoState(ObjectReference arTarget, float afSpeed, float afMaxRotationSpeed, string arTargetState)
	; Set target state for the OnTranslationComplete event
	CurrentTargetState = arTargetState
	
	; Call base version
	SplineTranslateToRefAtSpeed(arTarget, afSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference's named node and then switch to the given state
; This function will call the OnCritterGoalReached() event upon completion
Function SplineTranslateToRefNodeAtSpeedAndGotoState(ObjectReference arTarget, string arNode, float afSpeed, float afMaxRotationSpeed, string arTargetState)
	; Set target state for the OnTranslationComplete event
	CurrentTargetState = arTargetState
	
	; Set target node name
	CurrentTargetNode = arNode
	
	; Call base version
	SplineTranslateToRefAtSpeed(arTarget, afSpeed, afMaxRotationSpeed)
endFunction


; Travel to the given reference at a given speed
; This function will call the OnCritterGoalReached() event upon completion
Function TranslateToRefAtSpeed(ObjectReference arTarget, float afSpeed, float afMaxRotationSpeed)
	; Make sure we're keyframed so we can be moved around
	SetMotionType(Motion_Keyframed, false)

	; If applicable, play animation
	DoPathStartStuff()

	; We're about to kick off a standard spline stranslation, so switch to that state
; ; 	Debug.TraceConditional("Critter " + self + " going to state SplineTranslation", bCritterDebug)
	CurrentMovementState = "Translation"
	
	; Compute target location
	float ftargetX
	float ftargetY
	float ftargetZ

	; Use a dummy marker to get the node location
	PlaceLandingMarker(arTarget, CurrentTargetNode)

	; Place a dummy marker to store the position / orientation
	PlaceDummyMarker(landingMarker, ApproachNodeName)

	; Use the X,Y and Z of the dummy marker
	fStraightLineTargetX = dummyMarker.X
	fStraightLineTargetY = dummyMarker.Y
	fStraightLineTargetZ = dummyMarker.Z
	fStraightLineTargetAngleX = dummyMarker.GetAngleX()
	fStraightLineTargetAngleY = dummyMarker.GetAngleY()
	fStraightLineTargetAngleZ = dummyMarker.GetAngleZ()
	
	float fdeltaX = fStraightLineTargetX - X
	float fdeltaY = fStraightLineTargetY - Y
	float fdeltaZ = fStraightLineTargetZ - Z
	ftargetX = X + fdeltaX * 0.9
	ftargetY = Y + fdeltaY * 0.9
	ftargetZ = Z + fdeltaZ * 0.9

	; Clear target node for next time
	CurrentTargetNode = ""

	fStraightLineSpeed = afSpeed
	
	; Kick off the the translation
	TranslateTo(ftargetX, ftargetY, ftargetZ, fStraightLineTargetAngleX, fStraightLineTargetAngleY, fStraightLineTargetAngleZ, afSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference's named node
; This function will call the OnCritterGoalReached() event upon completion
Function TranslateToRefNodeAtSpeed(ObjectReference arTarget, string arNode, float afSpeed, float afMaxRotationSpeed)
	; Set target node name
	CurrentTargetNode = arNode
	
	; Call base version
	TranslateToRefAtSpeed(arTarget, afSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference and then switch to the given state
; This function will call the OnCritterGoalReached() event upon completion
Function TranslateToRefAtSpeedAndGotoState(ObjectReference arTarget, float afSpeed, float afMaxRotationSpeed, string arTargetState)
	; Set target state for the OnTranslationComplete event
	CurrentTargetState = arTargetState
	
	; Call base version
	TranslateToRefAtSpeed(arTarget, afSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference's named node and then switch to the given state
; This function will call the OnCritterGoalReached() event upon completion
Function TranslateToRefNodeAtSpeedAndGotoState(ObjectReference arTarget, string arNode, float afSpeed, float afMaxRotationSpeed, string arTargetState)
	; Set target state for the OnTranslationComplete event
	CurrentTargetState = arTargetState
	
	; Set target node name
	CurrentTargetNode = arNode
	
	; Call base version
	TranslateToRefAtSpeed(arTarget, afSpeed, afMaxRotationSpeed)
endFunction


; Variables used during bell-shaped paths
ObjectReference BellShapeTarget = none
float fBellShapeSpeed
float fBellShapeMaxRotationSpeed
float fBellShapeStartX
float fBellShapeStartY
float fBellShapeStartZ
float fBellShapeStartLandingPointX
float fBellShapeStartLandingPointY
float fBellShapeStartLandingPointZ
float fBellShapeTargetPointX
float fBellShapeTargetPointY
float fBellShapeTargetPointZ
float fBellShapeTargetAngleX
float fBellShapeTargetAngleY
float fBellShapeTargetAngleZ
float fBellShapeDeltaX
float fBellShapeDeltaY
float fBellShapeDeltaZ
float fBellShapeHeight

; Travel to the given reference in a bell-shaped path
; This function will call the OnCritterGoalReached() event upon completion
Function BellShapeTranslateToRefAtSpeed(ObjectReference arTarget, float afBellHeight, float afSpeed, float afMaxRotationSpeed)

	; Make sure we're keyframed so we can be moved around
	SetMotionType(Motion_Keyframed, false)

	; If applicable, play animation
	DoPathStartStuff()

	; We're about to kick off a bell-shaped stranslation, so switch to the first state
; ; 	Debug.TraceConditional("Critter " + self + " going to state BellShapeGoingUp", bCritterDebug)
	CurrentMovementState = "BellShapeGoingUp"
	
	fBellShapeStartX = self.X
	fBellShapeStartY = self.Y
	fBellShapeStartZ = self.Z
	
	; Use a dummy marker to get the node location
	PlaceLandingMarker(arTarget, CurrentTargetNode)

	; Place a dummy marker to store the position / orientation
	PlaceDummyMarker(landingMarker, ApproachNodeName)

	; Use the X,Y and Z of the dummy marker
	fBellShapeStartLandingPointX = dummyMarker.X
	fBellShapeStartLandingPointY = dummyMarker.Y
	fBellShapeStartLandingPointZ = dummyMarker.Z
	fBellShapeTargetPointX = landingMarker.X
	fBellShapeTargetPointY = landingMarker.Y
	fBellShapeTargetPointZ = landingMarker.Z
	fBellShapeTargetAngleX = landingMarker.GetAngleX()
	fBellShapeTargetAngleY = landingMarker.GetAngleY()
	fBellShapeTargetAngleZ = landingMarker.GetAngleZ()

	; Clear target node for next time
	CurrentTargetNode = ""
	
	; Compute location for the "UP" portion of the path
	fBellShapeDeltaX = fBellShapeTargetPointX - fBellShapeStartX
	fBellShapeDeltaY = fBellShapeTargetPointY - fBellShapeStartY
	fBellShapeDeltaZ = fBellShapeTargetPointZ - fBellShapeStartZ
	
	; Remember the bell height and the target
	fBellShapeHeight = afBellHeight
	BellShapeTarget = arTarget
	fBellShapeSpeed = afSpeed
	fBellShapeMaxRotationSpeed = afMaxRotationSpeed
	
	; Compute point 1/5th of the way along (1/5 is an example, the percentage is defined by a property)
	float fFirstWaypointX = fBellShapeStartX + fBellShapeDeltaX * fBellShapedWaypointPercent
	float fFirstWaypointY = fBellShapeStartY + fBellShapeDeltaY * fBellShapedWaypointPercent	
	float fFirstWaypointZ = fBellShapeStartZ + fBellShapeDeltaZ * fBellShapedWaypointPercent	+ fBellShapeHeight
	
	; Kick off the the translation
	SplineTranslateTo(fFirstWaypointX, fFirstWaypointY, fFirstWaypointZ, GetAngleX(), GetAngleY(), GetAngleZ(), fPathCurveMean, fBellShapeSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference's named node in a bell-shaped path
; This function will call the OnCritterGoalReached() event upon completion
Function BellShapeTranslateToRefNodeAtSpeed(ObjectReference arTarget, string arNode, float afBellHeight, float afSpeed, float afMaxRotationSpeed)
	; Set target node name
	CurrentTargetNode = arNode
	
	; Call base version
	BellShapeTranslateToRefAtSpeed(arTarget, afBellHeight, afSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference in a bell-shaped path and then switch to the given state
; This function will call the OnCritterGoalReached() event upon completion
Function BellShapeTranslateToRefAtSpeedAndGotoState(ObjectReference arTarget, float afBellHeight, float afSpeed, float afMaxRotationSpeed, string arTargetState)
	; Set target state for the OnTranslationComplete event
	CurrentTargetState = arTargetState
	
	; Call base version
	BellShapeTranslateToRefAtSpeed(arTarget, afBellHeight, afSpeed, afMaxRotationSpeed)
endFunction

; Travel to the given reference's named node in a bell-shaped path and then switch to the given state
; This function will call the OnCritterGoalReached() event upon completion
Function BellShapeTranslateToRefNodeAtSpeedAndGotoState(ObjectReference arTarget, string arNode, float afBellHeight, float afSpeed, float afMaxRotationSpeed, string arTargetState)
	; Set target state for the OnTranslationComplete event
	CurrentTargetState = arTargetState
	
	; Set target node name
	CurrentTargetNode = arNode
	
	; Call base version
	BellShapeTranslateToRefAtSpeed(arTarget, afBellHeight, afSpeed, afMaxRotationSpeed)
endFunction

Function WarpToRefAndGotoState(ObjectReference arTarget, string asState)
	PlaceLandingMarker(arTarget, "")
	MoveTo(landingMarker);
	
	; Switch state
; ; 	Debug.TraceConditional("Critter " + self + " Warping to ref (and switching to " + CurrentTargetState + " )", bCritterDebug)
	GotoState(asState)
	CurrentMovementState == "Idle"
endFunction

Function WarpToRefNodeAndGotoState(ObjectReference arTarget, string asNode, string asState)
	PlaceLandingMarker(arTarget, asNode)
	MoveTo(landingMarker);
	
	; Switch state
; ; 	Debug.TraceConditional("Critter " + self + " Warping to ref (and switching to " + CurrentTargetState + " )", bCritterDebug)
	GotoState(asState)
	CurrentMovementState == "Idle"
endFunction

;----------------------------------------------
; Internal bell-shaped path management
;----------------------------------------------

; Handle translation complete event
Event OnTranslationComplete()
	if (CurrentMovementState == "BellShapeGoingUp")
		; Switch state to the next segment
; ; 		Debug.TraceConditional("Critter " + self + " going to state BellShapeGoingAcross", bCritterDebug)
		CurrentMovementState = "BellShapeGoingAcross"

		; Move to the 2nd waypoint
		float fsecondWaypointPercent = 1.0 - fBellShapedWaypointPercent
		float fSecondWaypointX = fBellShapeStartX + fBellShapeDeltaX * fsecondWaypointPercent
		float fSecondWaypointY = fBellShapeStartY + fBellShapeDeltaY * fsecondWaypointPercent
		float fSecondWaypointZ = fBellShapeStartZ + fBellShapeDeltaZ * fsecondWaypointPercent + fBellShapeHeight
	
		; Kick off the the translation
		SplineTranslateTo(fSecondWaypointX, fSecondWaypointY, fSecondWaypointZ, GetAngleX(), GetAngleY(), GetAngleZ(), fPathCurveMean, fBellShapeSpeed, fBellShapeMaxRotationSpeed)
	elseif (CurrentMovementState == "BellShapeGoingAcross")
		; Switch state to the last segment
; ; 		Debug.TraceConditional("Critter " + self + " going to state BellShapeGoingDown", bCritterDebug)
		CurrentMovementState = "BellShapeGoingDown"

		; Move to the goal
		SplineTranslateTo(fBellShapeStartLandingPointX, fBellShapeStartLandingPointY, fBellShapeStartLandingPointZ, fBellShapeTargetAngleX, fBellShapeTargetAngleY, fBellShapeTargetAngleZ, fPathCurveMean, fBellShapeSpeed, fBellShapeMaxRotationSpeed)
	elseif (CurrentMovementState == "BellShapeGoingDown")
	
		; Wait for the end event
; ; 		Debug.TraceConditional("Critter " + self + " going to state BellShapeLanding", bCritterDebug)
		
		; Play landing animation if applicable
		DoPathEndStuff()
		
		CurrentMovementState = "BellShapeLanding"
		
		; Move to the destination
		TranslateTo(fBellShapeTargetPointX, fBellShapeTargetPointY, fBellShapeTargetPointZ, fBellShapeTargetAngleX, fBellShapeTargetAngleY, fBellShapeTargetAngleZ, fBellShapeSpeed * fLandingSpeedRatio, fBellShapeMaxRotationSpeed)

	elseif (CurrentMovementState == "BellShapeLanding")

		; Switch state
; ; 		Debug.TraceConditional("Critter " + self + " going to state Idle (and switching to " + CurrentTargetState + " )", bCritterDebug)
		if (CurrentTargetState != "")
; ; 			Debug.TraceConditional("Critter " + self + " going to state " + CurrentTargetState, bCritterDebug)
			GotoState(CurrentTargetState)
		endIf
		CurrentMovementState == "Idle"
		
		; Clear all global variables that we shouldn't use anymore, just for safety's sake
		BellShapeTarget = none
		CurrentTargetState = ""

		; Trigger event for derived script to handle
		OnCritterGoalReached()
	elseif (CurrentMovementState == "SplineTranslation")
		; Play landing animation if applicable
		DoPathEndStuff()
		
		CurrentMovementState = "StraightLineLanding"

		; Move to the destination
		SplineTranslateTo(fStraightLineTargetX, fStraightLineTargetY, fStraightLineTargetZ, fStraightLineTargetAngleX, fStraightLineTargetAngleY, fStraightLineTargetAngleZ, RandomFloat(fPathCurveMean - fPathCurveVariance, fPathCurveMean + fPathCurveVariance), fStraightLineSpeed * fLandingSpeedRatio, fStraightLineMaxRotationSpeed)
	elseif (CurrentMovementState == "StraightLineLanding")
		; Switch state
		if (CurrentTargetState != "")
; ; 			Debug.TraceConditional("Critter " + self + " going to state " + CurrentTargetState, bCritterDebug)
			GotoState(CurrentTargetState)
		endIf
		CurrentMovementState == "Idle"
		CurrentTargetState = ""

		; Trigger event for derived script to handle
		OnCritterGoalReached()
	elseif (CurrentMovementState == "Translation")
		; Play landing animation if applicable
		DoPathEndStuff()

		; Switch state
		if (CurrentTargetState != "")
; ; 			Debug.TraceConditional("Critter " + self + " going to state " + CurrentTargetState, bCritterDebug)
			GotoState(CurrentTargetState)
		endIf
		CurrentMovementState == "Idle"
		CurrentTargetState = ""

		; Trigger event for derived script to handle
		OnCritterGoalReached()
	else
		; Don't know this state, just trigger event for derived script to handle
		OnCritterGoalReached()
	endif
endEvent


Event OnTranslationAlmostComplete()
	if ((CurrentMovementState != "BellShapeGoingUp") && (CurrentMovementState != "BellShapeGoingAcross") && (CurrentMovementState != "BellShapeGoingDown") && (CurrentMovementState != "SplineTranslation"))
		 ; Trigger custom event
		 OnCritterGoalAlmostReached()
	endif
endEvent


; Regardless of state, handle the translation failed event
Event OnTranslationFailed()
	; Trigger event
; 	Debug.Trace("Critter " + self + " Translation Failed", 1)
	OnCritterGoalFailed()
endEvent

; Debugging
Function PrintInitialProperties()
; 	Debug.Trace("Critter " + self + " initial properties")
; 	Debug.Trace("\tfRadius = " + fLeashLength)
; 	Debug.Trace("\tfMaxPlayerDistance = " + fMaxPlayerDistance)
; 	Debug.Trace("\tSpawner = " + Spawner)
endFunction


Function DoPathStartStuff()
	; Transition to the flight state
	SetAnimationVariableFloat("fTakeOff", 1.0);
endFunction

Function DoPathEndStuff()
	; Transition to the hover/landed state
	SetAnimationVariableFloat("fTakeOff", 0.0);
endFunction

;----------------------------------------
; Fly to a random point within the leash radius
;----------------------------------------------
FUNCTION flyAroundSpawner(float fminTravel, float fMaxTravel, float fSpeed, float afMaxRotationSpeed, bool bflyBelowSpawner = false)
{this function chooses and flies to a new, nearby point}
; if flybelowSpawner is 
	float fMinHeight = spawner.z
	float fMaxheight = fMinHeight + (0.5*fLeashLength)
	float oldX = self.x
	float oldY = self.y
	float oldZ = self.z
	float newX = (self.x + randomFloat(fminTravel, fMaxTravel))
	float newY = (self.Y + randomFloat(fminTravel, fMaxTravel))
	float newZ = (self.Z + randomFloat(fminTravel, fMaxTravel))
	doPathStartStuff()
	; some safety checks to keep him from flying far from home
	if newX > spawner.X
		if newX > spawner.X + fLeashLength
			newX = spawner.X + fLeashLength
		endif
	else
		if newX < spawner.X - fLeashLength
			newX = spawner.X - fLeashLength
		endif
	endif
	
	if newY > spawner.Y
		if newY > spawner.Y + fLeashLength
			newY = spawner.Y + fLeashLength
		endif
	else
		if newY < spawner.Y - fLeashLength
			newY = spawner.Y - fLeashLength
		endif 
	endif
	
	if bFlyBelowSpawner == true
		if newZ < fMinHeight
			newZ = fMinHeight
		endif	
		if newZ > fMaxHeight
			newZ = fMaxHeight
		endif
	endif
	; now fly to that spot!
	;gotoMarker.setPosition(newX, newY, newZ)
	TranslateTo(newX, newY, newZ, self.getAngleX(), self.getAngleY(), self.getAngleZ(), fSpeed, afMaxRotationSpeed)
; 	traceConditional(self + " flying to point at: " + newX as int + ", " + newY as int + ", " + newZ as int, bCritterDebug) 
endFunction

