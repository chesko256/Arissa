Scriptname MS04AvanchnzelTrigger3Script extends ReferenceAlias  

Event OnActivate(ObjectReference akActionRef)

	If GetOwningQuest().GetStage() == 120
		GetOwningQuest().SetStage(130)	
	Endif

EndEvent