Scriptname FreeformWinterholdATriggerScript extends ObjectReference  

Quest Property FreeformWinterholdA  Auto  

miscobject Property Jar  Auto  

int DoOnce

Event OnTriggerEnter(ObjectReference ActionRef)

; Debug.Trace(self+ "On Trigger Enter")
	if ActionRef.GetBaseObject() == Jar
; Debug.Trace(self+ "ActionRef.GetBaseObject " +ActionRef.GetBaseObject())
		if DoOnce == 0 
			FreeformWinterholdA.SetStage(30)
			DoOnce = 1
		endif
	endif

EndEvent
