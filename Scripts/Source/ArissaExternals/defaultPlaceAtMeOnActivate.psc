scriptName defaultPlaceAtMeOnActivate extends objectReference
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
	
auto state waiting

	event onActivate(objectReference triggerRef)
		goToState("DoNothing")
		if placeAll
			placeAllThings()
		else
			placeFirstThing()
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
		self.placeAtMe(placedExplosion)
	endif
endFunction

function placeFirstThing()
	if placedExplosion
		self.placeAtMe(placedExplosion)
	elseif placedObjectRef
		self.placeAtMe(placedExplosion)
	else
; 		debug.Trace("could not find anything to place")
	endif
endFunction
