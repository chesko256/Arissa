Scriptname MS04AvanchnzelTrigger2Script extends ReferenceAlias  

Event OnActivate(ObjectReference akActionRef)

	If GetOwningQuest().GetStage() == 110
		GetOwningQuest().SetStage(120)	
	Endif

EndEvent