Scriptname ResourceObjectSabotageTriggerScript extends ObjectReference  
{Attach to triggerbox, link ref'd to Resource Object to sabotage - the object with the ResourceObjectScript attached}


Event OnActivate(ObjectReference akActionRef)
	; tell resource object it's trying to be sabotaged

	ResourceObjectScript myResourceObject = GetLinkedRef() as ResourceObjectScript
	
; 	debug.trace(self + "OnActivate(" + akActionRef + "), will now call TryToSabotage on: " + myResourceObject)
	
	myResourceObject.TryToSabotage(akActionRef)
EndEvent

