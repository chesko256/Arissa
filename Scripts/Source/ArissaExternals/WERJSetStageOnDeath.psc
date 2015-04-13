Scriptname WERJSetStageOnDeath extends ReferenceAlias  

Quest Property myQuest  Auto  

int Property myStage  Auto  

Event OnDeath(Actor akKiller)
	myQuest.setStage(myStage)
endEvent
