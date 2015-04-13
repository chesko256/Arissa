Scriptname TG05LockedDoorScript extends ObjectReference  

auto state locked
	event onActivate(objectReference akActivator)
		utility.wait(1)
		playAnimation ("Open")
		goToState("done")
	endEvent
endState

state done
;do nothing
endState