Scriptname MS09FraliaScript extends ReferenceAlias  

Quest Property MS09  Auto  

Quest Property MS09Argue  Auto  


Event OnDeath(Actor Killer)

	if MS09.GetStage() < 10
		MS09.Stop()
		MS09Argue.Stop()
	endif

	if MS09.GetStage() < 110
		MS09.SetStage(255)
	endif

	if MS09.GetStage() == 110
		MS09.SetStage(202)
	endif


EndEvent