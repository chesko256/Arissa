Scriptname MS12WhitePhialEffectScript extends ActiveMagicEffect  

; fix for 71753: NPCs don't fire OnEquipped when consuming potions,
;   so we need to use this magic effect

ReferenceAlias Property WhitePhial auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
    Debug.Trace("MS12WhitePhialEffect: Target: " + akTarget + "; Caster: " + akCaster)
	; if ( (akTarget != Game.GetPlayer()) )
			(WhitePhial as MS12WhitePhialScript).SetForRefill(akTarget)
	; endif
EndEvent
; /71753
