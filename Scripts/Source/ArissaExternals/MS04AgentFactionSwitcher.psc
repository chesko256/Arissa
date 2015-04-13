Scriptname MS04AgentFactionSwitcher extends ReferenceAlias  

faction Property FactionToAdd Auto  

faction Property AgentFaction Auto

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor as Actor).IsInFaction(AgentFaction)
		(akAggressor as actor).AddToFaction(FactionToAdd)
	endif
endEvent