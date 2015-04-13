Scriptname MG08ParalysisAbilityEffectScript extends ActiveMagicEffect  

Quest Property MG08  Auto  


Event OnEffectStart(Actor AkTarget, Actor akCaster)


	While MG08.GetStage() < 40
		Utility.Wait(5)
	EndWhile


EndEvent