Scriptname MS04AvanchnzelTrigger1Script extends ReferenceAlias  

Event OnActivate(ObjectReference akActionRef)

	If GetOwningQuest().GetStage() == 100
		GetOwningQuest().SetStage(110)	
	Endif

EndEvent