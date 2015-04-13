Scriptname MS11SQBoundariesTriggerScript extends ObjectReference  

Quest Property ms11 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		MS11QuestScript ms11script = ms11 as MS11QuestScript
		ms11script.PlayerInStoneQuarter = true
	endif
endEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		MS11QuestScript ms11script = ms11 as MS11QuestScript
		ms11script.PlayerInStoneQuarter = false
	endif
endEvent