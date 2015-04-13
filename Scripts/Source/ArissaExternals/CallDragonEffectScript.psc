Scriptname CallDragonEffectScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
; 	debug.trace(self + " OnEffectStart")
	; just send the script event when cast
	MQCallDragonKeyword.SendStoryEvent()
endEvent

Keyword Property MQCallDragonKeyword  Auto  
