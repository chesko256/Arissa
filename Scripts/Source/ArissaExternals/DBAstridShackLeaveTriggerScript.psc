Scriptname DBAstridShackLeaveTriggerScript extends ObjectReference  

Quest Property DBEntranceQuest  Auto

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If DB02.GetStage () == 40
		pDBEntranceQuestScript Script = DBEntranceQuest as pDBEntranceQuestScript
		Script.AstridMove = 1
		Astrid.Moveto (AstridMoveMarker)
		Disable()
	Endif
Endif

EndEvent

ObjectReference Property AstridMoveMarker  Auto  

ObjectReference Property Astrid  Auto  

Quest Property DB02  Auto  
