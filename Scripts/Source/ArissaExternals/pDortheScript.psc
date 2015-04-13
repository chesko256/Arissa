Scriptname pDortheScript extends ReferenceAlias Conditional


int Property pDoOnce  Auto  Conditional
Scene Property pRiverwoodKidsScene  Auto  
ObjectReference Property pDorthePlayMarker  Auto  
ObjectReference Property pFrodnarPlayMarker  Auto  
Quest Property pRiverwoodKidsQuest  Auto  
ReferenceAlias Property pFrodnar  Auto 
ObjectReference Property pDortheTagMarker  Auto
   
RiverwoodKidsPlayScript  pRiverwoodKidsScript


Event OnInit()
 pRiverwoodKidsScript = pRiverwoodKidsQuest as RiverwoodKidsPlayScript  
;GetActorRef().RegisterForUpdate(1)
EndEvent

Event OnUpdate()

;This controls Dorthe and Frodnar's scene
;if DoOnce == 0
if pDoOnce == 0
	;if DialogueRiverWoodKidsScene.RiverwoodPlay == 0
	if pRiverwoodKidsScript.RiverwoodPlay == 0
		;if Player.GetDistance DortheRef <= 800
		if Game.GetPlayer().GetDistance(Self.GetRef()) <= 800
			;if DortheRef.GetDistance DorthePlaySceneMarker <= 300
			if Self.GetRef().GetDistance(pDorthePlayMarker) <= 300
				;if FrodnarRef.GetDistance FrodnarPlaySceneMarker <= 300
				if pFrodnar.GetRef().GetDistance(pFrodnarPlayMarker) <= 300
					;if GetCurrentTime >= 5
						;if GetCurrentTime <= 19
							;StartScene RiverwoodDortheFrodnarPlayScene
							pRiverwoodKidsScene.Start()
							;Set DoOnce to 1
							pDoOnce = 1
							;Set DialogueRiverwoodKidsScene.RiverwoodPlay to 2
							pRiverwoodKidsScript.RiverwoodPlay = 2
							
						;endif
					;endif
				endif
			endif
		endif
	endif
endif

;If DialogueRiverwoodKidsScene.RiverwoodPlay >= 3
if pRiverwoodKidsScript.RiverwoodPlay >= 3
	;If DialogueRiverwoodKidsScene.RiverwoodPlay <= 4
	if pRiverwoodKidsScript.RiverwoodPlay <= 4
		;if DortheRef.GetDistance DortheTagRunMarker <= 300
		if Self.GetRef().GetDistance(pDortheTagMarker) <= 300
			;set DialogueRiverwoodKidsScene.RiverwoodPlay to 5
			 pRiverwoodKidsScript.RiverwoodPlay = 5
		endif
	endif
endif

EndEvent







