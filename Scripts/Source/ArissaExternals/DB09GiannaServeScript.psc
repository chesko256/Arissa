Scriptname DB09GiannaServeScript extends ObjectReference  

Scene Property pEmperorPotageScene  Auto  
ReferenceAlias Property pGiannaAlias  Auto  
Quest Property DB09  Auto 

Event OnTriggerEnter(ObjectReference AkActivator)

;If(pGiannaAlias.GetReference()==AkActivator)
If(game.getPlayer()==AkActivator)
	pDB09Script Script = DB09 as pDB09Script
	if Script.pGiannaServe == 1
		pEmperorPotageScene.Start()
		Script.pGiannaServe = 2
		Disable()
	Endif
Endif

EndEvent




