Scriptname SolitudeDoorScript extends ReferenceAlias

quest Property HousePurchase  Auto

Event OnActivate(ObjectReference akActionRef) 
	
	HousePurchaseScript QuestScript = GetOwningQuest() as HousePurchaseScript
	
	if akactionref == game.getplayer() && QuestScript.SolitudeHouseVar == 1
		
		QuestScript.SolitudeHouseVar = 2

		GetOwningQuest().SetObjectiveCompleted(20,1)

	endif

EndEvent
