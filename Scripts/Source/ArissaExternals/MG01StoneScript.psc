Scriptname MG01StoneScript extends ReferenceAlias


Quest Property MG01  Auto  

Spell Property MageLight Auto
spell Property Fear  Auto  

Spell Property Firebolt  Auto  



Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

;cast quest script
MG01QuestScript MG01Script = MG01 as MG01QuestScript

;everything that follows is dependent on var being 0

	if MG01Script.NiryaSpellSuccess == 0
; 	debug.trace(self + " has been hit by " + AkSource + " from " + AkAggressor)


;If we're casting Mage Light, check for it here

		if MG01.GetStage() == 20
			if AkSource == MageLight
;				if AkAggressor == Game.GetPlayer()
					Self.GetReference().PlayAnimation("PlayAnim01")
					MG01Script.NiryaSpellSuccess=1
					Nirya.GetActorReference().EvaluatePackage()
					Faralda.GetActorReference().EvaluatePackage()
;				endif
			endif
		endif



;If we're casting Fire-based spell, check for it here

		if MG01.GetStage() == 22

			if AkSource == Firebolt
;				if AkAggressor == Game.GetPlayer()
					Self.GetReference().PlayAnimation("PlayAnim01")
					MG01Script.NiryaSpellSuccess= 1
					Nirya.GetActorReference().EvaluatePackage()
					Faralda.GetActorReference().EvaluatePackage()
;				endif
			endif		
		endif

	endif

;if we're casting Fear, check for it here

	if MG01.GetStage() == 23
		if AkSource == Fear
;			if AkAggressor == Game.GetPlayer()
				Self.GetReference().PlayAnimation("PlayAnim01")
				MG01Script.NiryaSpellSuccess = 1
				Nirya.GetActorReference().EvaluatePackage()
				Faralda.GetActorReference().EvaluatePackage()
;			endif
		endif
	endif




EndEvent

ReferenceAlias Property Nirya  Auto  




ReferenceAlias Property Faralda  Auto  
