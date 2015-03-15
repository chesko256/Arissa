Scriptname _Arissa_MQ03MoveArissa extends ObjectReference  

ObjectReference property _Arissa_MQ03MoveMarker auto
Actor property iNPC_Actor auto
Quest property _Arissa_MQ02 auto
message property _Arissa_MQ02EndMessage auto

Event OnTriggerEnter(ObjectReference akActionRef)
	iNPC_Actor.MoveTo(_Arissa_MQ03MoveMarker)
	;Set the quest stage to make Arissa's package force her to stand here.
	_Arissa_MQ02.SetStage(53)
	iNPC_Actor.EvaluatePackage()
	_Arissa_MQ02EndMessage.Show()
	self.Disable()
endEvent