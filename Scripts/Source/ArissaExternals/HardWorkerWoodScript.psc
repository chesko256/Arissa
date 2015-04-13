Scriptname HardWorkerWoodScript extends ObjectReference  


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == "AddToInventory"
		AchievementsQuest.IncHardWorker(1)

	endif
endEvent


AchievementsScript Property AchievementsQuest Auto