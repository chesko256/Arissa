Scriptname WIChangeLocation03Script extends WorldInteractionsScript  Conditional
{Extends World InteractionsScript}

Faction Property WIPlayerEnemyFaction Auto
Faction Property WIPlayerEnemySpecialCombatFaction Auto

int Property HitByNonSpell auto Conditional Hidden		;used by combat dialogue (and cleared by it)
int Property HitByNonPlayer auto Conditional Hidden		;used by combat dialogue (and cleared by it)

