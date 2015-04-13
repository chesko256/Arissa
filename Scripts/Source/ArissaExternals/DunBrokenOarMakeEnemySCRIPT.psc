Scriptname DunBrokenOarMakeEnemySCRIPT extends ObjectReference Hidden 

Faction Property MS07BanditFaction Auto
Faction Property PlayerFaction Auto
Quest Property MS07_dunIcerunnerQST Auto


Bool Property SetToEnemy = TRUE Auto

EVENT onTriggerEnter(objectReference triggerRef)
	if triggerRef == game.getPlayer() as actor
		if SetToEnemy == TRUE
			MS07BanditFaction.SetEnemy(PlayerFaction)
			;debug.Notification("Setting to Enemy")
		else
			if MS07_dunIcerunnerQST.GetStageDone(20)
				MS07BanditFaction.SetEnemy(PlayerFaction)
				;debug.Notification("Setting to Enemy since stage 20 is set")
			else
				MS07BanditFaction.SetEnemy(PlayerFaction, true, true)
				;debug.Notification("Setting to Neutral since stage 20 isn't set")
			endif
		endif
	endif
EndEvent
