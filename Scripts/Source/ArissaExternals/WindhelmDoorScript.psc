Scriptname WindhelmDoorScript extends ReferenceAlias

quest Property HousePurchase  Auto

Event OnActivate(ObjectReference akActionRef) 
	
	HousePurchaseScript QuestScript = GetOwningQuest() as HousePurchaseScript
	
	if akactionref == game.getplayer() && QuestScript.WindhelmHouseVar == 1
		
		QuestScript.WindhelmHouseVar = 2

		GetOwningQuest().SetObjectiveCompleted(50,1)

	endif

EndEvent 
