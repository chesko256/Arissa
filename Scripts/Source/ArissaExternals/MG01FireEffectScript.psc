Scriptname MG01FireEffectScript extends ActiveMagicEffect  

Quest Property MG01  Auto  


Event OnEffectStart(Actor Target, Actor Caster)

MG01QuestScript QuestScript = MG01 as MG01QuestScript

	if Target == Game.GetPlayer()
		QuestScript.PlayerHit = 1
	endif

EndEvent