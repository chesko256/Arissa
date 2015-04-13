Scriptname DA04SeptimusDisappearEffectScript extends ActiveMagicEffect  


Event OnEffectStart(Actor akTarget, Actor akCaster) 
; 	Debug.Trace("DA04: Disappear effect start; " + akTarget + " " + akCaster)
	; Utility.Wait(3.0)
	akTarget.Kill()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster) 
; 	Debug.Trace("DA04: Disappear effect finish; " + akTarget + " " + akCaster)
EndEvent
