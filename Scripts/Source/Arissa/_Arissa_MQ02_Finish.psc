Scriptname _Arissa_MQ02_Finish extends ObjectReference  

Actor property iNPC_Actor auto
Quest property _Arissa_MQ02 auto
_Arissa_iNPC_Behavior property iNPCSystem auto
ObjectReference property refToDisable auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		iNPC_Actor.MoveTo(Game.GetPlayer())
		_Arissa_MQ02.CompleteAllObjectives()
		_Arissa_MQ02.CompleteQuest()
		_Arissa_MQ02.SetStage(100)
		if iNPCSystem.CanWait == false
			iNPCSystem.CanWait = true
		endif
		refToDisable.Disable()
		self.Disable()
	endif
endEvent