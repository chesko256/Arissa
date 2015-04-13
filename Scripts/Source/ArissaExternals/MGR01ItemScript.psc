Scriptname MGR01ItemScript extends ReferenceAlias  

Quest Property MGR01  Auto  


Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MGR01.GetStage() == 10
			MGR01.SetStage(20)
		endif
	endif

EndEvent