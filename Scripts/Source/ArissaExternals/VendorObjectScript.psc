Scriptname VendorObjectScript extends ObjectReference  
{swaps object when picked up
resets when linked ref is enabled/disabled}

int disabled  ; 0 = enabled, 1 = disabled

import debug

Event OnLoad()
	; block activation -- script will handle everything
	BlockActivation()
endEvent

auto state Enabled
	event OnActivate(objectReference actionRef)
		trace("VendorObjectScript: OnActivate")
		gotoState("Disabling")
		; add the base object to the activator, and disable myself
		actionRef.AddItem(GetBaseObject(), 1, 1)
		disable()
		disabled = 1
		gotoState("Disabled")
	endEvent

endState


state Disabled
	; don't respond to activation in this state
endState

state Enabling
	; don't respond to activation in this state
endState

state Disabling
	; don't respond to activation in this state
endState


function CloseShop()
	trace("VendorObjectScript: CloseShop")
	gotoState("Disabling")
	disabled = 1
	disable()
	; tell my linked ref to close up too
	VendorObjectScript myLinkedRef = GetLinkedRef() as VendorObjectScript
	if myLinkedRef
		trace("VendorObjectScript: calling CloseShop on my linked ref " + myLinkedRef)
		myLinkedRef.CloseShop()
	endif
	gotoState("Disabled")
endFunction

function OpenShop()
	trace("VendorObjectScript: OpenShop")
	gotoState("Enabling")
	disabled = 0
	enable()
	;resetReference()
	; tell my linked ref to open up too
	VendorObjectScript myLinkedRef = GetLinkedRef() as VendorObjectScript
	if myLinkedRef
		trace("VendorObjectScript: calling OpenShop on my linked ref " + myLinkedRef)
		myLinkedRef.OpenShop()
	endif
	gotoState("Enabled")
endFunction
