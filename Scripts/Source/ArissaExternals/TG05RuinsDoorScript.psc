Scriptname TG05RuinsDoorScript extends ObjectReference 

bool ShowedObjTalkMercer
Quest Property pTG05Quest  Auto  
MiscObject Property pTG05Lockpicks  Auto

State ObjectiveComplete
	Event OnActivate(ObjectReference akActionRef)
		;Do nothing
	EndEvent
EndState

State InMenu
	Event OnActivate(ObjectReference akActionRef)
		;Do nothing
	EndEvent
endState

Event OnActivate(ObjectReference akActionRef)
	GoToState("InMenu")                            ; Goto "InMenu" state so if player activates the door while we are in our "is locked" loop, nothing happens
	Actor player = Game.GetPlayer()         ; Save off player so we only call function once
	if akActionRef == player
		; Ugly loop which we stay in while the player is in the lockpick menu (we hope) – needs better method!
		While IsLocked() && IsInLocation(player.GetCurrentLocation())
			If !ShowedObjTalkMercer && player.GetItemCount(pTG05Lockpicks) <= 0
				pTG05Quest.SetObjectiveDisplayed (32)
				ShowedObjTalkMercer = true
			EndIf
		
			utility.wait(1)
		endwhile

		if IsLocked() == false
			pTG05Quest.SetStage(35)
			GotoState("ObjectiveComplete")         ; Nothing left for us to do with this door, so jump to the complete state
		Else
			GotoState("")         ; No longer in menu, but the door is still locked, just go back to the empty state
		endif
	
	else	;someone other than player activated me
		GotoState("")
	
	EndIf
endEvent