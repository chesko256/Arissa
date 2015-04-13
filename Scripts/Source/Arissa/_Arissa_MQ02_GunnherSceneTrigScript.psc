Scriptname _Arissa_MQ02_GunnherSceneTrigScript extends ObjectReference  

Scene property _Arissa_MQ02_GunnherScene auto

Event OnTrigger(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		_Arissa_MQ02_GunnherScene.Start()
		self.Disable()
	endif
endEvent