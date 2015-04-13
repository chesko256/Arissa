Scriptname CWResolution01JarlScript extends ReferenceAlias  


Event OnUpdate()	;registered / unregistered in CWResolution01 Stage 0 / 255
	
	if GetOwningQuest().GetStage() < 40
		if self.GetActorRef().IsBleedingOut()
			GetOwningQuest().SetStage(40)
		
		EndIf
	EndIf

EndEvent

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		If (GetOwningQuest() as CWResolution01Script).jarlHasSurrendered == 0
			If (GetOwningQuest() as CWResolution01Script).jarlWillSurrender == 1
				GetOwningQuest().SetStage(50)
			
			EndIf	
		EndIf
	EndIf
	
EndEvent
