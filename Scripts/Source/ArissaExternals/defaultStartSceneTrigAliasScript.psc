Scriptname defaultStartSceneTrigAliasScript extends ObjectReference  
{starts the specified scene when triggered by the trigger alias}

Scene Property SceneToStart  Auto  
{scene to start}

bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}

ReferenceAlias property triggerActor auto

EVENT onTriggerEnter(objectReference actronaut)
	if (triggerActor == None)
		return
	endif
	
	if (actronaut == triggerActor.GetReference())
		if (PrereqQuest == None || prereqStage == -1 || PrereqQuest.GetStageDone(prereqStage))
			SceneToStart.Start()
			if DoOnce
				self.delete()
			endif
		endif
	endif
endEVENT

Quest Property PrereqQuest = None  Auto  
{optional prereq quest & stage}

int Property prereqStage = -1 Auto  
{optional prereq quest & stage
 -1 = no prereq stage
}