Scriptname MG07VisionTriggerScript extends ObjectReference  

ReferenceAlias Property MG07SavosGhostAlias  Auto  

ReferenceAlias Property MG07HafnarGhostAlias  Auto  

ReferenceAlias Property MG07AtmahGhostAlias  Auto  

ReferenceAlias Property MG07GirduinGhostAlias  Auto  

ReferenceAlias Property MG07ElvaliGhostAlias  Auto  

ReferenceAlias Property MG07TakesGhostAlias  Auto  

ObjectReference Property MarkerSavos  Auto  

ObjectReference Property MarkerHafnar  Auto  

ObjectReference Property MarkerAtmah  Auto  

ObjectReference Property MarkerGirduin  Auto 

ObjectReference Property MarkerElvali  Auto 

ObjectReference Property MarkerTakes  Auto

Quest Property MG07  Auto

Scene Property VisionScene  Auto 

int DoOnce


Event OnTriggerEnter (ObjectReference ActionRef)

MG07QuestScript MG07Script = MG07 as MG07QuestScript


;When player hits the trigger, move all actors involved to their marks and enable them

	if ActionRef == Game.GetPlayer()
		if MG07.GetStage() >= 10
			MG07SavosGhostAlias.GetReference().MoveTo(MarkerSavos)
			MG07SavosGhostAlias.GetReference().Enable(True)
			MG07GhostEnableParentAlias.GetReference().Enable(True)
			if MG07Script.SceneCounter <=5

				MG07HafnarGhostAlias.GetReference().MoveTo(MarkerHafnar)
				MG07HafnarGhostAlias.GetReference().Enable(True)

				MG07AtmahGhostAlias.GetReference().MoveTo(MarkerAtmah)
				MG07AtmahGhostAlias.GetReference().Enable(True)
				While ((MG07AtmahGhostAlias != None) && (MG07AtmahGhostAlias.GetReference().Is3DLoaded() == False))
					Utility.Wait(0.1)
				endwhile
			endif

			if MG07Script.SceneCounter <= 2
				MG07GirduinGhostAlias.GetReference().MoveTo(MarkerGirduin)
				MG07GirduinGhostAlias.GetReference().Enable()
				While ((MG07GirduinGhostAlias !=None) && (MG07GirduinGhostAlias.GetReference().Is3DLoaded() == False))  
					Utility.Wait(0.1)
				endwhile
			endif

			if MG07Script.SceneCounter<= 3
				MG07ElvaliGhostAlias.GetReference().MoveTo(MarkerElvali)
				MG07ElvaliGhostAlias.GetReference().Enable()
				While ((MG07ElvaliGhostAlias != None) && ( MG07ElvaliGhostAlias.GetReference().Is3DLoaded() == False))
					Utility.Wait(0.1)
				endwhile
			endif

			if MG07Script.SceneCounter<= 4
				MG07TakesGhostAlias.GetReference().MoveTo(MarkerTakes)
				MG07TakesGhostAlias.GetReference().Enable()
				While ((MG07TakesGhostAlias != None) && (MG07TakesGhostAlias.GetReference().Is3DLoaded() == False))
					Utility.Wait(0.1)
				endwhile
			endif

;update counter for next trigger, start the scene and disable the trigger

			MG07Script.SceneCounter += 1
			VisionScene.Start()
			Self.Disable()
		endif
	endif

EndEvent
ReferenceAlias Property MG07GhostEnableParentAlias  Auto  
