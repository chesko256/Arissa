Scriptname MS09ThoraldScript extends ReferenceAlias  

Quest Property MS09  Auto  

Location Property NorthwatchKeep  Auto  


Event OnDeath (Actor Killer)

;If Thorald is killed before the player has picked up MS09, just kill the quest.

	if MS09.GetStage() < 10
		MS09.Stop()
	elseif MS09.GetStage() < 200


;If Thorald dies during the quest, end the quest

;	if Killer == Game.GetPlayer()
		MS09.SetStage(255)
	endif

EndEvent