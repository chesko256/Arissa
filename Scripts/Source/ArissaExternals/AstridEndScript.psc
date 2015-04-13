Scriptname AstridEndScript extends ObjectReference  


Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if DB10.GetStage () >= 70
		 Utility.Wait(1)
		 AstridEndAlias.GetActorReference().Kill(Game.GetPlayer())
	EndIf
EndEvent

Quest Property DB10  Auto  

ReferenceAlias Property AstridEndAlias  Auto  
