scriptName TG08EarthquakeDustEffects extends objectReference
;
;
;====================================

bool property doOnce = true auto
{if true do this only once
	default == true}
	
bool property placeAll = true auto
{default == true
	if true place all things that have been set
	if false place the first thing that we find set}
	
explosion property placedExplosion auto	
objectReference property placedObjectRef auto
sound property rockfallSound Auto
objectReference objSelf
float ControllerShakeL = 0.5
float ControllerShakeR = 0.5
float ControllerShakeDuration = 1.5
bool property cannedHallwayDust = false auto
{used for precanned dust in hallways}
string anim01 = "playAnim01"
string animEndEvent = "endAnim"
	
auto state waiting
	
	event onActivate(objectReference triggerRef)
; 		debug.Trace(self + " has recieved activation from " + triggerRef)
		;goToState("DoNothing")
		objSelf = self as objectReference
		if rockfallSound
			rockfallSound.play(objSelf)
		endif
		;game.ShakeCamera(afStrength = 1.0)
		;game.ShakeController(ControllerShakeL, ControllerShakeR, ControllerShakeDuration)
		if cannedHallwayDust
			playAnimationAndWait(anim01, animEndEvent)
		Else
			placeAllThings()	
		endif
	endEvent

endState

state DoNothing
	event onActivate(objectReference triggerRef)
	endEvent
endState

function placeAllThings()
	if placedExplosion
		self.placeAtMe(placedExplosion)
	endif
	
	if placedObjectRef
		self.placeAtMe(placedObjectRef)
	endif
endFunction
