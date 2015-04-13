Scriptname CWCatapultScript extends ObjectReference  
{Script on the CWCatapult Activator}

;NOTES:

;NORMAL OPERATION:
;To start catapults, 1) Enable() them, THEN 2) call TurnOn() -- THE ORDER IS IMPORTANT... ENABLE() FIRST if you don't then you put it in the mode to always fire as if it were "offscreen" and unloaded
;To stop catapults, 1) call the turnOff() function, then 2) Disable() them -- THE ORDER IS IMPORTANT
;When it's appropriate and you want to start using the CWCatapultStrikeSpawners to pin point where each hit should land, disable() the catapult which will cause it to start using the special effects instead of practical projectiles.

;When the catapult unloads it sets the UseCWCatapultStrikeSpawners bool to true and calls startSpawningCatapultStrikes() which based on the CWBattlePhase will place special fx explosions at linked refs linked with keywords CW1, CW2, CW3, CW4, CW5 based on the phase

;START DISABLED AND FIRE USING SPECIAL EFFECTS ONLY:
;To make a catapult never appear in the world but still fire with the special fx explosions, make sure it starts disabled, and instead of enable() it, just call turnOn() function on it. It assumes if it's disabled and you call turnOn() it should start firing as if it was unloaded


;AIMING THE CATAPULT
;Run the game, and "setpv aim True" on it in the console
;Now when you activate it in the ready position, it will pop up an aim menu
;One of the options is "Log Coordinates" this will print out the x, y, z position and angles to a text file so you can then enter those in the editor
;One special option is the "Face Target" button. By default this is the player, so you can run to where you want it to aim towards and then activate it via console (prid it, then "activate player") and it will face toward you
;you can also set this as a property on the reference if you have another reference you want to aim it at
;DON'T FORGET to push the "Log Coordinates" button on each catapult you aim, or you will have lost your targetting data


Weapon Property WeaponToFire Auto
{BASEOBJECT: Set this to CWCatapultWeapon, this is the weapon that the fire() function is called on.}

Ammo Property AmmoToFire Auto
{BASEOBJECT: Set this to CWCatapultAmmo, this is the ammo parameter that the fire() function is passed.}

GlobalVariable Property CWBattlePhase Auto
{BASEOBJECT: Pointer to CWBattlePhase global}

keyword Property CW1 Auto
{BASEOBJET: pointer to keyword CW1 which defines the CWCatapultStrikerSpawner associated with phase 1 that should place catapult strike effects if this catapult is unloaded and CWBattlePhase is the correct phase}

keyword Property CW2 Auto
{BASEOBJET: pointer to keyword CW2 which defines the CWCatapultStrikerSpawner associated with phase 2 that should place catapult strike effects if this catapult is unloaded and CWBattlePhase is the correct phase}

keyword Property CW3 Auto
{BASEOBJET: pointer to keyword CW3 which defines the CWCatapultStrikerSpawner associated with phase 3 that should place catapult strike effects if this catapult is unloaded and CWBattlePhase is the correct phase}

keyword Property CW4 Auto
{BASEOBJET: pointer to keyword CW4 which defines the CWCatapultStrikerSpawner associated with phase 4 that should place catapult strike effects if this catapult is unloaded and CWBattlePhase is the correct phase}

keyword Property CW5 Auto
{BASEOBJET: pointer to keyword CW5 which defines the CWCatapultStrikerSpawner associated with phase 5 that should place catapult strike effects if this catapult is unloaded and CWBattlePhase is the correct phase}

keyword Property CWAllPhases Auto
{BASEOBJET: pointer to keyword CWAllPhases which defines the CWCatapultStrikerSpawner associated with all phases that should place catapult strike effects if this catapult is unloaded}

Message Property CWCatapultMsgAngle Auto
{BASEOBJECT: pointer to the CWCatapultMsgAngle message}

Message Property CWCatapultMsgPosition Auto
{BASEOBJECT: pointer to the CWCatapultMsgAngle message}

float property MinStrikeSpawnerTime = 5.0	 Auto
{Optional REFERENCE: minimum seconds that should pass between each CWCatapultStrike special effect Explosion from this catapult}

float property MaxStrikeSpawnerTime = 10.0	 Auto
{Optional REFERENCE: maximum seconds that should pass between each CWCatapultStrike special effect Explosion from this catapult}

Bool Property Aim Auto
{DEBUG: Put the catapult in aiming mode.}

ObjectReference Property FaceTarget auto
{DEBUG: object ref id aim at, set before activating the Aiming mode menu in game}





