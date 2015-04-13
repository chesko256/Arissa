Scriptname MG02WallAliasScript extends ReferenceAlias  

Spell Property AmuletSpell  Auto  

ObjectReference Property SpikeTrigger  Auto  

ObjectReference Property MG02AmuletResonanceRef  Auto

Event OnActivate(ObjectReference ActionRef)

;	if AmuletTaken == 0
;		if ActionRef == Game.GetPlayer()
;			Self.GetReference().PlayAnimation("Take")
;		endif
;	endif


EndEvent
	



;Event OnHit(ObjectReference AkAggressor, Form AkSource, Projectile AkProjectile, bool PowerAttack, bool AbSneakAttack, bool abBashAttack, bool AbHitBlocked)

Event OnMagicEffectApply(ObjectReference AkCaster, MagicEffect AkEffect)

	if AkCaster == Game.GetPlayer()
		if Game.GetPlayer().IsEquipped(MG02Amulet)== 1

			if (MG02 as MG02QuestScript).TrapCollisionToggle== -1


				MG02QuestScript QuestScript = MG02 as MG02QuestScript
				if QuestScript.TolfdirUpdate == 0
					QuestScript.TolfdirUpdate=1
					MG02AmuletResonanceRef.PlayAnimation("PlayAnim01")
					MG02TrapCollision01Ref.Disable()
					Self.GetReference().PlayAnimation("Open")
					SpikeTrigger.Activate(Game.GetPlayer())
					MG02.SetObjectiveDisplayed(30,0)
					MG02.SetObjectiveCompleted(35,1)
					MG02.SetObjectiveDisplayed(40,1)
					MG02TolfdirAmuletScene.Stop()
					TolfdirTunnelScene.Start()
				endif		
			endif
		endif
	endif

EndEvent
Quest Property MG02  Auto  

int Property AmuletTaken  Auto
Armor Property MG02Amulet  Auto  

scene Property TolfdirTunnelScene  Auto  

Scene Property MG02TolfdirAmuletScene  Auto  

ObjectReference Property MG02TrapCollision01Ref  Auto  
