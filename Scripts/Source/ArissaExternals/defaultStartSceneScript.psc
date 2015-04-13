Scriptname defaultStartSceneScript extends ObjectReference  
{starts the specified scene when triggered by the trigger actor}

Scene Property SceneToStart  Auto  
{scene to start}

bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}

objectReference property triggerActor auto
{by default, the player}

EVENT onActivate(objectReference actronaut)
	if (triggerActor == None || actronaut as actor == triggerActor)
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