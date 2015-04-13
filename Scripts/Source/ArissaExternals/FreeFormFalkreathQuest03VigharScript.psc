Scriptname FreeFormFalkreathQuest03VigharScript extends ReferenceAlias  

Event OnDeath(Actor Killer)
	DengeirQuest.SetStage(20)
	GetOwningQuest().SetStage(20)
EndEvent

Quest Property DengeirQuest  Auto  
