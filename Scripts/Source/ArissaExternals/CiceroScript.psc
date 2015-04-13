Scriptname CiceroScript extends ReferenceAlias  


Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
      
 if akAggressor == Game.GetPlayer()
   	if pDB07.GetStage () >=40
	   	if pDB07.GetStage () <=50
                 CiceroAlias.GetActorRef().StartCombat(Game.GetPlayer())
                 CiceroAlias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
		endif
	endif
endif

EndEvent




Event OnDeath(Actor aThisGuyKilledMe)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood

if pDB07.GetStage () >=40
	if pDB07.GetStage () <=50
		pDB07.SetStage (60)
		DBScript.CiceroDead=1
	endif
endif	 

EndEvent

Quest Property pDB07  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

ReferenceAlias Property CiceroAlias  Auto  

Faction Property DBAttackPlayerFaction  Auto  
