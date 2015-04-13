Scriptname DA05ConclusionTriggerScript extends ObjectReference  


ReferenceAlias Property QuestingBeastGhost auto

Event OnTriggerEnter(ObjectReference akActivator)
	QuestingBeastGhost.GetReference().Activate(Game.GetPlayer())
	Disable()
EndEvent
