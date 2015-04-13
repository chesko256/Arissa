Scriptname DA09BossTriggerScript  extends ReferenceAlias 

int StageToSetWhenEntersBossArea = 350

Event OnTriggerEnter(ObjectReference akActionRef)

	Quest DA09 = GetOwningQuest()

	ObjectReference playerRef = Game.GetPlayer()
	
	if akActionRef == playerRef && DA09.GetStage() < 350
		DA09.setStage(StageToSetWhenEntersBossArea)
		
	EndIf

EndEvent
