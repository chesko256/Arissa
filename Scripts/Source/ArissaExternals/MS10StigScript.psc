Scriptname MS10StigScript extends ReferenceAlias  

Quest Property MS10Quest Auto
Message Property MS10DefeatingStigMessage Auto

MS10QuestScript ms10script

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (MS10Quest.GetStage() == 30)
		; check to make sure first that the player has actually challenged Stig to a fight
		ms10script = GetOwningQuest() as MS10QuestScript
		if (ms10script.FightingStig)
			Actor stig = GetActorReference()
			if (stig.GetAV("Health") < 1)
				; MS10DefeatingStigMessage.Show()
				stig.StopCombat()
				stig.RestoreAV("Health", 1000)
				MS10Quest.SetStage(40)
			endif
		endif
	endif
endEvent

