Scriptname MQ303OdahviingScript extends ReferenceAlias  
{watch for attempts to fight Odahviing}

Event OnCombatStateChanged(Actor akTarget,int aeCombatState )
	if GetOwningQuest().GetStage() < 50 && aeCombatState != 0 ; 0 = not in combat, so non-0 means we entered combat
		; make sure Odahviing stays on the ground
		GetActorRef().SetAllowFlying(false)
	endif
endEvent

