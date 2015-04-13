Scriptname MG03OrthornGuardScript extends ReferenceAlias  

Scene Property MG03OrthornScene  Auto  


Event OnDeath(Actor Killer)

	MG03QuestScript QuestScript = MG03 as MG03QuestScript
	QuestScript.MG03GuardSceneRun = -1
	MG03OrthornScene.Start()


EndEvent
Quest Property MG03  Auto  
