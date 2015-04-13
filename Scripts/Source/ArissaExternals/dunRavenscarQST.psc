Scriptname dunRavenscarQST extends Quest  

import game
import debug
import utility

ReferenceAlias Property Alias_Boss01  Auto  
ReferenceAlias Property Alias_Boss02  Auto  
ReferenceAlias Property Alias_Boss03 Auto  
ReferenceAlias Property Alias_Boss04  Auto  
ReferenceAlias Property Alias_TrappedBandit Auto  
ReferenceAlias Property Alias_CageDoor  Auto  

Faction Property dunRavenscarFaction  Auto  
Faction Property PlayerFaction Auto

ObjectReference Property dunRavenscarSetStageTrigREF Auto


Event OnInit()
	;RegisterForUpdate(1)
	;Register moved to stage 0 - unregister put in a shut-down stage
endEvent

Event OnUpdate()
	bool ContinueUpdate = TRUE
	;if (Alias_CageDoor.GetReference().GetOpenState() == 1) || (Alias_CageDoor.GetReference().GetOpenState() == 2)		;Player has unlocked cage door
	;	if (GetStage() == 0)
	;		;MessageBox("Door Unlock.  Dude should be following now!")
	;		SetStage(10)
	;		dunRavenscarSetStageTrigREF.Enable()
	;		Alias_TrappedBandit.GetActorRef().RemoveFromFaction(dunRavenscarFaction)		;Remove the "friends with hagravens" faction
	;	endif
	;endif
	
	if (GetStage() == 10)
		if (Alias_Boss02.GetActorRef().IsDead() == 1) && (Alias_Boss03.GetActorRef().IsDead() == 1) && (Alias_Boss04.GetActorRef().IsDead() == 1)
			SetStage(20)
			ContinueUpdate = FALSE
			;MessageBox("All birdies are dead!")
		endif
	endif
	
	;if (GetStage() == 30)
	;	SetStage(40)
	;	Alias_TrappedBandit.GetActorRef().RemoveFromFaction(PlayerFaction)
	;	Alias_TrappedBandit.GetActorRef().SetAV("Aggression", 2)
	;	;MessageBox("Dude is done with you, now you die!")
	;endif
	if ContinueUpdate
		RegisterForSingleUpdate(1)
	endif
endEvent
int Property DeadCurrent  Auto  

int Property DeadMax  Auto  
