Scriptname WIAddItem07Script extends WorldInteractionsScript  Conditional

LocationAlias Property ItemLocation Auto
ReferenceAlias Property Item Auto
ReferenceAlias Property Letter Auto
ReferenceAlias Property Calcelmo Auto
ReferenceAlias Property Player Auto

GlobalVariable Property WIAddItem07PayA Auto
GlobalVariable Property WIAddItem07PayB Auto

Book Property WIAddItem07Note Auto

Form Property ItemBase Auto Hidden
int Property ItemCount Auto Conditional Hidden

int itemValue

Event OnStoryAddToPlayer(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, int aiAcquireType)

	Player.AddInventoryEventFilter(akItemBase)

	Actor PlayerActor = Game.GetPlayer()
	Actor CalcelmoActor = Calcelmo.GetActorReference()
	ObjectReference ItemRef = CalcelmoActor.PlaceAtMe(akItemBase)
	
	ItemValue = akItemBase.GetGoldValue()
	
	PlayerActor.RemoveItem(akItemBase, abSilent = true)
	PlayerActor.AddItem(ItemRef, abSilent = true)
	Item.ForceRefTo(ItemRef)
	
	ObjectReference LetterRef = CalcelmoActor.PlaceAtMe(WIAddItem07Note)
	Letter.ForceRefTo(LetterRef)
	WICourierS.addItemToContainer(LetterRef)	;add the letter to the courier so he will deliver it

	ItemBase = akItemBase
	
	setItemCount()
	SetPaymentGlobals()
	
	
	
EndEvent

function setItemCount()
	Actor PlayerRef = Game.GetPlayer()
	
	ItemCount = PlayerRef.GetItemCount(ItemBase)
	
; 	debug.trace(self + "setItemCount() =" + ItemCount)

EndFunction

function SetPaymentGlobals()

; 	debug.trace(self + "SetPaymentGlobals()" )

	;PRESENTLY I CAN'T TEST FOR THE VALUE OF THINGS
	;WHEN I CAN THESE WILL BE SET TO 2x value, and 2.5x value
	WIAddItem07PayA.SetValue(itemValue * 2)
	WIAddItem07PayB.SetValue(itemValue * 2.5)
	UpdateCurrentInstanceGlobal( WIAddItem07PayA)
	UpdateCurrentInstanceGlobal( WIAddItem07PayB)
	
EndFunction

function PayPlayer(int Payment1or2)
; 	debug.trace(self + "PayPlayer( " + Payment1or2 + ")")
	
	ObjectReference PlayerRef = Game.GetPlayer()
	
	if Payment1or2 == 1
		PlayerRef.addItem(WIs.Gold001, WIAddItem07PayA.GetValueInt())
	Else
		PlayerRef.addItem(WIs.Gold001, WIAddItem07PayB.GetValueInt())
	EndIf

	playerRef.RemoveItem(Item.GetReference())
EndFunction

