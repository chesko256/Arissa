Scriptname pBD08PondTriggerScript extends ObjectReference  

Quest Property DB08  Auto 
ReferenceAlias Property pBalagogAlias  Auto   

Bool isloaded

Event OnLoad()
            Isloaded = true
endEvent

Event OnUnload()
            Isloaded = false
endEvent



Event OnTriggerEnter(ObjectReference AkActivator)
pDB08Script Script = DB08 as pDB08Script
	;Debug.MessageBox("Got the activator")

Script.IncBodyTrigger()

If(pBalagogAlias.GetReference()==AkActivator)
	;Debug.MessageBox("And it's BALALALALALALAGOG")
	If(DB08.GetStage()>=20)
		If(DB08.GetStage()<=30)
			DB08.SetObjectiveCompleted (15)
			Script.pBodyHidden=1
		Endif	
	Endif
Endif

EndEvent


Event OnTriggerLeave(ObjectReference AkActivator)
pDB08Script Script = DB08 as pDB08Script

Script.DecBodyTrigger()

;If(pBalagogAlias.GetReference()==AkActivator)
	;If(DB08.GetStage()>=20)
		;If(DB08.GetStage()<=30)
			;DB08.SetObjectiveDisplayed (15)
			;Script.pBodyHidden=0
		;Endif	
	;Endif
;Endif

EndEvent


