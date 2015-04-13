scriptName MS06switchTosserSCRIPT extends ObjectReference
{quick little script to initialize switches in PotemasCatacombs}

import utility
import game
import debug

objectReference property switch1 auto
objectReference property switch2 auto
objectReference property switch3 auto

auto STATE ready
	EVENT onTriggerEnter(objectReference triggerREF)
		gotoState("done")
		actor player = getPlayer()
		;trace("entering runOnce State")
		int c = 0
		while player.is3DLoaded() == FALSE
			; wait for 3D to load
			wait(1.0)
			c += 1
			trace("MS06: Recursion "+c+" of Switches waiting for player 3D to load")
		endWhile
		wait(2.0)
		trace("MS06: 1) Throw Switch #1, #2")
		switch1.activate(player)
		switch2.activate(player)
		wait(4.0)
		trace("MS06: 2) Throw Switch #2")
		switch2.activate(player)
		wait(4.0 )
		trace("MS06: 2) Throw Switch #2,#3")
		switch2.activate(player)
		switch3.activate(player)
		;trace("should now be done w/doOnc state")
	endEVENT
endSTATE

STATE done
	; empty
endSTATE
