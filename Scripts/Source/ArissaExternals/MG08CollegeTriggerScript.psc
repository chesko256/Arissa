Scriptname MG08CollegeTriggerScript extends ObjectReference  

Quest Property CurrentQuest  Auto  
  

int DoOnce


Event OnTriggerEnter(ObjectReference ActionRef)

MG08QuestScript QuestScript = CurrentQuest as MG08QuestScript


	if ActionRef == Game.GetPlayer()
		if DoOnce == 0
			QuestScript.TriggerVar1 += 1
			DoOnce = 1
		endif
	endif

EndEvent