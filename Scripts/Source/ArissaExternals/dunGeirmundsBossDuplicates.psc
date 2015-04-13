scriptName dunGeirmundsBossDuplicates extends Actor
{ Boss Battle script for Sigdus Gauldurson's illusoty duplicates in Geirmund's Hall. }

;Commenting this out to prevent them from getting duplicates...
;Weapon property IllusoryBlackbow Auto
;{Reference to the duplicates' bows to prevent them from unequipping it.}

EffectShader Property shader auto
{VFX shader used to hint that this character is the duplicate.}

EffectShader Property illusionFX auto
{VFX shader used to emphasize that this was the duplicate, after he's defeated.}


Event OnLoad()
	;Prevent the player from pickpocketing from the duplicate.
	Self.BlockActivation()
	;Turn on the shader once the duplicate's 3D loads.
	Utility.Wait(0.1)
	Shader.play(self)
EndEvent

;Expose the duplicate once he's been killed.
Event OnDying(Actor akKiller)
	DismissDuplicate()
EndEvent

;For a faster response right when the actor is killed, catch Health=0 and reveal him then.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (Self.GetAV("Health") <= 0)
		DismissDuplicate()
	EndIf
EndEvent

Function DismissDuplicate()
	;If the duplicate is still alive (eg. this function is being called directly by Sigdis, instead of on death), set a variable to stop the duplicate from attacking.
	Self.SetAV("Variable06", 1)
	Self.EvaluatePackage()
	;Fade out and disable the duplicate.
	IllusionFX.play(self)
	Utility.Wait(1)
	Self.SetAlpha(0.2, True)
	Self.Disable()
	Self.Delete()
EndFunction

Function FinishDuplication()
	;Self.EquipItem(IllusoryBlackbow, True, False)
EndFunction