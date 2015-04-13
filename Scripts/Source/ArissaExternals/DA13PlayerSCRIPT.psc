scriptName DA13PlayerSCRIPT extends referenceAlias
{DA13 script for tracking player inventory}

quest property DA13 auto

ingredient property vampireDust auto
ingredient property deathBell auto
miscObject property ingotSilver auto
miscObject property gemRubyFlawless auto

;formlist property DA13shoppingList auto

bool gotVampireDust
bool gotDeathBell
bool gotSilverItem
bool gotRuby
bool gotAll

;========================================;

EVENT onInit()
	AddInventoryEventFilter(vampireDust)
	AddInventoryEventFilter(deathBell)
	AddInventoryEventFilter(ingotSilver)
	AddInventoryEventFilter(gemRubyFlawless)
endEVENT

EVENT onItemAdded(form itemAdded, int itemCount, objectReference itemRef, objectReference sourceRef)
	if DA13.getStageDone(10) == TRUE && DA13.getStageDone(15) == FALSE	
		; while waiting ot make "the brew", listen for relevant items and objectives
		DA13itemsCheck()		
	endif
endEVENT

EVENT onItemRemoved(form itemAdded, int itemCount, objectReference itemRef, objectReference sourceRef)
	if DA13.getStageDone(10) == TRUE && DA13.getStageDone(15) == FALSE	
		; while waiting to make "the brew", listen for relevant items and objectives
		DA13itemsCheck()		
	endif
endEVENT

FUNCTION DA13itemsCheck()

; 	debug.trace("DA13: Check player for items Kesh requested")

	if game.getPlayer().getItemCount(vampireDust) >= 1
		DA13.setObjectiveCompleted(11, true)
		gotVampireDust = TRUE
	else
		if gotVampireDust == TRUE
			DA13.setObjectiveCompleted(11, false)
			DA13.setObjectiveDisplayed(11, true)
			gotVampireDust = FALSE
		endif
	endif
	
	; handle for Deathbell
	if game.getPlayer().getItemCount(deathBell) >= 1
		DA13.setObjectiveCompleted(12, true)
		gotDeathBell = TRUE
	else
		if gotDeathBell == TRUE
			DA13.setObjectiveCompleted(12, false)
			DA13.setObjectiveDisplayed(12, true)
			gotDeathBell = FALSE
		endif
	endif
	
	if game.getPlayer().getItemCount(ingotSilver) >= 1
		DA13.setObjectiveCompleted(13, true)
		gotSilverItem = TRUE
	else
		if 	gotSilverItem == TRUE
			DA13.setObjectiveCompleted(13, false)
			DA13.setObjectiveDisplayed(13, true)
			gotSilverItem = FALSE
		endif
	endif
	
	if game.getPlayer().getItemCount(gemRubyFlawless) >= 1
		DA13.setObjectiveCompleted(14, true)
		gotRuby = TRUE
	else
		if gotRuby == TRUE
			DA13.setObjectiveCompleted(14, false)
			DA13.setObjectiveDisplayed(14, true)
			gotRuby = FALSE
		endif
	endif
	
; 	debug.trace("DA13: Ingredient Statuses:")
; 	debug.trace("VampireDust:  "+gotVampireDust)
; 	debug.trace("Deathbell:    "+gotDeathbell)
; 	debug.trace("Silver Ingot: "+gotSilverItem)
; 	debug.trace("Ruby:         "+gotRuby)
	
	; Now - let's handle the return objective based on whether or not the player (still) has everything
	if gotVampireDust == TRUE && gotDeathBell == TRUE && gotSilverITem == TRUE && gotRuby == TRUE
		DA13.setObjectiveDisplayed(15, true)
		gotAll = TRUE
	else
		if DA13.isObjectiveDisplayed(15) == TRUE
			DA13.setObjectiveDisplayed(15, false)
			gotAll == FALSE
		endif
	endif
		
endFUNCTION
