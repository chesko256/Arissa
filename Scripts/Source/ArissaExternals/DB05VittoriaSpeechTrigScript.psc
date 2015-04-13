Scriptname DB05VittoriaSpeechTrigScript extends ObjectReference  

ReferenceAlias Property pVittoriaAlias  Auto  
Quest Property DB05  Auto
Scene Property pVittoriaSpeechScene Auto 

Event OnTriggerEnter(ObjectReference AkActivator)

If(pVittoriaAlias.GetReference()==AkActivator)
	DB05Script Script = DB05 as DB05Script
	if Script.VittoriaSpeech == 0
		Script.OnBalcony = 1
		;pVittoriaSpeechScene.Start()
	Endif
Endif

EndEvent

Event OnTriggerLeave(ObjectReference AkActivator)

If(pVittoriaAlias.GetReference()==AkActivator) 
       DB05Script Script = DB05 as DB05Script
	Script.OnBalcony = 0	 
Endif

EndEvent
