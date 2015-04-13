Scriptname ItemWithSoudScript extends ObjectReference  
{Playes a looping sound for items.}

import sound

sound property MySoundLoop auto
int soundInstance 

Event onLoad()
	; Sound on
	soundInstance = MySoundLoop.play(self) 
EndEvent

Event onUnLoad()
	;Stop  sound
	StopInstance(soundInstance)
EndEvent
