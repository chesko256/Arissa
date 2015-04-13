Scriptname MG02BossScript extends actor

scene Property MG02BossScene  Auto  

ReferenceAlias Property MG02Tolfdir  Auto

int DoOnce


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

;	if DoOnce == 0
;		if AkAggressor == MG02Tolfdir.GetReference()
;			MG02BossScene.Start()
;			DoOnce =1
;		elseif AkAggressor == Game.GetPlayer()
;			MG02BossScene.Start()
;			DoOnce=1
;		endif
;	endif

EndEvent