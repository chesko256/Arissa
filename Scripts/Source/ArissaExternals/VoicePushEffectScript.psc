Scriptname VoicePushEffectScript extends ActiveMagicEffect  

Event OnEffectStart(actor Target, actor Caster)
	Caster.PushActorAway(Target, PushForce)
EndEvent

int Property PushForce  Auto  
