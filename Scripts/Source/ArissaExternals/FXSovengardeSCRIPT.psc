Scriptname FXSovengardeSCRIPT extends ActiveMagicEffect  
{Puts the fx on the heavenly people of sovengarde}

VisualEffect Property FXSovengardeGlowEffect Auto
EffectShader Property SovengardeFXS Auto
Actor selfRef
ObjectReference myGlow

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster	
		;float myScale = selfRef.getScale()
; 		;debug.trace("my scale is" + myScale)
		myGlow = FXSovengardeGlowEffect.play(selfRef, -1)
		;myGlow.setScale(myScale)
		SovengardeFXS.Play(selfRef)
	EndEvent
	