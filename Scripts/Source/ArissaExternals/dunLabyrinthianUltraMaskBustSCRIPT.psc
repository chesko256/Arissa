Scriptname dunLabyrinthianUltraMaskBustSCRIPT extends ObjectReference  
{Acts as control script for mask altar}

bool property Mask01placed auto
bool property Mask02placed auto
bool property Mask03placed auto
bool property Mask04placed auto
bool property Mask05placed auto
bool property Mask06placed auto
bool property Mask07placed auto
bool property Mask08placed auto

bool property placed auto
bool property hasBeenUnlocked auto

objectReference property myBustActivator auto

message property defaultLackTheItemMSG auto
armor property ArmorDragonPriestMaskUltraHelmet auto

EVENT onActivate(objectReference actronaut)
	if placed == FALSE
		if actronaut.getItemCount(ArmorDragonPriestMaskUltraHelmet) >= 1
			blockActivation()
			actronaut.removeItem(ArmorDragonPriestMaskUltraHelmet, 1)
			placed = TRUE
			myBustActivator.playAnimationandWait("on","TransOn")
			blockActivation(FALSE)
		else
			defaultLackTheItemMSG.show()
		endif
	elseif placed == TRUE
		blockActivation()
		actronaut.addItem(ArmorDragonPriestMaskUltraHelmet, 1)
		placed = FALSE
		myBustActivator.playAnimationAndWait("off","TransOff")
		blockActivation(FALSE)
	endif
	
endEVENT