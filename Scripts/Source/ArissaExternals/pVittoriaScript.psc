Scriptname pVittoriaScript extends ReferenceAlias Conditional

Quest Property pDB05  Auto  
int Property pVittoriaDie  Auto Conditional  
ReferenceAlias Property pAsgeir  Auto  
ReferenceAlias Property pVulwulf  Auto  

 
Event OnDeath(Actor aThisGuyKilledMe)

DB05Script pScript = pDB05 as DB05Script

if pDB05.GetStage () == 10
	pDB05.SetStage (20)
	DeathScene.Start()
	pAsgeir.GetActorRef().StartCombat (Game.GetPlayer()) 
       pVulwulf.GetActorRef().StartCombat (Game.GetPlayer()) 
	pPenitus.GetActorRef().StartCombat (Game.GetPlayer()) 
endif

;if pScript.VittoriaSpeech >= 1
	if pScript.OnBalcony == 1
	     pScript.Bonus = 1
	endif
;endif

;pVeezaraAlias.GetReference().Moveto (pVeezaraMarker)

EndEvent



Scene Property DeathScene  Auto  

ReferenceAlias Property pPenitus  Auto  

ReferenceAlias Property pVeezaraAlias  Auto  

ObjectReference Property pVeezaraMarker  Auto  
