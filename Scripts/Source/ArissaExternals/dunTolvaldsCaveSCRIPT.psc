Scriptname dunTolvaldsCaveSCRIPT extends Quest Hidden 
{A script to handle events in Tolvalds Cave}

import objectReference

bool property TrapSprung = FALSE auto hidden
bool property TrapEvaded = FALSE auto hidden

objectReference property TrapSprungGroup auto
objectReference property TrapEvadedGroup auto
objectReference property HiddenDoorTrigger auto



auto state GreedTrapSet

	function springTrap()
		if TrapSprung == FALSE && TrapEvaded == FALSE
			TrapSprung = TRUE
			self.setstage(10)
			goToState("GreedTrapSprung")
		endif
	endFunction

	function evadeTrap()
		if TrapEvaded == FALSE && TrapSprung == FALSE
			TrapEvaded = True
			self.setstage(20)
			goToState("GreedTrapEvaded")
		endif
	endFunction
endstate

state GreedTrapSprung 	
	event onBeginState()
		HiddenDoorTrigger.activate(HiddenDoorTrigger as objectReference)
		TrapSprungGroup.disable()
	endEvent
	
endstate

state GreedTrapEvaded
	event onBeginState()
		TrapEvadedGroup.disable()
	endEvent
endstate


function springTrap()
endFunction

function evadeTrap()
endFunction



