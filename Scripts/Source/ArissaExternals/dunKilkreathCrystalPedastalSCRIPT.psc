Scriptname dunKilkreathCrystalPedastalSCRIPT extends ObjectReference  
import Debug
import Utility

objectReference Property Crystal auto Hidden

objectReference Property nextToActivate Auto
{If you want the next node in line to shoot, set it here}

quest Property myQuest Auto
{Quest}
int Property startStage Auto
{what Stage this should start on}

spell Property beamSpell Auto 
{BASEOBJECT: pointer to beam spell}

objectReference Property beamTarget Auto
{what you want the beam to shoot at}

int Property translateSpeed = 15 auto
{How fast the Crystal Moves DEFAULT = 15}

int Property zDistance = 17 auto
{How far the Crystal Moves in the Z direction DEFAULT = 17}

objectReference Property Door01 Auto
{First Door to be unlocked/opened}
objectReference Property Door02 Auto
{Second Door to be unlocked/opened}
objectReference Property loadDoor Auto

objectReference Property enableMarker Auto
{enables a marker that will enable other objects in the world}

float Property waitTimeBeam = 1.5 Auto
{Delay after translation to fire the beam effect DEFAULT = 1.5}
float Property waitTimeDoor = 0.5 Auto
{Delay to open the First Door DEFAULT = 0}
float Property waitTimeNextBeam = 0.5 auto
{Default: 1 second}

bool Property isTriggered = false auto hidden

objectReference Property BeamSource Auto
{source of the light beam}

Sound Property SoundStart  Auto
{beam Start sound}


event onCellLoad()
	Crystal = GetLinkedRef()
	trace("dunKilkreathCrystalPedastalSCRIPT Crystal:" + Crystal)
	if (isTriggered == TRUE)
	fireBeam()
	endif
endEvent
 
Event onActivate(ObjectReference akActionRef)
	if (isTriggered != TRUE)
		isTriggered = TRUE
		moveCrystal()
		wait(waitTimeBeam)
		fireBeam()
		enableMarker.enable()
		wait(waitTimeNextBeam)
		nextToActivate.Activate(self)
		wait(waitTimeDoor)
		unlockOpenDoor(door01)
		unlockOpenDoor(door02)
		unlockDoor(loadDoor)
	endif
endEvent
 
 function moveCrystal()
	;Game.ShakeController(0.5, 0.5, 2.0)
	Game.ShakeCamera(afStrength = 0.1, afDuration = 1.8)
	;wait(0.2 )
	;Crystal.TranslateTo(Crystal.X,Crystal.Y,Crystal.Z+zDistance,Crystal.getAngleX(),Crystal.getAngleY(),Crystal.getAngleZ(),translateSpeed)
	;Notification("Translating")
 endFunction
 
 function fireBeam()
	beamSpell.cast(BeamSource, beamTarget)
	SoundStart.play(self)  
	;beamSpell.cast(self, beamTarget)
	;Notification("Fire beam")
endFunction     
 
 function unlockOpenDoor(objectReference doorRef)
	doorRef.lock(false,true)
	doorRef.activate(self)
endFunction

function unlockDoor(objectReference doorRef)
	doorRef.lock(false,true)
endFunction

  
