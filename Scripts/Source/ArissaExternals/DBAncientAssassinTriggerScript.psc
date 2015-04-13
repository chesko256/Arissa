Scriptname DBAncientAssassinTriggerScript extends ObjectReference  

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(FindAssassinQuest.GetStage()==10)
		FindAssassinQuest.SetStage(200)
		Disable()
	Endif
Endif

EndEvent

Quest Property FindAssassinQuest  Auto  
