Scriptname pArnbjornScript extends ReferenceAlias Conditional  

int Property pDawnstarFind  Auto  Conditional
Quest Property pDB07  Auto  


;Event OnInit()
;GetActorRef().RegisterForUpdate(1)
;EndEvent

;Event OnUpdate()

;If pDawnstarFind == 0
	;if pDB07.GetStage () == 30
		;if Game.GetPlayer().GetDistance(Self.GetRef()) <= 400
			;pDB07.SetObjectiveCompleted(30, 1)
			;pDawnstarFind = 1
		;Endif
	;Endif
;Endif



;EndEvent
