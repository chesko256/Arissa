scriptName Favor008QuestGiverScript extends ReferenceAlias

MagicEffect property RestoreHealthEffect auto
Quest property Favor008 auto
Keyword Property pMagicRestoreHealth  Auto  

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	debug.trace("Target has been hit by magic.")
	If (akEffect.HasKeyword(pMagicRestoreHealth) == 1) && (GetOwningQuest().GetStage() == 10)
		GetOwningQuest().SetStage(15)
; 		debug.trace("Target has been healed!")
	EndIf
ENDEvent

