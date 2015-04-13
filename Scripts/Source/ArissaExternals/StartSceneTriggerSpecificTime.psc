Scriptname StartSceneTriggerSpecificTime extends ObjectReference  
{This sc ript copies the DefaultStartSceneTrigger script, but adds the additinoal conditions of limiting the time between 8am and 8pm}

Scene Property SceneToStart  Auto  
{scene to start}

bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}

objectReference property triggerActor auto
{by default, the player}

Quest Property PrereqQuest = None  Auto  
{optional prereq quest & stage}

int Property prereqStage = -1 Auto  
{optional prereq quest & stage
 -1 = no prereq stage
}

GlobalVariable property GameHour auto

bool tempTriggered = false

float Property NoEarlierThan = -1.0 Auto  
{OPTIONAL: If gamehour is greater than this, and less than NoLaterThan, then trigger, otherwise don't. SET BOTH THESE PROPERTIES IF YOU SET ONE OF THEM}

float Property NoLaterThan  = -1.0 Auto  
{OPTIONAL: If gamehour is less than this, and greater than NoEarlierThan, then trigger, otherwise don't. SET BOTH THESE PROPERTIES IF YOU SET ONE OF THEM}

auto state waiting
EVENT onTriggerEnter(objectReference actronaut)
	if (triggerActor == None || actronaut as actor == triggerActor)
		if (PrereqQuest == None || prereqStage == -1 || PrereqQuest.GetStageDone(prereqStage))

			;CHECK TIME
			if  IsTimeValid()
				SceneToStart.Start()
				tempTriggered = true
				if DoOnce
					gotoState("done")
					disable()
					delete()
				endif
			endif

		endif
	endif
endEVENT
endState

state done
; do nothing
endState

bool function IsTimeValid()

	Float Time = GameHour.GetValue()

	if NoEarlierThan == -1 && NoLaterThan == -1
		return TRUE
	endif

	if NoEarlierThan > NoLaterThan
		if Time >= NoEarlierThan && Time <= NoLaterThan
			return TRUE
		endif

	elseif NoEarlierThan < NoLaterThan
		if Time >= NoEarlierThan || Time <= NoLaterThan
			return TRUE
		endif

	endif

	Return FALSE

endFunction
