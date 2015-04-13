Scriptname MS08KematuScript extends ReferenceAlias  

Quest Property MS08  Auto  


int FactionChange

Event OnDeath(Actor Killer)

MS08QuestScript QuestScript = MS08 as MS08QuestScript

;	if Killer == Game.GetPlayer()
		if QuestScript.SaadiaFollow == 0
			MS08.SetStage(160)
			if MS08.GetStage() == 175
				MS08.SetObjectiveDisplayed(175,0)
			endif
		else
			MS08.SetStage(199)
		endif
;	endif

EndEvent


Event OnHit(ObjectReference ActionRef, Form Weapon, Projectile ActionProj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if ActionRef == Game.GetPlayer()
		if FactionChange == 0
			KematuFaction.SetEnemy(PlayerFaction)
			FactionChange=1
		endif
	endif

EndEvent

Event OnUnload()

MS08QuestScript QuestScript = MS08 as MS08QuestScript

	if MS08.GetStage() == 201		
		QuestScript.CleanUpCheck()
	endif

EndEvent



Faction Property KematuFaction  Auto  

Faction Property PlayerFaction  Auto  


