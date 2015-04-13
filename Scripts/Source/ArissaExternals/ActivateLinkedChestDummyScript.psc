Scriptname ActivateLinkedChestDummyScript extends ObjectReference  

EVENT onActivate(objectReference actronaut)
; 	debug.trace("Sending "+getLInkedRef()+" an activate from "+actronaut)
	getLinkedRef().activate(actronaut)
endEVENT
