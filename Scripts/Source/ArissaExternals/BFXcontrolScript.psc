Scriptname BFXcontrolScript extends ObjectReference  
{Controls the BFX}

ImageSpaceModifier Property DBFireImod Auto
{USE AUTO FILL FOR THIS PROPERTY}

Event onLoad()
	DBFireImod.apply()
EndEvent

Event onUnLoad()
	DBFireImod.remove()
EndEvent