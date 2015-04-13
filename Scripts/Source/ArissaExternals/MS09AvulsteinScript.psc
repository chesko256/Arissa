Scriptname MS09AvulsteinScript extends ReferenceAlias  

Quest Property MS09  Auto  


Event OnDeath (Actor Killer)

	if MS09.GetStage() < 10
		MS09.Stop()
	endif

	if Killer == Game.GetPlayer()
		MS09.SetStage(255)
	endif


EndEvent