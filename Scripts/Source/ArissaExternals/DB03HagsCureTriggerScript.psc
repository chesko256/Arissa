Scriptname DB03HagsCureTriggerScript extends ObjectReference  

Quest Property DB03  Auto 
ReferenceAlias Property MuiriAlias  Auto   

;Event OnTriggerEnter(ObjectReference AkActivator)

;DB03Script Script = DB03 as DB03Script

;If(MuiriAlias.GetReference()==AkActivator)
	;If(DB03.GetStage()==10)
		;If Script.MuiriQuestLocation == 1
			;Script.MuiriQuestLocation = 2
			;Disable()
		;Endif
	;Endif
;Endif

;EndEvent


