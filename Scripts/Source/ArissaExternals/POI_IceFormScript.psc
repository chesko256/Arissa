Scriptname POI_IceFormScript extends ActiveMagicEffect  

Event OnEffectStart (Actor akTarget, Actor akCaster)
	akTarget.kill()
	;akTarget.setMotionType(4)
	akTarget.SetGhost()
	;akTarget.ModActorValue("MagicResist", 100)
	utility.wait(1.0)
	akTarget.setMotionType(5)
EndEvent

Event OnEffectFinish (Actor akTarget, Actor akCaster)
	akTarget.SetGhost(False)
	;akTarget.kill()
	;akTarget.ModActorValue("MagicResist", -100)
EndEvent
