Scriptname TGAssaultSpecialScript extends ObjectReference  

Quest Property TG05 Auto
Quest Property TGBan Auto
Faction Property ThievesGuildFaction Auto
ReferenceAlias Property TG08BMercer Auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	
	if TG08BMercer.GetActorRef().IsInFaction(ThievesGuildFaction) == 1
		if akTarget == Game.GetPlayer()
			if aeCombatState == 1
				if TGBan.IsRunning() == 0
					TGBan.Start()
				endif
			endif
		endif
	endif

endEvent