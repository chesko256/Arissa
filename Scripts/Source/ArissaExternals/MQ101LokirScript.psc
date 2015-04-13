ScriptName MQ101LokirScript extends ReferenceAlias

ReferenceAlias Property HelgenArcher01 Auto
ReferenceAlias Property HelgenArcher02 Auto
ReferenceAlias Property HelgenArcher03 Auto
ReferenceAlias Property HelgenArcher04 Auto
Armor Property PrisonerCuffs Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor == HelgenArcher01.GetActorRef() || akAggressor == HelgenArcher02.GetActorRef() || akAggressor == HelgenArcher03.GetActorRef() || akAggressor == HelgenArcher04.GetActorRef()

		Self.GetActorRef().Kill()
	
	EndIf
EndEvent

Event OnDeath(Actor akKiller)

	;remove the cuffs
	GetActorRef().RemoveItem(PrisonerCuffs, 999)

EndEvent