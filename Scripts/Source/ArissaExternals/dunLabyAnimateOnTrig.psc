Scriptname dunLabyAnimateOnTrig extends ObjectReference  
{simple script to animate an object as the player approaches}

string property animOnEnter auto
string property animOnExit auto
objectReference property ObjectToAnimate auto
bool property isParentTrig = TRUE auto
{Set false for the trigger to lower the stairs.}
bool property isStairUp = FALSE auto hidden
{for the parent: is the staircase up?}
dunLabyAnimateOnTrig property ParentTrig auto
{if I am NOT the parent, then point this at the parent ref.}

bool busy

EVENT onTriggerEnter(objectReference actronaut)
	if !busy
		if animOnEnter && isParentTrig == TRUE && isStairUp == FALSE
			busy = TRUE
			objectToAnimate.playAnimationAndWait(animOnEnter,"done")
			isStairUp = TRUE
			busy = FALSE
		endif
	endif
endEVENT


EVENT onTriggerLeave(objectReference actronaut)
	if !busy
		if animOnExit && isParentTrig == FALSE && ParentTrig.isStairUp == TRUE
			busy = TRUE
			objectToAnimate.playAnimation(animOnExit)
			ParentTrig.isStairUp = FALSE
			busy = FALSE
		endif
	endif
endEVENT

