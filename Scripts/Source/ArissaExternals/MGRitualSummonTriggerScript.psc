Scriptname MGRitualSummonTriggerScript extends ObjectReference  

quest Property MGRitual03  Auto  


Event OnTriggerEnter (ObjectReference ActionRef)

If ActionRef == Game.GetPlayer()

	(MGRitual03 as MGRitual03QuestScript).InTrigger =1

endif

EndEvent



Event OnTriggerLeave (ObjectReference ActionRef)

If ActionRef == Game.GetPlayer()

	(MGRitual03 as MGRitual03QuestScript).InTrigger =0

endif



EndEvent