Scriptname defaultAliasChangeOutfit extends ReferenceAlias  
{changes an actor's outfit on a ChangeLocation event}

Location Property ChangeOutfitLocation  Auto  
{change outfit when actor enters or exits this location (depending on bChangeOnExit  flag)}

int Property prereqStageOPT  Auto  
{optional prerequisite stage}

Outfit Property NewOutfit  Auto  
{outfit to change into}

bool Property bChangeOnExit = true  Auto  
{if true, change outfit when actor EXITS the ChangeOutfitLocation; otherwise, change outfit when he ENTERS the ChangeOutfitLocation
defaults to TRUE}


auto STATE waiting
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if  (bChangeOnExit && akOldLoc == ChangeOutfitLocation) || (!bChangeOnExit && akNewLoc == ChangeOutfitLocation)
		if prereqStageOPT == 0 || GetOwningQuest().GetStageDone(prereqStageOPT)
			gotoState("done")
			GetActorRef().SetOutfit(NewOutfit)
		endif
	endif
endEvent
endState

STATE done
; do nothing
endState