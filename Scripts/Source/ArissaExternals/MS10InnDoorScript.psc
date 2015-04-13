Scriptname MS10InnDoorScript extends ReferenceAlias  

Scene Property PirateScene auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator != Game.GetPlayer())
		return
	endif
	if (GetOwningQuest().GetStage() >= 30)
		PirateScene.Start()
		self.GetReference().Disable()
	endif
EndEvent
