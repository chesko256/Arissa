scriptname dunBloatedManHuntersDieOnHit extends ReferenceAlias
{On the Kill Sinding path, when Sinding hits one of the hunters, they die immediately.}

ReferenceAlias property Sinding Auto
Faction property DA05HuntersOfHircineFaction Auto
Faction property PlayerFaction Auto

Event OnCombatStateChanged(Actor target, int combatState)
	if (target == Game.GetPlayer())
		DA05HuntersOfHircineFaction.SetEnemy(PlayerFaction)
	EndIf
EndEvent

Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	Debug.Trace("HIT: " + aggressor + " " + Sinding.GetActorRef().GetAV("Variable06"))
	if (Sinding.GetActorRef() == aggressor && Sinding.GetActorRef().GetAV("Variable06") == 1)
; 		Debug.Trace("OUCH!")
		Self.GetActorRef().Kill()
	EndIf
EndEvent