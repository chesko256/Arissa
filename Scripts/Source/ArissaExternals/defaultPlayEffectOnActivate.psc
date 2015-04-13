scriptName defaultPlayEffectOnActivate extends objectReference
;
;
;=============================================================

string property anim01 = "playAnim01" auto
string property animEndEvent = "endAnim" auto
bool property waitForEndEvent = false auto
auto state waiting
	event onActivate(objectReference triggerRef)
		if waitForEndEvent
			goToState("DoNothing")
			playAnimationAndWait(anim01, animEndEvent)
			goToState("waiting")
		else
			playAnimation(anim01)
		endif
	endEvent
endState

state DoNothing
endState
