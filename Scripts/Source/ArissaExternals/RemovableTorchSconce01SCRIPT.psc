Scriptname RemovableTorchSconce01SCRIPT extends ObjectReference Hidden 

import debug

Light Property Torch01 Auto
{The Torch01 we look for in the players inventory}

Activator Property RemovableTorch01 Auto
{Base object for torch activator that gets placed}

Bool Property StartsEmpty Auto
{If this is TRUE the sconce will start empty.  Default = FALSE}

Bool Property TorchInSconce = TRUE Auto Hidden
{TRUE when there is a torch in the sonce, FALSE when there isn't.  Default = TRUE}

ObjectReference Property PlacedTorch Auto Hidden
{A way to refer to the torch after it's been placed at the sconce}

Sound Property ITMGenericUp Auto
Sound Property ITMGenericDown Auto

EVENT OnCellLoad()
	;Trace("DARYL - " + self + "Cell Loaded")
	if (StartsEmpty == FALSE && !IsDisabled())
		;Trace("DARYL - " + self + "Should start with a torch in it")
		; If this sconce is marked to start with a torch then place one in it
		if (PlacedTorch)
			;Trace("DARYL - " + self + "A torch has been placed here before, lets simply enable it")
			PlacedTorch.Enable()
		else
			PlacedTorch = Self.PlaceAtMe(RemovableTorch01)
			;Trace("DARYL - " + self + "A torch has never been placed here, lets place one as " + PlacedTorch)
		endif
	
		EnableLinkChain()
		
		GoToState("HasTorch")
	elseif (StartsEmpty == FALSE && IsDisabled())
		;STEVE - Special Case - Add a torch when this gets enabled and activated.
		;Remove the old torch (if we had one)
		PlacedTorch.Disable()
		DisableLinkChain()
		;Trace("STEVE - " + self + "Sconce is starting disabled, going to Awaiting Activation.")
		goToState("AwaitingActivation")
	else
		DisableLinkChain()
		;Trace("DARYL - " + self + "Sconce is starting empty, going to NoTorch State")
		GoToState("NoTorch")
	endif
	
EndEVENT

Function RemoveTorch()
	PlacedTorch.Disable()
	DisableLinkChain()
	GoToState("NoTorch")
EndFunction


STATE HasTorch

	EVENT onActivate(ObjectReference TriggerRef)
		GoToState("Busy")
		;;Trace("DARYL - " + self + "Player has activated this sconce in the HasTorch State")
		PlacedTorch.Disable()
		DisableLinkChain()
		TriggerRef.AddItem(Torch01)
		int TorchTaken = ITMGenericUp.Play(self)
		;;Trace("DARYL - " + self + "Disabling the torch, giving one to the player, and going into the Busy State")
		GoToState("NoTorch")
	EndEVENT
EndState


STATE NoTorch

	EVENT onActivate(ObjectReference TriggerRef)
	
		;;Trace("DARYL - " + self + "Player has activated the sconce in the NoTorch State")
		if TriggerRef.GetItemCount(Torch01) > 0
			GoToState("Busy")
			;;Trace("DARYL - " + self + "The player has " + (Game.GetPlayer()).GetItemCount(Torch01) + " torches, so lets place one")
			if (PlacedTorch)
				;;Trace("DARYL - " + self + "A torch has been placed here before, lets simply enable it")
				PlacedTorch.Enable()
			else
				PlacedTorch = Self.PlaceAtMe(RemovableTorch01)
				;;Trace("DARYL - " + self + "A torch has never been placed here, lets place one as " + PlacedTorch)
			endif
			
			TriggerRef.RemoveItem(Torch01)
			EnableLinkChain()
			int TorchPlaced = ITMGenericDown.Play(self)
			;;Trace("DARYL - " + self + "The player now has" + (Game.GetPlayer()).GetItemCount(Torch01) + " torches after removing one")
			GoToState("HasTorch")
		endif
		
	EndEVENT
	
EndState


STATE Busy
	;Do Nothing
EndState

STATE AwaitingActivation
	Event OnActivate(ObjectReference obj)
		Self.Enable()
		OnCellLoad()
	EndEvent
EndState
