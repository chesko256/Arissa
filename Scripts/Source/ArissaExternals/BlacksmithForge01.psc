scriptName  BlacksmithForge01 extends ObjectReference
import Debug

spell property FlameDamage Auto

EVENT onActivate ( objectReference triggerRef )
	playAnimation("activate")
endEvent

Event OnTriggerEnter ( objectReference triggerRef )
	if (triggerRef == Game.GetPlayer())
		FlameDamage.Cast(triggerRef, triggerRef)
	endIf
endEvent
