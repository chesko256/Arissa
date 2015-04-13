scriptName NorRotatingDoorSetupScript extends ObjectReference
{
- This script, placed on a NorRotatingDoor, allows you to set its initial angle. The door then rotates to that angle on load.
- This isn't ideal-- if the player loads in next to the door, they'll see it rotate, and may be able to interfere with it-- but this seems ok for testing purposes.
- Note that this script is NOT suitable for systems of rotating doors (as in dunDeadMensRespite), since Wait() is latent and may yield inconsistent results.
- Note that NorRotatingDoors rotate 15 degrees/sec (a 180-degree arc in 12s).
}


import debug
import utility

int property desiredAngle auto

EVENT onLoad()
	;Recursively normalize the angle to (-180, 180)
	if (desiredAngle > 180)
		desiredAngle = 180 - desiredAngle
		onLoad()
	elseif (desiredAngle < -180)
		desiredAngle = 360 + desiredAngle
		onLoad()
	;Rotate on shortest distance.
	elseif (desiredAngle > 0)
		self.playAnimation("rotateLeft")
		Wait(desiredAngle / 15)
		self.playAnimation("Stop")
	Else
		self.playAnimation("rotateRight")
		Wait((-1 * desiredAngle) / 15)
		self.playAnimation("Stop")
	EndIf	
EndEvent