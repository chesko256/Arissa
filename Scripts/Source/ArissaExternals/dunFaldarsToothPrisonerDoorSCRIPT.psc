Scriptname dunFaldarsToothPrisonerDoorSCRIPT extends ObjectReference  
{Default script on a door, that's linked to a prisoner, to handle his factions.}


import game
import utility
import debug

Faction Property dunPrisonerFaction Auto
ObjectReference Property Prisoner01 Auto
ObjectReference Property Prisoner02 Auto
ObjectReference Property Prisoner03 Auto
ObjectReference Property Prisoner04 Auto
ObjectReference Property Prisoner05 Auto
ObjectReference Property Prisoner06 Auto

ObjectReference Property PrisonerLink Auto Hidden
bool Property AlreadyLoaded Auto Hidden



EVENT OnLoad()
	if AlreadyLoaded == FALSE
		if Prisoner01
			(Prisoner01 as Actor).AddToFaction(dunPrisonerFaction)
		endif
		if Prisoner02
			(Prisoner02 as Actor).AddToFaction(dunPrisonerFaction)
		endif
		if Prisoner03
			(Prisoner03 as Actor).AddToFaction(dunPrisonerFaction)
		endif
		if Prisoner04
			(Prisoner04 as Actor).AddToFaction(dunPrisonerFaction)
		endif
		if Prisoner05
			(Prisoner05 as Actor).AddToFaction(dunPrisonerFaction)
		endif
		if Prisoner06
			(Prisoner06 as Actor).AddToFaction(dunPrisonerFaction)
		endif
		
		PrisonerLink = GetLinkedRef()
		if PrisonerLink
			(PrisonerLink as Actor).AddToFaction(dunPrisonerFaction)
		endif
		
	endif
	AlreadyLoaded = TRUE
EndEVENT
	

Auto STATE WaitingToBeOpened

	EVENT OnActivate (ObjectReference triggerRef)
		if Prisoner01
			(Prisoner01 as Actor).RemoveFromFaction(dunPrisonerFaction)
			Utility.Wait(0.25)
			(Prisoner01 as Actor).EvaluatePackage()
		endif
		if Prisoner02
			(Prisoner02 as Actor).RemoveFromFaction(dunPrisonerFaction)
			Utility.Wait(0.25)
			(Prisoner02 as Actor).EvaluatePackage()
		endif
		if Prisoner03
			(Prisoner03 as Actor).RemoveFromFaction(dunPrisonerFaction)
			Utility.Wait(0.25)
			(Prisoner03 as Actor).EvaluatePackage()
		endif
		if Prisoner04
			(Prisoner04 as Actor).RemoveFromFaction(dunPrisonerFaction)
			Utility.Wait(0.25)
			(Prisoner04 as Actor).EvaluatePackage()
		endif
		if Prisoner05
			(Prisoner05 as Actor).RemoveFromFaction(dunPrisonerFaction)
			Utility.Wait(0.25)
			(Prisoner05 as Actor).EvaluatePackage()
		endif
		if Prisoner06
			(Prisoner06 as Actor).RemoveFromFaction(dunPrisonerFaction)
			Utility.Wait(0.25)
			(Prisoner06 as Actor).EvaluatePackage()
		endif
		
		if PrisonerLink
			(PrisonerLink as Actor).RemoveFromFaction(dunPrisonerFaction)
			Utility.Wait(0.25)
			(PrisonerLink as Actor).EvaluatePackage()
		endif
		
		GoToState("AlreadyOpened")
	EndEVENT

endSTATE

STATE AlreadyOpened
	;do nothing
EndSTATE

