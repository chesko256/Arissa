Scriptname MG06ScopeActivatorScript extends ObjectReference  

ObjectReference Property TelescopeRef  Auto  

int DoOnce

Float ZAngle



Event OnMagicEffectApply (ObjectReference Caster, MagicEffect Effect)


	if Effect == Flames
		if DoOnce == 0
			ZAngle = TelescopeRef.GetAngleZ()
			DoOnce = 1
		endif
		ZAngle += 20

		TelescopeRef.SetAngle(0.0, 0.0, ZAngle)

	endif
		

	if Effect == Frost
		if DoOnce == 0 
			ZAngle = TelescopeRef.GetAngleZ()
			DoOnce = 1
		endif
		ZAngle -= 20
		TelescopeRef.SetAngle(0.0, 0.0, ZAngle)
	endif
		

	if TelescopeRef.GetAngleZ() >=85
		if TelescopeRef.GetAngleZ() <= 105
			if MG06.GetStage() < 60
				MG06.SetStage(60)
			endif
		endif
	endif


EndEvent
MagicEffect Property Flames  Auto  

MagicEffect Property Frost  Auto  

Quest Property MG06  Auto  
