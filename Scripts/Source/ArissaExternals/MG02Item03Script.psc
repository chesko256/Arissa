Scriptname MG02Item03Script extends ReferenceAlias  

GlobalVariable Property ItemsFound  Auto  

Quest Property MG02  Auto  

int DoOnce


Event OnActivate (ObjectReference ActionRef)

	MG02QuestScript QuestScript = MG02 as MG02QuestScript

	if ActionRef == Game.GetPlayer()
		if MG02.GetStage() < 35
			QuestScript.MG02Item3Found = 1
			if DoOnce == 0
				QuestScript.VCount()
				DoOnce=1
			endif
		endif
	endif

EndEvent
