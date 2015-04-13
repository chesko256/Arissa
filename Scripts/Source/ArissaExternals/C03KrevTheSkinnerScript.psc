Scriptname C03KrevTheSkinnerScript extends ReferenceAlias  

ReferenceAlias Property Aela auto


Event OnDeath(Actor akKiller)
	GetOwningQuest().SetObjectiveCompleted(30)
	GetOwningQuest().SetObjectiveDisplayed(31)
	(GetOwningQuest() as C03QuestScript).AelaShouldForceGreet = True
	Aela.GetActorReference().EvaluatePackage()
EndEvent
