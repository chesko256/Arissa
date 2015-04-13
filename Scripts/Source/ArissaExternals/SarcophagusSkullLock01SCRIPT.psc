Scriptname SarcophagusSkullLock01SCRIPT extends ObjectReference  
{Script for the Sarcophagus Skull Lock setup}

Keyword Property LinkCustom01 auto

ObjectReference Property myLock auto hidden
{Link ref to the lock this slot controls}

ObjectReference Property myPartnerSlot auto hidden
{LinkCustom01 pointing to my partner lock.}

ObjectReference Property myKey01 auto
{Point this property to the key/skull that belongs to this slot}

ObjectReference Property myKey02 auto
{Point this property to the second key/skull that belongs to this slot}

Quest Property myQuest auto
{The quest we will be setting stages on}

Int Property stageSetOnFirstActivate auto
{The stage that will be set when the player first activates this slot, or activates the slot without the required item}

Message Property emptySlotMessage auto
{Message that shows when the player activates this slot without the required keys.}

Int Property stageSetOnUnlock auto
{The stage that will be set when this is unlocked}

Bool Property alreadyLoaded = FALSE auto hidden

Int Property itemThatUnlockedMe auto hidden

Bool Property lastUnlocked = FALSE auto hidden


EVENT OnLoad()
	; Unless this has been loaded set up the linked refs
	if (alreadyLoaded == FALSE)
		myLock = GetLinkedRef()
		myPartnerSlot = GetLinkedRef(LinkCustom01) as SarcophagusSkullLock01SCRIPT
		alreadyLoaded = TRUE
	endif
EndEVENT



auto STATE WaitingForKey
	EVENT OnActivate(ObjectReference ActivateRef)
	; Removed the correct key from the player when he activates me and go to state Unlocked
	; ...if player doesn't have a key then set the stage, and show the message about the slots

		if (Game.GetPlayer().GetItemCount(myKey01) == 1)
			GoToState("Unlocked")
; 			debug.Trace("DARYL - Player has " + Game.GetPlayer().GetItemCount(mykey01) + " Key01: " + myKey01 + " in his inventory")

			if (myQuest.GetStageDone(stageSetOnFirstActivate) == FALSE)
				myQuest.SetStage(stageSetOnFirstActivate)
			endif
			Game.GetPlayer().RemoveItem(myKey01)
; 			debug.Trace("DARYL - Removing Key01 from player. Player now has " + Game.GetPlayer().GetItemCount(mykey01) + " of " + myKey01)
			;debug.messagebox("Removing KEY 01 From PLAYERS INVENTORY")
			itemThatUnlockedMe = 1
			PlayAnimationAndWait("Insert", "Done")
			myLock.PlayAnimationAndWait("Unlock01", "Done")
		elseif (Game.GetPlayer().GetItemCount(myKey02) == 1)
			GoToState("Unlocked")
; 			debug.Trace("DARYL - Player has " + Game.GetPlayer().GetItemCount(mykey02) + " Key02: " + myKey02 + " in his inventory")

			if (myQuest.GetStageDone(stageSetOnFirstActivate) == FALSE)
				myQuest.SetStage(stageSetOnFirstActivate)
			endif
			Game.GetPlayer().RemoveItem(myKey02)
; 			debug.Trace("DARYL - Removing Key02 from player. Player now has " + Game.GetPlayer().GetItemCount(mykey02) + " of " + myKey02)
			;debug.messagebox("Removing KEY 02 From PLAYERS INVENTORY")
			itemThatUnlockedMe = 2
			PlayAnimationAndWait("Insert", "Done")
			myLock.PlayAnimationAndWait("Unlock01", "Done")
		else
; 			debug.Trace("DARYL - Player doesn't have either key")
			if (myQuest.GetStageDone(stageSetOnFirstActivate) == FALSE)
				myQuest.SetStage(stageSetOnFirstActivate)
			endif

			emptySlotMessage.Show()
		endif
		
	EndEVENT
endSTATE



STATE Unlocked
	EVENT OnBeginState()
	; If myPartnerSlot is also in state Unlocked then run the UnlockSequence() function
		if (myPartnerSlot.GetState() == "Unlocked")
; 			debug.Trace("DARYL - My Partner slot is also unlocked, running UnlockSequence()")
			lastUnlocked = TRUE
			UnlockSequence()
		endif
	EndEVENT

	EVENT OnAnimationEvent(ObjectReference akSource, string asEventName)
		if (akSource == self) && (asEventName == "Done")
			utility.Wait(1)
    		playAnimationAndWait("Unlock", "Done")
			myLock.PlayAnimation("Unlock02")
			if (lastUnlocked == TRUE)
				myQuest.SetStage(stageSetOnUnlock)
			endif
			utility.wait(2)
			PlayAnimationAndWait("Release", "Done")
			UnregisterForAnimationEvent(self, "Done")
			GoToState("ReadyToTake")
  		endIf
	EndEvent
EndSTATE



STATE ReadyToTake
	; Make sure that the player takes back the correct key after activating me.
	EVENT OnActivate(ObjectReference ActivateRef)
		if (itemThatUnlockedMe == 1)
			PlayAnimationAndWait("Remove", "Done")
			Form Key01Form = myKey01.GetBaseObject()
			Game.GetPlayer().AddItem(Key01Form)
			;debug.messagebox("ADDING KEY 01 TO PLAYERS INVENTORY")
			GoToState("AllDone")
			itemThatUnlockedMe = 0
		elseif (itemThatUnlockedMe == 2)
			PlayAnimationAndWait("Remove", "Done")
			Form Key02Form = myKey02.GetBaseObject()
			Game.GetPlayer().AddItem(Key02Form)
			;debug.messagebox("ADDING KEY 02 TO PLAYERS INVENTORY")
			GoToState("AllDone")
			ItemThatUnlockedMe = 0
		endif
	EndEVENT
EndSTATE
		


STATE AllDone
	;Do Nothing
EndSTATE



Function UnlockSequence()
	; Unlock both this and the partner slot and go to ReadyToTake state
	if (lastUnlocked == TRUE)
		(myPartnerSlot as SarcophagusSkullLock01SCRIPT).UnlockSequence()
	endif

	RegisterForAnimationEvent(self, "Done")
	PlayAnimation("Unlock")

	;myPartnerSlot.PlayAnimation("Unlock")
	;playAnimationAndWait("Unlock", "Done")
	;utility.Wait(1)
	;(myPartnerSlot.myLock).PlayAnimation("Unlock2")
	;myLock.PlayAnimationAndWait("Unlock02", "Done")
	;utility.Wait(1)
	;myQuest.SetStage(stageSetOnUnlock)
	;myPartnerSlot.GoToState("ReadyToTake")
	;GoToState("ReadyToTake")
	

EndFunction