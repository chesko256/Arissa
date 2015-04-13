Scriptname dunKilkreathBeamShooterScript extends ObjectReference  
import Debug
import Utility

quest Property myQuest Auto
int Property startStage Auto

objectReference Property beamTarget Auto
{what you want the beam to shoot at}

objectReference Property nextToActivate Auto
{If you want another node to shoot, this is what you set it as}

objectReference Property Door01 Auto
objectReference Property Door02 Auto
objectReference Property loadDoor Auto

objectReference Property TriggerRef Auto

int Property translateSpeed = 100 Auto
{Default: 100 - how long to rotate}

spell Property Beam Auto 
{BASEOBJECT: pointer to beam spell}

float Property waitTimeBeam Auto
float Property waitTimeDoor Auto
float Property waitTimeNextBeam = 1.0 auto
{Default: 1 second}

bool Property flip = False auto 
bool Property startOn = false Auto

bool Property isTriggered = false auto hidden

bool stopAll = false

Event OnLoad()
	if (startOn == True && (myQuest.isStageDone(startStage)) == TRUE)
	aim() 
	fireBeam()
	endif
endEvent

event onCellLoad()
	if (isTriggered == TRUE)
	aim()
	fireBeam()
	endif
endEvent

Event onActivate(ObjectReference akActionRef)
	if (isTriggered==TRUE || startOn == TRUE || (myQuest.isStageDone(startStage)) == FALSE)
	;Notification(isTriggered)
		stopAll = TRUE
	endif
	;if (akActionRef == game.GetPlayer() && stopAll == FALSE)
	if (stopAll == FALSE)
		;Notification("FIRE!!!")
		isTriggered = TRUE
		triggerRef.enable()
		Aim()
		wait(waitTimeBeam)
		fireBeam()
		wait(waitTimeNextBeam)
		nextToActivate.Activate(self)
		wait(waitTimeDoor)
		unlockOpenDoor(door01)
		unlockOpenDoor(door02)
		unlockDoor(loadDoor)
	endif
endEvent

float function GetFacingToTargetZ(ObjectReference TargetRef, bool invertFacing = False)

		float deltaX = TargetRef.X - X
		float deltaY = TargetRef.Y - Y
		float newAngle = math.atan(deltaX/deltaY)
		
		;notification(deltaX)
		;notification(deltaY)
		
		;notification(newangle)
		
		if flip ==True
			newAngle += 180
		endIf
		
		;if (DeltaX < 0 && DeltaY == 0)
		;	newAngle += 180
		;endif
		
		;if (deltaX < 0)
		;	newAngle -= 180
		;endif
		
		;notification(newangle)
		return newAngle 
EndFunction

function FireBeam()
	beam.cast(self, BeamTarget)
endFunction       

function unlockOpenDoor(objectReference doorRef)
	doorRef.lock(false,true)
	doorRef.activate(self)
endFunction

function unlockDoor(objectReference doorRef)
	doorRef.lock(false,true)
endFunction

function Aim()
		translateTo(X,Y,Z,getAngleX(),getAngleY(),GetFacingtoTargetZ(BeamTarget),translateSpeed)
		;Notification(GetAngleX())
		;Notification(GetAngleY())
		;Notification(GetAngleZ())
endfunction


