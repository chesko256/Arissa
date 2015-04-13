Scriptname DefaultOnReadSetQuestStage extends ReferenceAlias  

int Property myStage  Auto  

Quest Property myQuest  Auto  

event onRead()
	myQuest.setStage(myStage)
endEvent

