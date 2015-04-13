Scriptname pOlfridScript extends ReferenceAlias  Conditional

Scene Property pWhiterunArgueScene  Auto  
int Property pDoOnce  Auto  Conditional
Quest Property pWhiterunSceneQuest  Auto  


;Event OnInit()
;GetActorRef().RegisterForUpdate(1)
;EndEvent

;Event OnUpdate()


;This controls the starting of the Civil War argument in the Whiterun street
;if pDoOnce == 0
	;if Game.GetPlayer().GetDistance(Self.GetRef()) <= 900
		;pWhiterunArgueScene.Start()
		;DialogueWhiterunArgueScript pWhiterunSceneScript = pWhiterunSceneQuest as DialogueWhiterunArgueScript 
		;pWhiterunSceneScript.StreetArgue = 1
		;pDoOnce = 1
	;endif
;endif

;EndEvent

 

