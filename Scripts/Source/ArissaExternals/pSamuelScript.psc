Scriptname pSamuelScript extends ReferenceAlias

Quest Property pDB01  Auto  
Scene Property pChildrenScene  Auto  
Location Property pHonorhallLocation  Auto  
  

;Event OnInit()
;GetActorRef().RegisterForUpdate(1)
;EndEvent

Event OnUpdate()

;This controls the children in Honorhall cheering when Grelod is killed
 if pDB01.GetStage() == 30
	if Game.GetPlayer().IsInLocation(pHonorhallLocation) == 1 
		DB01QuestScript pDB01Script = pDB01 as DB01QuestScript
		if pDB01Script.ChildrenCheer == 0
			pChildrenScene.Start()
			pDB01Script.ChildrenCheer == 1
		endif
	endif
endif

EndEvent
