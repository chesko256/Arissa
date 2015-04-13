Scriptname MQ204PaarthurnaxScript extends ReferenceAlias  

MagicEffect Property FireBreathEffect1  Auto  
MagicEffect Property FireBreathEffect2 Auto  
MagicEffect Property FireBreathEffect3 Auto  


Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	debug.trace(self + "OnMagicEffectApply: " + akEffect)
	if akCaster == Game.GetPlayer()
		if akEffect == FireBreathEffect1 || akEffect == FireBreathEffect2 || akEffect == FireBreathEffect3
			if GetOwningQuest().GetStageDone(120) == 0
				GetOwningQuest().setstage(110)
			else
				GetOwningQuest().setStage(140)
			endif
		endif
	endif
endEvent

