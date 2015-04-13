scriptName dunValthumeEntrance extends ObjectReference
{
- Turns on lights at entrance when player enters
}
import game
import debug

ObjectReference property fire01 auto
ObjectReference property fire02 auto
ObjectReference property fireLight auto


auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		fire01.enable(true)
		fire02.enable(true)
		fireLight.enable(true)
	endEvent
endState
