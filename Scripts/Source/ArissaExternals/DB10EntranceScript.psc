Scriptname DB10EntranceScript extends ObjectReference  

Quest Property DB10  Auto  
Quest Property DB02 Auto
Quest Property DBDestroy Auto

Event OnTriggerEnter(ObjectReference AkActivator)
pDB10Script Script = DB10 as pDB10Script

If(game.getPlayer()==AkActivator)
	If(DB10.GetStage()==10)
		pAgentTalkScene.Start()
		DB10.SetStage(15)
	Endif
Endif

If(game.getPlayer()==AkActivator)
	If(DB02.GetStage()==40)
		DB02.SetStage(50)
	Endif
Endif

If(game.getPlayer()==AkActivator)
	If(DBDestroy.GetStage()==30)
		DBDestroy.SetStage(35)
	Endif
Endif

EndEvent


;Event OnTriggerExit(ObjectReference AkActivator)
;pDB10Script Script = DB10 as pDB10Script

;If(game.getPlayer()==AkActivator)
	;if Script.AgentTalk == 0
		;pAgentTalkScene.Start()
		;Script.AgentTalk == 1
	;Endif
;Endif
 

;EndEvent

Scene Property pAgentTalkScene  Auto  
