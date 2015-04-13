Scriptname CarryActorScript extends ObjectReference  
{Script for actors who carry items around}

MiscObject Property CarryItemMisc  Auto  
{item being carried - MiscObject}

int Property CarryItemMiscCount = 1 Auto
{how many items to drop when interrupted}

Potion Property CarryItemPotion  Auto  
{potion item being carried - Potion (food)}

int Property CarryItemPotionCount = 1 Auto
{how many items to drop when interrupted }

Ingredient Property CarryItemIngredient  Auto  
{ingredient item being carried - Ingredients (flowers etc.)}

int Property CarryItemIngredientCount = 1 Auto
{how many items to drop when interrupted }

Idle Property StopCarryingEvent  Auto  
{event to send when stopping carry}

;set to true when item is being carried}
bool bCarryFlag = false

; all state changes for this actor go through this function
; call begin in OnBegin package block
function ChangeCarryState(bool bBeginCarrying, bool bDropItem = false)
; ;	debug.trace(self + " ChangeCarryState")
	if bBeginCarrying
; ;		debug.trace(self + " ChangeCarryState BEGIN")
		bCarryFlag = 1
	else
		; if I'm currently carrying something, see if I should drop it
		if bCarryFlag && bDropItem
; ;			debug.trace(self + " ChangeCarryState: DROP")

			; I was interrupted, drop the items
			RemoveCarriedItems(bDrop = true)
		else
; ;			debug.trace(self + " ChangeCarryState: NO DROP")
			; remove from inventory just to be safe
			RemoveCarriedItems()
		endif
		; I'm not carrying anything any more
		bCarryFlag = 0
		; get rid of anim object
		Actor selfActor = (self as ObjectReference) as Actor
		selfActor.PlayIdle(StopCarryingEvent)
	endif
endFunction

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if bCarryFlag
		; drop what I'm carrying
		ChangeCarryState(false, true)
	endif
endEvent

; adds carried items to inventory
function AddCarriedItems()
	if CarryItemMisc
		AddItem(CarryItemMisc, CarryItemMiscCount)
	endif
	if CarryItemPotion
		AddItem(CarryItemPotion, CarryItemPotionCount)
	endif
	if CarryItemIngredient
		AddItem(CarryItemIngredient, CarryItemIngredientCount)
	endif
endFunction

; removes all carried items from inventory, optionally dropping them into the world
function RemoveCarriedItems(bool bDrop = false)
	if bDrop
		DropCarriedItems(CarryItemMisc, CarryItemMiscCount)
		DropCarriedItems(CarryItemPotion, CarryItemPotionCount)
		DropCarriedItems(CarryItemIngredient, CarryItemIngredientCount)
	else
		if CarryItemMisc
			RemoveItem(CarryItemMisc, CarryItemMiscCount)
		endif
		if CarryItemPotion
			RemoveItem(CarryItemPotion, CarryItemPotionCount)
		endif
		if CarryItemIngredient
			RemoveItem(CarryItemIngredient, CarryItemIngredientCount)
		endif
	endif		
endFunction

function DropCarriedItems(Form ItemToDrop, int iDropCount)
	if iDropCount == 0 || ItemToDrop == None
		return
	endif
	
	int itemsLeft = iDropCount
	while itemsLeft > 0
		DropObject(ItemToDrop, 1)
		itemsLeft = itemsLeft - 1
	endWhile
	
endFunction
