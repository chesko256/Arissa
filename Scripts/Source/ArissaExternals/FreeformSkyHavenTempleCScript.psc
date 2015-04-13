ScriptName FreeformSkyHavenTempleCScript extends Quest

GlobalVariable Property BladesBlessingTimer Auto
GlobalVariable Property GameDaysPassed Auto
Perk Property BladesBlessing Auto
Float Property fTimer Auto
Spell Property BladesBlessingAbility Auto

Function GiveBladesBlessing()

	;Give perk, the perk has a script on it that setups the timer
	Game.GetPlayer().AddSpell(BladesBlessingAbility)

EndFunction