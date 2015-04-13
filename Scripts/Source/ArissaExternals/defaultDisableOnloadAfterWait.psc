Scriptname defaultDisableOnloadAfterWait extends ObjectReference  
{This reference will disable a set time after being enabled.}
import debug
import game
import utility

float property timeBeforeDisable = 1.0 auto
{Time before you want this reference to disable after it is enabled. - DEFAULT = 1}

bool property willFade = FALSE auto
{Whether this reference will fade when it is disabled. - DEFAULT = 0}

Event OnLoad()
	wait(timeBeforeDisable)
	self.Disable(willFade)
EndEvent