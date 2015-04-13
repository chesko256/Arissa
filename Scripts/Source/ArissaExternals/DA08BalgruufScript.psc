Scriptname DA08BalgruufScript extends ReferenceAlias  

Weapon Property EbonyBlade auto
ReferenceAlias Property BalgruufEssential auto


; Balgruuf can only be killed with the Ebony Blade during the right stage
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    if (GetOwningQuest().GetStage() != 100)
        return
    endif

;     Debug.Trace("DA08: Balgruuf hit with " + akSource)
    if (akSource == EbonyBlade)
;     	Debug.Trace("DA08: Balgruuf hit with Ebony Blade. Try to kill him.")
    	BalgruufEssential.Clear()
        GetActorReference().Kill() ; (akAggressor as Actor)
    endif
EndEvent
