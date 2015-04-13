Scriptname MGR02QuestgiverScript extends ReferenceAlias  


Event OnDeath(Actor Killer)

	if MGR02.IsRunning() == 1
		MGR02.SetStage(255)
	endif

EndEvent
	
Quest Property MGR02  Auto  
