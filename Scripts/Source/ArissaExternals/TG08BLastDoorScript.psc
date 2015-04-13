Scriptname TG08BLastDoorScript extends ObjectReference  

objectReference property TG08bPlayerFallMarker auto

event onCellLoad()
	self.SetNoFavorAllowed()
endEvent

auto state waiting
	event onActivate(objectReference akActivator)
		if akActivator == game.GetPlayer()
			goToState("Done")
			game.GetPlayer().MoveTo(TG08bPlayerFallMarker)
		endif
	endEvent
endState

state done
endState