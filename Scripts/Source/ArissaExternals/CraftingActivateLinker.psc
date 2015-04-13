scriptName CraftingActivateLinker extends objectReference
;
;This script handles the Ore Veins and handshakes with the mining furniture
;===================================================================


weapon Property RequiredWeapon01 Auto  
{required for player to use - optional}

Message Property FailureMessage Auto  
{Message to say why you can't use this without RequiredWeapon}

bool property requiresTool = false auto
{sets whether this requires a tool to operate
	default = false}

objectReference property objSelf auto hidden
{objectReference to self}

AchievementsScript property AchievementsQuest auto


;===================================================================
;;EVENT BLOCK
;===================================================================

event onLoad()
	blockActivation()
	objSelf = self as objectReference
endEvent

event onActivate(objectReference akActivator)
; 	debug.Trace(self + " has been activated by " + akActivator)
	
	;Actor is attempting to mine
	if akActivator as actor
		;if the actor is the player
		if akActivator == game.getPlayer()
			;if this is not depleted and the player has the right item
			if requiresTool && playerHasTools() == false
				FailureMessage.Show()
			;enter the furniture
			else
; 				debug.Trace(self + " should cause " + akActivator + " to activate " + getLinkedRef())
				if getLinkedRef()
					getLinkedRef().activate(akActivator)
					AchievementsQuest.incHardworker(2)
				Else
; 					debug.Trace(self + ": error this ore does not have a linkedRef")
				endif
			endif
		Else
			if getLinkedRef()
				getLinkedRef().activate(akActivator)
			Else
; 				debug.Trace(self + ": error this ore does not have a linkedRef")
			endif
		EndIf
		
	;Something unexpected has activated the ore
	Else
; 		debug.Trace(self + "has been activated by: " + akActivator + " why?")
	endif
endEvent

;;;May add on hit with pickaxe here later
; Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

; endEvent

;===================================================================
;;FUNCTION BLOCK
;===================================================================
bool function playerHasTools()
	if Game.GetPlayer().GetItemCount(RequiredWeapon01) > 0
		return true
	Else
		return false
	endIf
endFunction
