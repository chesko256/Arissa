Scriptname pDB08Script extends Quest Conditional 

int Property pGourmetDead  Auto  Conditional

int Property pBodyHidden  Auto  Conditional

int Property pGourmetThreatened  Auto  Conditional

int Property pGourmetScared  Auto  Conditional

int Property pHasPapers  Auto  Conditional

int Property pDoOnce Auto  Conditional

int Property pComplete Auto  Conditional

int Property pAntonDead Auto Conditional

int Property pAntonFlee Auto Conditional

int Property pFestusFirstTalk Auto Conditional

ReferenceAlias Property pPapers  Auto  

Quest Property DB01  Auto  

Quest Property DB02  Auto  

Quest Property DB03  Auto  

Quest Property DB04  Auto  

Quest Property DB04a  Auto  

Quest Property DB05  Auto  

Quest Property DB06  Auto  

Quest Property DB07  Auto  

Quest Property DarkBrotherhoodQuest  Auto 



;Event OnUpdate()

;If pDoOnce == 0
	;If Game.GetPlayer().GetItemCount(pPapers.GetReference().GetBaseObject()) == 1
		;If GetStage () >= 10
			;pHasPapers=1
			;pDoOnce=1
		;Endif
	;Endif
;Endif


;If pComplete == 0
	;If GetStage () >= 10
		;If GetStage () < 60
			;If pHasPapers==1
			 	;If pGourmetDead==1
					;debug.messagebox("Have both")
				  	;SetStage (40)
					;pComplete=1
				;Endif
			;Endif
		;Endif
	;Endif
;Endif


;EndEvent






int Property BodyTriggerCount  Auto  

function IncBodyTrigger()
   BodyTriggerCount = BodyTriggerCount + 1
endfunction

function DecBodyTrigger()
   BodyTriggerCount = BodyTriggerCount - 1
endfunction
