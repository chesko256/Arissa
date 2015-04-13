scriptName DA13KeshSCRIPT extends referenceAlias
{Quest script for Peryite's Monk NPC}

objectReference property emptyVessel auto

EVENT onDeath(actor killer)
	emptyVessel.enable()
endEVENT

EVENT onItemAdded(form itemAdded, int itemCount, objectReference itemRef, objectReference sourceRef)
	
endEVENT


