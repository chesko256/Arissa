Scriptname CWFortSoldierWoundedScript extends Actor  

int Property PercentChanceToAppear = 75 Auto
{Default: 75; What percentage of the time should this actor be loaded?}

ObjectReference Property CampEnableMarker Auto
{MANDATORY!!! Pointer to the camp's enable marker}

Event OnCellLoad()

	disable()

	if CampEnableMarker.IsEnabled() && Utility.RandomInt(1, 100) <= PercentChanceToAppear
		Enable()
		SetRestrained()

	EndIf

EndEvent

;Event OnLoad()
;	
;	BlockActivation(true)
;
;EndEvent

;Event OnActivate(ObjectReference akActionRef)
;
;	if akActionRef == Game.GetPlayer()
;		return
;
;	else
;		Activate(akActionRef, true)
;	
;	endif
;
;endEvent

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;	kill(akAggressor as Actor)
;
;endEvent
