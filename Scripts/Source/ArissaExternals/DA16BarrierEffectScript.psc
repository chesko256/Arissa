scriptName DA16BarrierEffectScript extends objectReference
;
;
;=========================================================

event onCellLoad()
	playAnimation("playanim02")

endEvent

auto state waiting
	event onActivate(objectReference akActivator)
		playanimation("playanim01")
		goToState("done")
		utility.wait(5.0)
		self.delete()	
	endEvent
endState

state done
endState
