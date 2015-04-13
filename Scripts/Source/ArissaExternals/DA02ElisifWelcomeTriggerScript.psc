Scriptname DA02ElisifWelcomeTriggerScript extends ReferenceAlias  

Scene Property DA02BodyGuardScene Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer() && GetOwningQuest().GetStageDone(80)
		DA02BodyGuardScene.start()
	EndIf

EndEvent
