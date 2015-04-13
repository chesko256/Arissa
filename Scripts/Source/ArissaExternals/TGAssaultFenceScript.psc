Scriptname TGAssaultFenceScript extends Actor  

Quest Property TGBan Auto
Faction Property ThievesGuildFaction Auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	if Self.IsInFaction(ThievesGuildFaction)
		if Game.GetPlayer().IsInFaction(ThievesGuildFaction)
			if akTarget == Game.GetPlayer()
				if aeCombatState == 1
					if TGBan.IsRunning() == 0
						TGBan.Start()
					endif
				endif
			endif
		endif
	endif

endEvent