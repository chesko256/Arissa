Scriptname MGR02GlovesScript extends ObjectReference  



Event OnEquipped(Actor akActor)

	MGR02QuestScript QuestScript = MGR02 as MGR02QuestScript 

	if AkActor == Game.GetPlayer()
		if QuestScript.GlovesEquipped == 0
			QuestScript.GlovesEquipped = 1
		endif
	endif


EndEvent


Event OnUnequipped(Actor AkActor)

	MGR02QuestScript QuestScript = MGR02 as MGR02QuestScript 

	if AkActor == Game.GetPlayer()
		if QuestScript.GlovesEquipped == 1
			QuestScript.GlovesEquipped = 0
		endif
	endif

EndEvent
		
Quest Property MGR02  Auto  
