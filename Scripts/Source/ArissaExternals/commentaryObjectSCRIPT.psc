scriptName commentaryObjectSCRIPT extends objectReference
{basic script will live on commentary objects}

import debug
import form

string property dispMsg auto 				; store the editor-set string to display when this object is activated
{Input your Note here}
quest property commentaryQuest auto		; this will always be the commentary quest, set up 
{don't change this value}

	EVENT onLoad()
		registerForUpdate(10)
		gotoState ("polling")
		disable()
	endEVENT
	
	EVENT onUnload()
		unregisterforUpdate()
		gotoState("" )
	endEVENT
	
 STATE polling
	
	EVENT onUpdate()		
	
		if commentaryQuest.getStage() == 1
			enable()
			trace ("Turning Commentary Objects ON.")
			playAnimation("enable")
			unregisterForUpdate()
			gotoState ("active")
		endif
	endEVENT

endSTATE

STATE active

	EVENT onActivate(objectReference actronaut)
		trace("showing commentary text...")
		messageBox(dispMsg)
	endEVENT
	
endSTATE
