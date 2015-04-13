Scriptname WERoad08LetterScript extends ObjectReference  

quest property weroad08 auto

auto state waiting

event onread()
	weroad08.setstage(100)
	gotostate("done")
endEvent

endState

state done
;do nothing
endstate

