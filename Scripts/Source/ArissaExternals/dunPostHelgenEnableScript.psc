scriptName dunPostHelgenEnableScript extends ObjectReference

float property myDaysPassed auto
GlobalVariable property gGameDaysPassed auto
Location property myLocation auto
ObjectReference property myBridgeDebris auto
ObjectReference property myBridge auto
ObjectReference myLink

;****************************

Event onLoad()
	myLink = getLinkedRef() as ObjectReference
	if (myDaysPassed <= gGameDaysPassed.getValue()) && (game.getPlayer().IsInLocation(myLocation) == false)
		myLink.enable()
		myBridge.disable()
		myBridgeDebris.disable()
		disable()
	endif
endEvent

;****************************