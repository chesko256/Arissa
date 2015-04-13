Scriptname MarriageSleepABScript extends ActiveMagicEffect  

GlobalVariable Property MarriagePerkTimer Auto
GlobalVariable Property GameDaysPassed Auto
Spell Property MarriageSleepAbility Auto
Float Property fTimer Auto

Event OnUpdateGameTime()

; 	debug.trace(self + "OnUpdateGameTime")
	If (MarriagePerkTimer.Value <= GameDaysPassed.Value)
		Game.GetPlayer().RemoveSpell(MarriageSleepAbility)
		UnRegisterForUpdateGameTime()
	EndIf
	
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	; start timer
	fTimer = GameDaysPassed.Value + 3
	MarriagePerkTimer.SetValue(fTimer)	
	RegisterForUpdateGameTime(12)
	
EndEvent