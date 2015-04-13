Scriptname C04WitchScript extends Actor  

ObjectReference Property Head auto
Quest Property C04 auto


Event OnDeath(Actor akKiller)
	AddItem(Head)
	if (C04.IsRunning())
		(C04 as C04QuestScript).KilledHagraven()
	endif
endEvent
