Scriptname DA06AtubAliasScript extends ReferenceAlias  




Event OnDeath(Actor AkKiller)

	if AkKiller == Game.GetPlayer()
		if DA06.GetStage() < 200
			DA06.SetStage(255)
		endif
	endif

EndEvent


Quest Property DA06  Auto  
