Scriptname pNightMotherDawnstarTriggerScript extends ObjectReference  

Quest Property DB11  Auto  
Quest Property DBrecurring  Auto
Scene Property pNightMotherDawnstarScene  Auto  
Scene Property pNightMotherRecurringScene1  Auto    

bool bPlayerInTrigger

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	bPlayerInTrigger = true
DBRecurringQuestScript Script = DBRecurring as DBRecurringQuestScript
if Script.HaveContract == 0
	If(DBRecurring.GetStage() == 10)
		pNightMotherRecurringScene1.Start()
		;pNightMotherDawnstarScene.Start()
		;DB11.SetStage(200)
		;Disable()
	Endif
Endif
Endif

EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		bPlayerInTrigger = false
	endif
endEvent

bool function IsPlayerInTrigger()
	return bPlayerInTrigger
endFunction