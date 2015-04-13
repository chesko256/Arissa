Scriptname DB10NazirSearchScript extends ObjectReference  

Event OnTriggerEnter(ObjectReference AkActivator)

If(NazirAlias.GetReference()==AkActivator)
	If(DB10.GetStage()>=40)
		If(DB10.GetStage()<=50)
			NazirSearchScene.Start()
			Disable()
		Endif
	Endif
Endif


EndEvent

Quest Property DB10  Auto  

Scene Property NazirSearchScene  Auto  

ReferenceAlias Property NazirAlias  Auto  
