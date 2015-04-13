Scriptname FreeformWhiterunQuest02Script extends Quest  

int Property pDoOnce  Auto  
ReferenceAlias Property pAle  Auto  

;Event OnUpdate()

;If pDoOnce == 0
	;If Game.GetPlayer().GetItemCount(pAle.GetReference().GetBaseObject()) == 1
		;If GetStage () >= 10
			;SetStage (20)
			;pDoOnce=1
		;Endif
	;Endif
;Endif

;EndEvent

