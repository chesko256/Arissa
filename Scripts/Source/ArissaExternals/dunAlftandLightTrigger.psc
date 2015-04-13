scriptName dunAlftandLightTrigger extends objectReference
;
;
;========================================================

sound property windGustSound auto
objectReference objectSelf

auto state Waiting
	event onTriggerEnter(objectReference triggerRef)
		if triggerRef == game.getPlayer()
			goToState("Done")
			objectSelf = self as objectReference
			windGustSound.play(objectSelf)
			self.getLinkedRef().disable()
		endif
	endEvent

endState

state Done

endState
