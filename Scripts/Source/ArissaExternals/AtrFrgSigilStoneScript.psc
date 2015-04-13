Scriptname AtrFrgSigilStoneScript extends ObjectReference  

miscObject property sigilStone auto
objectReference property sigilStoneREF auto
AtronachForgeSCRIPT property Forge auto
message property defaultLackTheItemMSG auto

EVENT onActivate(objectReference actronaut)
	if Forge.sigilStoneInstalled == FALSE
		if actronaut.getItemCount(SigilStone) >= 1
			Forge.sigilStoneInstalled = TRUE
			sigilStoneREF.enable()
			(actronaut as actor).removeItem(sigilStone, 1)
		else
			; player must not have the sigil stone to install
			defaultLackTheItemMSG.show()
		endif
	else
		; if the sigilstone is installed, then let the player get it back
		Forge.sigilStoneInstalled = FALSE
		sigilStoneREF.disable()
		(actronaut as actor).addItem(sigilStone, 1)
	endif
endEVENT

