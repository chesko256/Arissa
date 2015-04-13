Scriptname werewolfPushEffectScript extends ActiveMagicEffect  

FLOAT Property PushForce AUTO  
BOOL PROPERTY pushLeft=FALSE AUTO
BOOL PROPERTY pushRight=FALSE AUTO

OBJECTREFERENCE PROPERTY launchPad AUTO

float transX=0.0
float transZ=0.0

Event OnEffectStart(actor Target, actor Caster)

	IF(pushLeft)
		transX = ((target AS OBJECTREFERENCE).getPositionX()) + ((caster AS OBJECTREFERENCE).getPositionX())
	ELSEIF(pushRight)
		transX = ((target AS OBJECTREFERENCE).getPositionX()) + ((caster AS OBJECTREFERENCE).getPositionX())
	ENDIF
	
	caster.PushActorAway(Target, PushForce)
	
	utility.wait(0.1)
	
	target.applyHavokImpulse(256, 0.0, 0.0, 25)
		
EndEvent

