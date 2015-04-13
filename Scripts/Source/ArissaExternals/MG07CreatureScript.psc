Scriptname MG07CreatureScript extends ReferenceAlias  

ReferenceAlias Property Marker  Auto  

int DoOnce


Event OnDeath (Actor Killer)

	MG07QuestScript QuestScript = MG07 as MG07QuestScript
	if QuestScript.SpawnCall == 0
		if DoOnce == 0
			QuestScript.SpawnCall = 1
			DoOnce = 1
		endif
	endif


EndEvent



Quest Property MG07  Auto  
