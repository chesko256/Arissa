Scriptname WEPrisonerAliasScript extends ReferenceAlias  

;This script pops a message box when activating the prisoner
;if player frees, adds captors, himself, and prisoner to factions to make people hate each other
;You should make sure elsewhere that the captors have aggression high enough to attack their enemies


Topic Property WESharedDialoguePrisonerSetFree Auto

idle Property OffsetBoundStandingStart Auto
idle Property OffsetStop  Auto

Message Property WEPrisonerMessageBox Auto
Faction Property WEPrisonerFreedFaction Auto

Faction Property WEPrisonerFreedCombatCaptorFaction Auto
Faction Property WEPrisonerFreedCombatPrisonerFaction Auto

ReferenceAlias Property Captor1 Auto
ReferenceAlias Property Captor2 Auto
ReferenceAlias Property Captor3 Auto
ReferenceAlias Property Captor4 Auto
ReferenceAlias Property Captor5 Auto

bool bound = True

int iDoNothing = 0
int iSetFree = 1
int iSetFreeShareItems = 2


Event OnLoad()
	if bound
		GetActorReference().playIdle(OffsetBoundStandingStart)
	EndIf

EndEvent

Event OnActivate(ObjectReference akActionRef)

	if GetActorReference().IsDead() || GetActorReference().IsinCombat()
; 		debug.trace(self + "OnActivate() IsDead() or IsInCombat() so not showing message box")	
	
	Elseif Bound == true	
; 		debug.trace(self + "OnActivate() will call show message box")	
		Actor ActorRef = GetActorReference()

		int result = WEPrisonerMessageBox.show()

		if result == iDoNothing
			;debug.Notification("DO NOTHING")
			
		elseif result == iSetFree
			;debug.Notification("SET FREE")	
			FreePrisoner(ActorRef, OpenInventory = False)
			
		elseif result == iSetFreeShareItems
			;debug.Notification("SET FREE SHARE ITEMS")	
			FreePrisoner(ActorRef, OpenInventory = True)		

			
		EndIf
	
	EndIf
EndEvent

Event OnHit(objectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if AkAggressor == game.getPlayer()
		Game.GetPlayer().AddToFaction(WEPrisonerFreedCombatPrisonerFaction)
		Captor1.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
		Captor2.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
		Captor3.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
		Captor4.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
		Captor5.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
	endif
endEvent


Function FreePrisoner(Actor ActorRef, bool playerIsLiberator= true, bool OpenInventory = False)
; 	debug.trace(self + "FreePrisoner(" + ActorRef + "," + playerIsLiberator + ", " + OpenInventory +")")	

	ActorRef.AddToFaction(WEPrisonerFreedFaction)
	ActorRef.AddToFaction(WEPrisonerFreedCombatPrisonerFaction)
	ActorRef.EvaluatePackage()
	if playerIsLiberator
		Game.GetPlayer().AddToFaction(WEPrisonerFreedCombatPrisonerFaction)
	EndIf
	
	if OpenInventory
		ActorRef.openInventory(True)
	EndIf
	
	ActorRef.Say(WESharedDialoguePrisonerSetFree)
	bound = False
	
	Captor1.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor2.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor3.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor4.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor5.TryToAddToFaction(WEPrisonerFreedCombatCaptorFaction)
	
	ActorRef.EvaluatePackage()
		
EndFunction

Function ClearFactions()
;call when quest shuts down
; 	debug.trace(self + "FreePrisoner")

	Game.GetPlayer().RemoveFromFaction(WEPrisonerFreedCombatPrisonerFaction)

	TryToRemoveFromFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor1.TryToRemoveFromFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor2.TryToRemoveFromFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor3.TryToRemoveFromFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor4.TryToRemoveFromFaction(WEPrisonerFreedCombatCaptorFaction)
	Captor5.TryToRemoveFromFaction(WEPrisonerFreedCombatCaptorFaction)

EndFunction



