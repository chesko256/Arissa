Scriptname TG03BrewingVatScript extends ReferenceAlias  

int Property pTG03Poisoned  Auto  
Message Property pTG03VatBeforeMessage  Auto  
Message Property pTG03VatAfterMessage  Auto  
Quest Property pTG03Quest  Auto
MiscObject Property pTG03Poison Auto

Event onActivate (objectReference activateRef)

	if Game.GetPlayer().GetItemCount(pTG03Poison) >= 1
		if activateRef == Game.GetPlayer()
			if pTG03Poisoned == 0
				GetReference().PlayGamebryoAnimation("forward",true)
	;			pTG03VatBeforeMessage.Show()
				pTG03Quest.setstage(55)
				Utility.Wait(5)
				GetReference().PlayGamebryoAnimation("backward")
				pTG03Poisoned = 1
			elseif pTG03Poisoned == 1
				pTG03VatAfterMessage.Show()
			endif
		endif
	endif

endEvent
