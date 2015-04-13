Scriptname RiftenDoorScript extends ReferenceAlias

quest Property HousePurchase  Auto

Event OnActivate(ObjectReference akActionRef) 
	
	HousePurchaseScript QuestScript = GetOwningQuest() as HousePurchaseScript
	
	if akactionref == game.getplayer() && QuestScript.RiftenHouseVar == 1
		
		QuestScript.RiftenHouseVar = 2

		GetOwningQuest().SetObjectiveCompleted(30,1)

	endif

EndEvent 

  
