Scriptname defaultStartSceneIfNoCombatTrigScript extends ObjectReference  
{starts the specified scene when triggered by the trigger actor, if they are not
currently in combat}

Scene Property SceneToStart  Auto  
{scene to start}

bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}

objectReference property triggerActor auto
{by default, the player}

auto state waiting
EVENT onTriggerEnter(objectReference actronaut)
	if ((triggerActor == None && actronaut == Game.GetPlayer()) || actronaut as actor == triggerActor)
		if (!(actronaut as actor).IsInCombat())
			if (PrereqQuest == None || prereqStage == -1 || PrereqQuest.GetStageDone(prereqStage))
				Utility.Wait(1)
				SceneToStart.Start()
				tempTriggered = true
				if DoOnce
					gotoState("done")
					self.delete()
				endif
			endif
		endif
	endif
endEVENT
endState

state done
; do nothing
endState

Quest Property PrereqQuest = None  Auto  
{optional prereq quest & stage}

int Property prereqStage = -1 Auto  
{optional prereq quest & stage
 -1 = no prereq stage
}

bool tempTriggered = false
