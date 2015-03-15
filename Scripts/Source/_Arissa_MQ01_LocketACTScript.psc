Scriptname _Arissa_MQ01_LocketACTScript extends ObjectReference  

Quest property _Arissa_MQ01 auto

Event OnActivate(ObjectReference akActionRef)
	self.Disable()
	_Arissa_MQ01.SetStage(20)
endEvent