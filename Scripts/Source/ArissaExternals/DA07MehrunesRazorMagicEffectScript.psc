ScriptName DA07MehrunesRazorMagicEffectScript extends ActiveMagicEffect

Faction Property pDA07MehrunesRazorImmuneFaction auto
Weapon Property DA07MehrunesRazor Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	;Apply this effect if the target is not in the excluded faction
	If akTarget.IsInFaction(pDA07MehrunesRazorImmuneFaction) == 1
		Return
	Else
		;1 percent chance to kill target
; 		debug.trace(self + " hitting " + akTarget + " with Mehrunes' Razor")
		If (Utility.RandomInt() <= 1)
; 			debug.trace(self + "Instant Kill effect applied on" + akTarget)
			If Game.GetPlayer().GetItemCount(DA07MehrunesRazor) >= 1
				akTarget.Kill(Game.GetPlayer())
			Else
				akTarget.Kill()
			EndIf
		EndIf
	EndIf

EndEvent