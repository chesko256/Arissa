Scriptname TG01BersiDwemerUrnScript extends ObjectReference  Conditional

Message Property pTG01UrnShattersMessage  Auto  Conditional
Quest Property pTG01Quest Auto Conditional
Scene Property pTG01UrnSmashScene Auto Conditional
TG01QuestScript Property pTG01QS Auto Conditional

Event OnDestructionStageChanged (int aiOldStage, int aiCurrentStage)

	if pTG01QS.pTG01BersiHandled == 0
		if aiCurrentStage == 3
			TG01QuestScript pTG01Script = pTG01Quest as TG01QuestScript
			pTG01Script.pTG01SmashUrn = 3
			if pTG01Quest.IsObjectiveDisplayed(31) == 1
				pTG01Quest.SetObjectiveCompleted(31,1)
			endif
		endif
	endif

endEvent

Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	TG01QuestScript pTG01Script = pTG01Quest as TG01QuestScript

	if pTG01QS.pTG01BersiHandled == 0
		if pTG01Script.pTG01SmashUrn < 3
			if akAggressor == Game.GetPlayer()
				pTG01UrnSmashScene.Start()
			endif
		endif
	endif

endEvent