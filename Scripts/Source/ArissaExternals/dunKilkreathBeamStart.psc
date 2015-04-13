Scriptname dunKilkreathBeamStart extends ObjectReference  
import Debug
import Utility

objectReference Property beamTarget auto
{What the beam is aiming at}

spell Property beamSpell Auto 
{BASEOBJECT: pointer to beam spell}

quest Property myQuest Auto
{Quest}
int Property startStage Auto
{what Stage this should start on}

bool Property isTriggered = false auto hidden

Event OnLoad()
	;if (myquest.isStageDone(startStage) == TRUE)
	isTriggered == TRUE
	fireBeam()
	;endif
endEvent

event onCellLoad()
	;if (isTriggered == TRUE)
	fireBeam()
	;endif
endEvent

 function fireBeam()
	;if (myquest.isStageDone(startStage) == TRUE)
		beamSpell.cast(self, beamTarget)
		;Notification("Fire beam")
	;endIf	
endFunction  