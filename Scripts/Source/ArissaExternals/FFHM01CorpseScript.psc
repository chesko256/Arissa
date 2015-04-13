Scriptname FFHM01CorpseScript extends ObjectReference  Conditional

GlobalVariable Property pFFHM01Found Auto
Quest Property pFFHM01Quest Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pFFHM01Quest.GetStage() == 20
			pFFHM01Found.Value = 1
			pFFHM01Quest.SetStage(30)
		else
			pFFHM01Found.Value = 1
			pFFHM01Quest.SetStage(15)
		endif
	endif

endEvent