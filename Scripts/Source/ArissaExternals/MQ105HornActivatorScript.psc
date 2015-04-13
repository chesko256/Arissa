Scriptname MQ105HornActivatorScript extends ObjectReference  
{allow player to "pick up" horn again}

auto state waiting
Event OnActivate(ObjectReference akActionRef)
	if akActionref == game.GetPlayer()
		gotoState("busy")
		game.GetPlayer().AddItem(MQ105Horn, 1, true)
		Disable()
		gotoState("waiting")
	endif
endEvent
endstate

state busy
	; do nothing
endstate


MiscObject Property MQ105Horn  Auto  
