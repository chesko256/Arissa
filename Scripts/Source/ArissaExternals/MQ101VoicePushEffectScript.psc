Scriptname MQ101VoicePushEffectScript extends ActiveMagicEffect  

Event OnEffectStart(actor Target, actor Caster)
	If Target != Game.GetPlayer()
		Caster.PushActorAway(Target, PushForce)
	EndIf
EndEvent

int Property PushForce  Auto  
