Scriptname WETriggerSecondaryScript extends ObjectReference  

WETriggerScript myLinkedWETrigger

Event OnLoad()
	myLinkedWETrigger =  GetLinkedRef() as WETriggerScript   ;Will be NONE if you can't cast the link ref as a WETriggerScript (ie it doesn't have that script attached)

EndEvent



Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef != Game.GetPlayer()
		return
	EndIf

	if myLinkedWETrigger		;if it is indeed linked to an object with the WETriggerScript attached
		myLinkedWETrigger.StartEncounter()
	EndIf
	
EndEvent
