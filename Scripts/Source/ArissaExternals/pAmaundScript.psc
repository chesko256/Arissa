Scriptname pAmaundScript extends ReferenceAlias  

ReferenceAlias Property pAmaundAlias  Auto  
Quest Property pDB04  Auto  


;Event OnInit()
;GetActorRef().RegisterForUpdate(1)
;EndEvent

;Event OnUpdate()


;DB04Script pDB04Script = pDB04 as DB04Script
;if pDB04Script.AmaundGreet == 0
	;if Game.GetPlayer().GetDistance(Self.GetRef()) <= 400
		;pDB04Script.AmaundGreet = 1
	;endif
;endif


;EndEvent


