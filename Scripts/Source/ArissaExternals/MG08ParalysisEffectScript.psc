Scriptname MG08ParalysisEffectScript extends ActiveMagicEffect  

Spell Property MG08ParalysisAbility  Auto  
Quest Property MG08 Auto


Event OnEffectStart(Actor AkTarget, Actor akCaster)

	AkTarget.AddSpell(MG08ParalysisAbility)
	While MG08.GetStage() < 40
		Utility.Wait(5)
; 		Debug.Trace(self + "In While Loop")
	EndWhile
	AkTarget.RemoveSpell(MG08ParalysisAbility)

EndEvent

