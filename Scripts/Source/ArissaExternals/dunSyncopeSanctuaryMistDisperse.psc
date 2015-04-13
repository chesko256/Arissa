scriptName dunSyncopeSanctuaryMistDisperse extends objectReference
;
;
;=========================================



auto state waiting
	event onTriggerEnter(objectReference triggerRef)
		if triggerRef == game.getPlayer()
			triggerAwakening()
			goToState("complete")
		endif
	endEvent
endState


state complete

endState


function triggerAwakening()
	self.activate(self)
	DisableLinkChain(abfadeout = true)
endFunction
