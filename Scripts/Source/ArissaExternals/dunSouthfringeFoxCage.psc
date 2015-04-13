Scriptname dunSouthfringeFoxCage extends ObjectReference  
{Handles behavior for the tamed fox when his cage is unlocked}

objectReference property myFox auto
faction property DunPlayerAllyFaction auto

EVENT OnOpen(ObjectReference akActionRef)
	if (myFox as actor).getActorValue("Variable07") != 1
		(myFox as actor).setActorValue("Variable07",1)
		(myFox as actor).evaluatePackage()
	endif
endEVENT 