;Private Properties / Variables
bool property UseCWCatapultStrikeSpawners auto  ;when this is true, don't launch normally, but instead call in special effect explosions (this is set to true when the object is unloaded)
{DON'T SET THIS, FOR DEBUGGING AND INTERNAL USE BY SCRIPT ONLY}

;set bu TurnOn() and TurnOff()
bool Property TurnedOn Auto 		;*** WHEN WE ARE DONE SETTING UP THIS SHOULD BE OFF BY DEFAILT AND TURNED ON WITH A FUNCTION
{DON'T SET THIS, FOR DEBUGGING AND INTERNAL USE BY SCRIPT ONLY}

;<constants>
;state names - must be the same as the name of the states
string busy = "busy" 			;busy animating
string ready = "ready"		;loaded and ready to fire
string fired = "fired"		;fired Projectile



;animation events - for convenience these are declared as string variables
string aeFire = "fire"				;send this event to cause the catapult arm to fly up and launch the payload
string aeLaunch = "launch"			;[OBSOLETE] sent from activator at the moment the payload leaves the arm - this is when the weapon should call fire()
string aeFired = "fired"				;sent from activator when the launch animation is complete and it's safe to allow activate events to load it again
string aeReload = "reload"			;send this event to cause the catapult arm to lower and spawn a new payload
string aeReloaded = "reloaded"		;sent from activator when the reload animation is finished and it's safe to allow activate events to launch it again

string aeStartFired = "startFired"	;send to activator to start a catapult in the fired position. Do not call this any other time than OnLoad or it will look bad.
;</constants>

Event OnLoad()

	
	((self as ObjectReference) as CWCatapultOffscreenFireControlScript).StopOffscreenFiring()
	UseCWCatapultStrikeSpawners = False

; 	CWScript.Log("CWCatapultScript", self + "OnLoad()")

	RegisterForAnimationEvent(self, aeFire)		;arm goes up and payload launces
	RegisterForAnimationEvent(self, aeLaunch)		;last few frames as the payload launches - should coincide with the fire() function call 
	RegisterForAnimationEvent(self, aeFired)		;arm is at rest after finished launching
	RegisterForAnimationEvent(self, aeReload)		;arm goes down and payload appears in it
	RegisterForAnimationEvent(self, aeReloaded)	;arm is down and payload appeared
	RegisterForAnimationEvent(self, aeStartFired)	;arm should start up
	
endEvent

Event OnUnload()

	if UseCWCatapultStrikeSpawners == False && TurnedOn == true		;if we aren't already doing this for some reason, go ahead and Start
		startSpawningCatapultStrikes()
	EndIf

;	debug.MessageBox(self + "OnUnload()")
; 	CWScript.Log("CWCatapultScript", self + "OnUnload()")
	
	UnRegisterForAnimationEvent(self, aeFire)		
	UnRegisterForAnimationEvent(self, aeLaunch)		 
	UnRegisterForAnimationEvent(self, aeFired)			
	UnRegisterForAnimationEvent(self, aeReload)
	UnRegisterForAnimationEvent(self, aeReloaded)	
	UnRegisterForAnimationEvent(self, aeStartFired)	
endEvent

state busy
	Event OnBeginState()
; 		CWScript.Log("CWCatapultScript", self + "OnBeginState() busy")
	EndEvent
	
	;catch activate
	Event OnActivate(ObjectReference akActionRef)
; 		CWScript.Log("CWCatapultScript", self + "OnActivate(" + akActionRef + "): busy, so doing nothing.")
	EndEvent

	
EndState

auto state ready
	Event OnBeginState()
; 		CWScript.Log("CWCatapultScript", self + "OnBeginState() ready")
	EndEvent
	
	;catch activate
	Event OnActivate(ObjectReference akActionRef)
	
		if aim == true
			showAimingMenu()
		Else
		
			if UseCWCatapultStrikeSpawners == False
				launch()
; 				CWScript.Log("CWCatapultScript", self + "OnActivate(" + akActionRef + ") ready, so called launch().")
			
			Else
; 				CWScript.Log("CWCatapultScript", self + "OnActivate(" + akActionRef + ") UseCWCatapultStrikeSpawners == True so I am not launching normally but calling in SFX catapult explosions.")
			
			EndIf
		EndIf

	EndEvent
	
	
EndState

state fired
	Event OnBeginState()
; 		CWScript.Log("CWCatapultScript", self + "OnBeginState() fired")
	EndEvent
	
	;catch activate
	Event OnActivate(ObjectReference akActionRef)
		reload()
; 		CWScript.Log("CWCatapultScript", self + "OnActivate(" + akActionRef + ") fired, so called reload.")
	EndEvent
	
EndState


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 		CWScript.Log("CWCatapultScript", self + "ProcessAnimationEvent(" + asEventName + ")")
		if asEventName == aeReloaded
			GoToState(ready)
		
		elseif asEventName == aeFired
			GoToState(fired)
		
		endif
EndEvent


function TurnOn()
	;allowed to fire
	TurnedOn = True

;*** PUT THIS BACK IN WHEN WE HAVE ACTORS LAUNCHING ENABLED CATAPULTS
;	if IsDisabled()
		startSpawningCatapultStrikes()
;	EndIf
EndFunction


function TurnOff(bool AndDisable = True)
	;not allowed to fire
	TurnedOn = False
	
	if AndDisable == True
		disable()
	EndIf
	
	((self as ObjectReference) as CWCatapultOffscreenFireControlScript).StopOffscreenFiring()
	
EndFunction

float function GetTimeToNextLaunch()
		float timeToNextLaunch = Utility.RandomFloat(MinStrikeSpawnerTime, MaxStrikeSpawnerTime)
; 		CWScript.Log("CWCatapultScript", self + "GetTimeToNextLaunch() returning " + timeToNextLaunch)
		Return timeToNextLaunch
EndFunction


function startSpawningCatapultStrikes()

	if TurnedOn == False
; 		CWScript.Log("GetTimeToNextLaunch", self + "WARNING: my TurnedOn variable is false, I should NOT be calling startSpawningCatapultStrikes on myself.", 2, 1, 1)

	Else

		UseCWCatapultStrikeSpawners = True	
		((self as ObjectReference) as CWCatapultOffscreenFireControlScript).StartOffscreenFiring(GetTimeToNextLaunch())
		
	EndIf
	
EndFunction

function launch()
	GoToState(busy)
; 	CWScript.Log("CWCatapultScript", self + "launch()")
	PlayAnimationAndWait(aeFire, aeLaunch)
	
	WeaponToFire.fire(self, AmmoToFire)
	
EndFunction

function reload()
	GoToState(busy)
; 	CWScript.Log("CWCatapultScript", self + "reload()")
	PlayAnimation(aeReload)
	
EndFunction




;AIMING MENU STUFF


function showAimingMenu()

	float translateSpeed = 100

	Message thisMessage = CWCatapultMsgAngle
	
	int button = thisMessage.Show()
	int left = 0
	int right = 1
	int back = 2
	int forward = 3
	int face = 4
	int nextMenu = 5
	int log = 6
	int done = 7

	
	float offset = 1
	
	if button == left
		translateTo(X, Y, Z, GetAngleX(), GetAngleY(), GetAngleZ() - offset, translateSpeed)
	elseif button == right
		translateTo(X, Y, Z, GetAngleX(), GetAngleY(), GetAngleZ() + offset, translateSpeed)
	elseif button == back
		translateTo(X, Y, Z, GetAngleX(), GetAngleY() - offset, GetAngleZ(), translateSpeed)
	elseif button == forward
		translateTo(X, Y, Z, GetAngleX(), GetAngleY() + offset, GetAngleZ(), translateSpeed)
	elseif button == face
		translateTo(X, Y, Z, GetAngleX(), GetAngleY(), GetFacingToTarget(FaceTarget, True), translateSpeed)
	elseif button == nextMenu
		showPositioningMenu()
	elseif button == log
		logPositionAndAngle()
	EndIf

	if button != done
		showAimingMenu()
	EndIf
	
EndFunction


function showPositioningMenu()

	float translateSpeed = 100

	Message thisMessage = CWCatapultMsgPosition
	
	int button = thisMessage.Show()
	int left = 0
	int right = 1
	int back = 2
	int forward = 3
	int up = 4
	int down = 5
	int nextMenu = 6
	int log = 7
	int done = 8

	
	float offset = 1
	
	float xOffset
	float yOffset
	
	
	
	;NOTE: the catapult art is setup facing backwards which is why when moving left/back we add the offsets and moving right/forward we subtract the offsets
	
	if button == left
		xOffset = offset * math.cos(GetAngleZ())
		yOffset = offset * -( math.sin(GetAngleZ()) )
		translateTo(X + xOffset, Y + yOffset, Z, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
		
	elseif button == right
		xOffset = offset * math.cos(GetAngleZ())
		yOffset = offset *  -( math.sin(GetAngleZ()) )
		translateTo(X - xOffset, Y - yOffset, Z, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
		
	elseif button == back
		xOffset = offset * math.sin(GetAngleZ())
		yOffset = offset * math.cos(GetAngleZ())
		translateTo(X + xOffset, Y + yOffset, Z, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
		
	elseif button == forward
		xOffset = offset * math.sin(GetAngleZ())
		yOffset = offset * math.cos(GetAngleZ())
		translateTo(X - xOffset, Y - yOffset, Z, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
		
	elseif button == up
		translateTo(X, Y, Z + offset, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
	elseif button == down
		translateTo(X, Y, Z - offset, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
	elseif button == nextMenu
		showAimingMenu()
	elseif button == log
		LogPositionAndAngle()
	EndIf
	

	if button != done
		showPositioningMenu()
	EndIf
	
EndFunction

function LogPositionAndAngle()
; 	CWScript.Log("CWCatapultAimingLog", self + "X: " + X + ", Y:" + Y + ", Z:" + Z + ", Angle X:" + GetAngleX() + ", Angle Y:" + GetAngleY() + ", Angle Z:" + GetAngleZ(), 1, 1)

EndFunction


float function GetFacingToTarget(ObjectReference TargetRef, bool invertFacing = False)

		float deltaX = TargetRef.X - X
		float deltaY = TargetRef.Y - Y
		float newAngle = math.atan(deltaX/deltaY)

		if TargetRef.Y < Y
			newAngle += 180
		EndIf

		if invertFacing
			if newAngle >= 180
				newAngle -= 180
			Else
				newAngle += 180
			EndIf
		EndIf
		
		return newAngle 
EndFunction

