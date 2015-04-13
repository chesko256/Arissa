Scriptname HHpilgrim02Script extends actor
{simple script to remove this NPC from the world after meeting the player.}

EVENT onActivate(objectReference actronaut)
	if actronaut == game.getPlayer()
		; when the player first greets me, set my value to disable when unloaded.
		self.setActorValue("Variable01",1)
	endif
endEVENT

Event OnLoad()
	if MQ105.GetStage() > 0 && !bDoOnce
		bDoOnce = true
		enable()
	endif
endEvent

EVENT onUnload()
	if self.getActorValue("Variable01") >= 1
		self.disable()
		self.delete()
	endif
endEVENT


Quest Property MQ105  Auto  

bool bDoOnce = false