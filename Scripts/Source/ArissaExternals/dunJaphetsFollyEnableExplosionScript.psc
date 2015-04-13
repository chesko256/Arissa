Scriptname dunJaphetsFollyEnableExplosionScript extends ObjectReference  
import Debug

objectReference Property Explosion01  Auto  
objectReference Property Explosion02  Auto  
objectReference Property Explosion03  Auto  

Bool HasFired = False

Event onTriggerEnter(ObjectReference TriggerRef)
	;Actor ActorRef = TriggerRef as Actor
	if (TriggerRef == game.GetPlayer() && HasFired == False)
	;if (TriggerRef == game.GetPlayer())
	;Notification("FIRE!!!")
		HasFired = True
		Explosion01.enable()
		Explosion02.enable()
		Explosion03.enable()
		gotoState("hasBeenTriggered")
	endIf
endEvent

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

