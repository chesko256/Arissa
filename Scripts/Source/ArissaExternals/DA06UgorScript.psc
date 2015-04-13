Scriptname DA06UgorScript extends ReferenceAlias  

Quest Property DA06  Auto  

ObjectReference Property DA06UgorSceneMarker  Auto  

int StartOpenScene

Event OnUpdate()

DA06QuestScript DA06Script = DA06 as DA06QuestScript


	if DA06Script.OpenSceneDone == 0
		if DA06.GetStage() < 20 
			if GetReference().GetDistance(DA06UgorSceneMarker) < 300
				if GetReference().GetDistance(Game.GetPlayer()) < 300
					if StartOpenScene == 0
						DA06OpeningScene.Start()
						StartOpenScene = 1
					endif
				endif
			endif
		endif
	endif

EndEvent
Scene Property DA06OpeningScene  Auto  
