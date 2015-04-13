Scriptname CWAttackCityJarlScript extends ReferenceAlias  

;VERY SIMILAR TO CWResolution01JarlScript

Event OnUpdate()	;registered / unregistered in CWAttackCityS Stage 0 / 255
	
	if GetOwningQuest().GetStage() < 35
		if GetActorRef().IsBleedingOut()
			GetOwningQuest().SetStage(35)
		
		EndIf
	endif	

EndEvent
