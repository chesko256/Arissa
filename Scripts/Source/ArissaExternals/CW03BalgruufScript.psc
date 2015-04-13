Scriptname CW03BalgruufScript extends ReferenceAlias  

Actor Property BalgruufTheGreaterRef Auto
Actor Property HrongarRef Auto

Event OnDeath(Actor akKiller)
	if GetActorReference() == BalgruufTheGreaterRef
; 		CWScript.Log("CW03BalgruufScript", "OnDeath() I am Balgruuf dying, so forcing Hongar into CW03 Balgruuf Alias.")
		
		ForceRefTo(HrongarRef)		
	EndIf

EndEvent

;should be covered by OnDeath, but JUUUST in case:
Event OnCellLoad()
	If GetActorReference() == BalgruufTheGreaterRef && BalgruufTheGreaterRef.IsDead()
; 		CWScript.Log("CW03BalgruufScript", "OnCellLoad() I am Balgruuf and dead, so forcing Hongar into CW03 Balgruuf Alias.")
	
		ForceRefTo(HrongarRef)		
	EndIf

EndEvent


