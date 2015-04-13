Scriptname MG07LabyrinthianDoorSCRIPT extends ObjectReference  
{Handling script for the main lockout door on Labyrinthian to prevent access prior to MG07}

message property dunLabyrinthianDenialMSG auto
quest property MG07 auto
miscObject property MG07Keystone auto
objectReference property myDoor auto
float property delayAfterInsert = 1.0 auto

bool beenOpened = FALSE

EVENT onLoad()
	if beenOpened == FALSE
		blockActivation()
	else
		self.disable()
	endif
	
	gotoState("waiting")
endEVENT

STATE waiting
	EVENT onActivate(objectReference actronaut)
		if actronaut == game.getPlayer() && MG07.getStageDone(10) == TRUE && game.getPlayer().getItemCount(MG07Keystone) >= 1
			gotoState("inactive")
			game.getPlayer().removeItem(MG07Keystone, game.getPlayer().getItemCount(MG07Keystone))
			playAnimationAndWait("Insert","Done")
			beenOpened == FALSE
			utility.wait(delayAfterInsert)
			self.disable()
			myDoor.activate(actronaut)
		else
			; Player doesn't meet qualifications to enter, or activated by an NPC
			dunLabyrinthianDenialMSG.show()
		endif
	endEVENT
endSTATE

STATE inactive
	; nothing happens in this state
endSTATE
