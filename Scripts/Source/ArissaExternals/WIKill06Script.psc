Scriptname WIKill06Script extends WorldInteractionsScript  Conditional
{Extends WorldInteractionsScript which extends Quest}

ReferenceAlias Property Thug1 Auto
ReferenceAlias Property Thug2 Auto
ReferenceAlias Property Thug3 Auto


Function CheckThugDeath()
	if Thug1.GetActorReference().IsDead() && Thug2.GetActorReference().IsDead() && Thug3.GetActorReference().IsDead()
; 		debug.trace("WIKill06Script CheckThugDeath() sees all Thugs are dead, stopping quest.")
		stop()
		
	EndIf
EndFunction
