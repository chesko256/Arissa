Scriptname MGRejoinTargetScript extends ReferenceAlias  

Quest Property MGRejoinQuest  Auto  


Event OnDeath(Actor Killer)

	if Killer == Game.GetPlayer()
		if MGRejoinQuest.GetStage() == 10 
			MGRejoinQuest.SetStage(20)
		endif
	endif

EndEvent