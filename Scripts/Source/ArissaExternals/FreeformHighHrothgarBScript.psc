ScriptName FreeformHighHrothgarBScript extends Quest

Spell Property GreybeardsFusAbility Auto
Spell Property GreybeardsFeimAbility Auto
Spell Property GreybeardsYolAbility Auto
MagicEffect Property GreybeardsAbFus Auto
MagicEffect Property GreybeardsAbFeim Auto
MagicEffect Property GreybeardsAbYol Auto

Function GiveFusAbility()

	;Clear out the other meditations if the player has them
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbFeim) == True
		Game.GetPlayer().RemoveSpell(GreybeardsFeimAbility)
	EndIf
	
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbYol) == True
		Game.GetPlayer().RemoveSpell(GreybeardsYolAbility)
	EndIf
	
	;Give player the chosen meditation if he doesn't have it
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbFus) == False
		Game.GetPlayer().AddSpell(GreybeardsFusAbility)
	EndIf

EndFunction

Function GiveFeimAbility()

	;Clear out the other meditations if the player has them
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbFus) == True
		Game.GetPlayer().RemoveSpell(GreybeardsFusAbility)
	EndIf
	
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbYol) == True
		Game.GetPlayer().RemoveSpell(GreybeardsYolAbility)
	EndIf
	
	;Give player the chosen meditation if he doesn't have it
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbFeim) == False
		Game.GetPlayer().AddSpell(GreybeardsFeimAbility)
	EndIf

EndFunction

Function GiveYolAbility()

	;Clear out the other meditations if the player has them
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbFeim) == True
		Game.GetPlayer().RemoveSpell(GreybeardsFeimAbility)
	EndIf
	
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbFus) == True
		Game.GetPlayer().RemoveSpell(GreybeardsFusAbility)
	EndIf
	
	;Give player the chosen meditation if he doesn't have it
	If Game.GetPlayer().HasMagicEffect(GreybeardsAbYol) == False
		Game.GetPlayer().AddSpell(GreybeardsYolAbility)
	EndIf

EndFunction