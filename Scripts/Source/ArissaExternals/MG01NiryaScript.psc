Scriptname MG01NiryaScript extends ReferenceAlias  

Quest Property MG01  Auto  

ReferenceAlias Property MG01Nirya  Auto  


Event OnMagicEffectApply(ObjectReference AkCaster, MagicEffect AkEffect)

;cast quest script
MG01QuestScript MG01Script = MG01 as MG01QuestScript

;everything that follows is dependent on var being 0

	if MG01Script.NiryaSpellSuccess == 0








;If we're casting Healing Hands, check for it here


		if MG01.GetStage() == 24
			if AkEffect == Heal
				if AkCaster == Game.GetPlayer()

					MG01Script.NiryaSpellSuccess= 1
;					MG01Nirya.GetActorReference().StopCombat()
					MG01Nirya.GetActorReference().EvaluatePackage()
				endif
			endif
		endif



;final endif to close out the event
	endif

EndEvent
MagicEffect Property Fire  Auto  

MagicEffect Property Heal  Auto  

MagicEffect Property MageLight  Auto  

MagicEffect Property WardBreaker  Auto  
