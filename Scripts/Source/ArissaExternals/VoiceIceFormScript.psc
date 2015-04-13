Scriptname VoiceIceFormScript extends ActiveMagicEffect  

Event OnEffectStart (Actor akTarget, Actor akCaster)
	akTarget.ModActorValue("MagicResist", 99)
	akTarget.ModActorValue("DamageResist", 500)
EndEvent

Event OnEffectFinish (Actor akTarget, Actor akCaster)
	akTarget.ModActorValue("MagicResist", -99)
	akTarget.ModActorValue("DamageResist", -500)
EndEvent