Scriptname DA06GiantScript extends ReferenceAlias  

Quest Property DA06  Auto  


Event OnDeath (Actor Killer)

DA06QuestScript QuestScript = DA06 as DA06QuestScript

	if Killer == Game.GetPlayer()
		if DA06.GetStage() == 100
			if Yamarz.GetActorReference().IsDead()	
				HammerGroveScene.Start()
			endif
		endif
	endif		

	QuestScript.GiantDead100 = 1
	Yamarz.GetActorReference().EvaluatePackage()
	DA06.SetObjectiveCompleted(100,1)
	DA06.SetObjectiveDisplayed(110,1)
EndEvent
ReferenceAlias Property Yamarz  Auto  

Scene Property HammerGroveScene  Auto  
