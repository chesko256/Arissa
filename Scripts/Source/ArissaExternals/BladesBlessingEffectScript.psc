Scriptname BladesBlessingEffectScript extends ActiveMagicEffect  

GlobalVariable Property BladesBlessingTimer Auto
GlobalVariable Property GameDaysPassed Auto
Spell Property BladesBlessingAbility Auto
Float Property fTimer Auto

Event OnUpdateGameTime()

; 	debug.trace(self + "OnUpdateGameTime")
	If (BladesBlessingTimer.Value <= GameDaysPassed.Value)
		Game.GetPlayer().RemoveSpell(BladesBlessingAbility)
		UnRegisterForUpdateGameTime()
	EndIf
	
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	; start timer
	fTimer = GameDaysPassed.Value + 5
	BladesBlessingTimer.SetValue(fTimer)	
	RegisterForUpdateGameTime(12)
	
EndEvent