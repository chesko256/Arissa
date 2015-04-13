Scriptname CWResolution02JarlScript extends ReferenceAlias  

Event OnUpdate()	;registered / unregistered in CWResolution01 Stage 0 / 255
	
	if  (GetOwningQuest() as CWResolution02Script).jarlWillSurrender == 0
		if self.GetActorRef().IsBleedingOut()
			 (GetOwningQuest() as CWResolution02Script).jarlWillSurrender = 1	;this is used by a package that makes him do the actual surrendering.
		

		EndIf
	EndIf

EndEvent
