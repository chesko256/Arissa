Scriptname pMuiriScript extends ReferenceAlias Conditional  

Quest Property pDB03  Auto  
ObjectReference Property pMuiriMarker  Auto  
int Property pMuiriStand  Auto Conditional 
ReferenceAlias Property MuiriAlias  Auto  


;Event OnUpdate()

;DB03Script pDB03Script = pDB03 as DB03Script

;if pMuiriStand == 0
	;if pDB03Script.MuiriQuestLocation == 1
		;if MuiriAlias.GetReference().GetDistance(pMuiriMarker) <= 400
			;pDB03Script.MuiriQuestLocation = 2
			;pMuiriStand = 1
		;endif
	;endif
;endif

;EndEvent



