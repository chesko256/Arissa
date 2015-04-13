Scriptname MarkarthDoorScript extends ReferenceAlias

quest Property HousePurchase  Auto

Event OnActivate(ObjectReference akActionRef) 
	
	HousePurchaseScript QuestScript = GetOwningQuest() as HousePurchaseScript
	
	if akactionref == game.getplayer() && QuestScript.MarkarthHouseVar == 1
		
		QuestScript.MarkarthHouseVar = 2

		GetOwningQuest().SetObjectiveCompleted(40,1)

	endif

EndEvent 
