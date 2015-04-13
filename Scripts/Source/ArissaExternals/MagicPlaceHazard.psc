Scriptname MagicPlaceHazard extends ActiveMagicEffect  


Event OnEffectStart(Actor Target, Actor Caster)
	HazardRef = Target.placeatme(GuardianCircleHazard)
endEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	HazardRef.Disable()
EndEvent


ObjectReference Property HazardRef  Auto  

Hazard Property GuardianCircleHazard  Auto  

