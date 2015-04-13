Scriptname WhiterunDoorAliasScript extends referencealias  

quest Property HousePurchase  Auto

Event OnActivate(ObjectReference akActionRef) 
	
	HousePurchaseScript QuestScript = GetOwningQuest() as HousePurchaseScript
	
	if akactionref == game.getplayer() && QuestScript.WhiterunHouseVar == 1
		
		QuestScript.WhiterunHouseVar = 2

		GetOwningQuest().SetObjectiveCompleted(10,1)

	endif

EndEvent 
