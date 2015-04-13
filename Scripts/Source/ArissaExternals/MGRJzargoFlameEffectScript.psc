Scriptname MGRJzargoFlameEffectScript extends ActiveMagicEffect  

Explosion Property FireballExplosion  Auto  

Keyword Property UndeadKeyword  Auto




Event OnEffectStart(Actor Target, Actor Caster)

;Cast quest script to access vars

MGRJzargoSpell01QuestScript QuestScript = Jzargo01 as MGRJzargoSpell01QuestScript

;If spell is hitting an undead target, add on extra explosion

if Target.HasKeyword(UndeadKeyword)
	
	Target.PlaceAtMe(FireballExplosion, 1, False, False)

;and run VCount function on Quest Script

	if Jzargo01.GetStage() == 20
		QuestScript.VCount()
	endif

endif

EndEvent
Quest Property Jzargo01  Auto  

GlobalVariable Property TestCast  Auto  
