Scriptname DB05VittoriaStandTrigger extends ObjectReference  

ReferenceAlias Property pVittoriaAlias  Auto  
Quest Property DB05  Auto
Scene Property pVittoriaSpeechScene Auto 

Event OnTriggerEnter(ObjectReference AkActivator)

If(pVittoriaAlias.GetReference()==AkActivator)
	DB05Script Script = DB05 as DB05Script
	;if Script.VittoriaSpeech == 2
	if Script.pWeddingScene01 >= 1
		BrideScene.Start()
		;Script.VittoriaSpeech = 3
	Endif
Endif

EndEvent


Scene Property BrideScene  Auto  
