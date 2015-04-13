Scriptname CWArtilleryAimingMenuScript extends ObjectReference  

;NOTE this doesn't work well as a generic script because art is built with random things being up, forward, etc.
;So this is going to be the CWArrowVolley object's aimer.

Message Property AimingMessageAngle Auto
{Which is the message that contains the angle options? default = GetForm(0X00080C29)}

Message Property AimingMessagePosition Auto
{Which is the message that contains the position options? default = GetForm(0X00080C2A)}

ObjectReference Property FaceTarget Auto
{Which reference should this object face when select face object option? default = game.getPlayer()}

int Property ButtonAngleLeft 		= 0 Auto
{Integer of menu item in messagebox; default = 0}
int Property ButtonAngleRight 		= 1 Auto
{Integer of menu item in messagebox; default = 1}
int Property ButtonAngleBack 		= 2 Auto
{Integer of menu item in messagebox; default = 2}
int Property ButtonAngleForward		= 3 Auto
{Integer of menu item in messagebox; default = 3}
int Property ButtonAngleFace 		= 4 Auto
{Integer of menu item in messagebox; default = 4}
int Property ButtonAngleNextMenu 	= 5 Auto
{Integer of menu item in messagebox; default = 5}
int Property ButtonAngleLog 			= 6 Auto
{Integer of menu item in messagebox; default = 6}
int Property ButtonAngleDone 		= 7 Auto
{Integer of menu item in messagebox; default = 7}

int Property ButtonPostionLeft 		= 0 Auto
{Integer of menu item in messagebox; default = 0}
int Property ButtonPostionRight		= 1 Auto
{Integer of menu item in messagebox; default = 1}
int Property ButtonPostionBack		= 2 Auto
{Integer of menu item in messagebox; default = 2}
int Property ButtonPostionForward	= 3 Auto
{Integer of menu item in messagebox; default = 3}
int Property ButtonPostionUp 		= 4 Auto
{Integer of menu item in messagebox; default = 4}
int Property ButtonPostionDown 		= 5 Auto
{Integer of menu item in messagebox; default = 5}
int Property ButtonPostionNextMenu 	= 6 Auto
{Integer of menu item in messagebox; default = 6}
int Property ButtonPostionLog 		= 7 Auto
{Integer of menu item in messagebox; default = 7}
int Property ButtonPostionDone 		= 8 Auto
{Integer of menu item in messagebox; default = 8}

bool Property Aim Auto
{This puts the object in aiming mode}

float translateSpeed = 100.0


Event OnInit()
	if AimingMessageAngle == none
		AimingMessageAngle = Game.GetForm(0X00080C29) as Message
	EndIf

	if AimingMessagePosition == none
		AimingMessagePosition = Game.GetForm(0X00080C2A) as Message
	EndIf

	if FaceTarget == None
		FaceTarget = Game.GetPlayer()
	
	EndIf
	
EndEvent


Event OnActivate(ObjectReference akActionRef)
	if Aim == true
		showAimingMenu()
	
	EndIf
EndEvent

function showAimingMenu()

	Message thisMessage = AimingMessageAngle
	
	int button = thisMessage.Show()
	
	float offset = 1
	
	if button == ButtonAngleLeft
		translateTo(X, Y, Z, GetAngleX(), GetAngleY(), GetAngleZ() - offset, translateSpeed)
	elseif button == ButtonAngleRight
		translateTo(X, Y, Z, GetAngleX(), GetAngleY(), GetAngleZ() + offset, translateSpeed)
	elseif button == ButtonAngleBack
		translateTo(X, Y, Z, GetAngleX() - offset, GetAngleY(), GetAngleZ(), translateSpeed)
	elseif button == ButtonAngleForward
		translateTo(X, Y, Z, GetAngleX() + offset, GetAngleY(), GetAngleZ(), translateSpeed)
	elseif button == ButtonAngleFace
		translateTo(X, Y, Z, GetAngleX(), GetAngleY(), GetFacingToTarget(FaceTarget, True), translateSpeed)
	elseif button == ButtonAngleNextMenu
		showPositioningMenu()
	elseif button == ButtonAngleLog
		logPositionAndAngle()
	EndIf

	if button != ButtonAngleDone
		showAimingMenu()
	EndIf
	
EndFunction


function showPositioningMenu()

	Message thisMessage = AimingMessagePosition
	
	int button = thisMessage.Show()
	
	float offset = 1
	
	float xOffset
	float yOffset
	
	
	
	if button == ButtonPostionLeft
		xOffset = offset * math.cos(GetAngleZ())
		yOffset = offset * -( math.sin(GetAngleZ()) )
		translateTo(X - xOffset, Y - yOffset, Z, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
		
	elseif button == ButtonPostionRight
		xOffset = offset * math.cos(GetAngleZ())
		yOffset = offset *  -( math.sin(GetAngleZ()) )
		translateTo(X + xOffset, Y + yOffset, Z, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
		
	elseif button == ButtonPostionBack
		xOffset = offset * math.sin(GetAngleZ())
		yOffset = offset * math.cos(GetAngleZ())
		translateTo(X * xOffset, Y * yOffset, Z, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
		
	elseif button == ButtonPostionForward
		xOffset = offset * math.sin(GetAngleZ())
		yOffset = offset * math.cos(GetAngleZ())
		translateTo(X + xOffset, Y + yOffset, Z, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
		
	elseif button == ButtonPostionUp
		translateTo(X, Y, Z + offset, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
	elseif button == ButtonPostionDown
		translateTo(X, Y, Z - offset, GetAngleX(), GetAngleY(), GetAngleZ(), translateSpeed)
	elseif button == ButtonPostionNextMenu
		showAimingMenu()
	elseif button == ButtonPostionLog
		LogPositionAndAngle()
	EndIf
	

	if button != ButtonPostionDone
		showPositioningMenu()
	EndIf
	
EndFunction

function LogPositionAndAngle()
; 	CWScript.Log("CWArtilleryAimingMenuScript", self + "X: " + X + ", Y:" + Y + ", Z:" + Z + ", Angle X:" + GetAngleX() + ", Angle Y:" + GetAngleY() + ", Angle Z:" + GetAngleZ(), 1, 1)

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


