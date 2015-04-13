Scriptname StockadeBarricade01ActivatorScript extends ObjectReference  
{Disables my linked ref when I'm destroyed (Through destruction stages).}

import debug

Int Property OldStage = 3 Auto
{The destruction stage that is before the stage you want to trigger at
- Default = 3}

Int Property NewStage = 4 Auto
{The destruction stage that you want the trigger to happen at
- Default = 4}

Sound Property OBJCWBarricadeDamage Auto
Sound Property OBJCWBarricadeDestroyed Auto

ObjectReference CollisionLink 

Event OnLoad()
	;Trace("DARYL - " + self + " Running OnLoad().")
	if GetCurrentDestructionStage() < NewStage
		CollisionLink = GetLinkedRef()
		CollisionLink.Enable()
	EndIf
EndEvent

Event OnUnload()
	;Trace("DARYL - " + self + " Running OnUnload().")
	if (CollisionLink != None)
		CollisionLink.Disable()
		CollisionLink = None
	EndIf
EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	
	int DamageID = OBJCWBarricadeDamage.Play(self)

	if (aiOldStage == OldStage) && (aiCurrentStage == NewStage)
		;Trace("DARYL - " + self + " destroyed, disabling navmesh cut.")
		int DestroyedID = OBJCWBarricadeDestroyed.Play(self)
		CollisionLink.Disable()
	endif
EndEvent

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;int DamageID = OBJCWBarricadeDamage.Play(self)
;EndEvent
