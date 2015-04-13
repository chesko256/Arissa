Scriptname CWFunctions extends Quest  
 
Quest Property CW  Auto  
{Pointer to CW quest}

Quest Property CWCampaign  Auto  
{Pointer to CWCampaign quest}

Quest Property CWSiegeWhiterunAttackQST Auto  
Quest Property CWSiegeWhiterunDefendQST Auto  


;## Scripts ##
;These will be assigned in the OnInit() block
CWScript Property CWs Auto hidden
CWCampaignScript Property CWCampaignS Auto hidden

Event OnInit()
	
	CWs = CW as CWScript
	CWCampaignS = CWCampaign as CWCampaignScript
	
; 	CWScript.Log("CWFunctions", " OnInit()")
	
EndEvent


ObjectReference Property CWSiegeWhiterunAttackStartMarker  Auto  

ObjectReference Property CWSiegeWhiterunDefenseStartRef  Auto  

ObjectReference Property COCMarkerWhiterun  Auto  


Keyword Property CWSiegeStart  Auto  

Location Property WhiterunLocation  Auto  

Quest Property CWsiegeMarkarthAttackQST  Auto  

ObjectReference Property CWSiegeMarkarthAttackStartMarker  Auto  

location Property MarkarthLocation  Auto  

location Property FortLocationForAttackForQuickStart Auto


Keyword Property CWFortSiegeStart  Auto  

Quest Property CWFortSiege  Auto

Keyword Property CWPrepareCityStart Auto

Quest Property CWPrepareCity  Auto

ObjectReference Property MS08AlikirWarrior1Ref  Auto  

ObjectReference Property MS08AlikirWarrior2Ref  Auto  

GlobalVariable Property GameHour  Auto  

Location Property RiftenLocation  Auto  

Quest Property CWSiegeRiftenAttackQst  Auto  

ObjectReference Property RiftenAttackStart  Auto  

GlobalVariable Property CWDebugOn  Auto  
