;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_CWCampaignObj_00026F45 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FieldCO
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_FieldCO Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CampaignHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CampaignHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CampaignStartMarker
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_CampaignStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionLeader
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_FactionLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE REFERENCEALIAS
REFERENCEALIAS Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CWCampaignObjScript
Quest __temp = self as Quest
CWCampaignObjScript kmyQuest = __temp as CWCampaignObjScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(20)
	setStage(200)
elseif GetStageDone(30)
	setStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CWCampaignObjScript
Quest __temp = self as Quest
CWCampaignObjScript kmyQuest = __temp as CWCampaignObjScript
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CWCampaignObjScript
Quest __temp = self as Quest
CWCampaignObjScript kmyQuest = __temp as CWCampaignObjScript
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CWCampaignObjScript
Quest __temp = self as Quest
CWCampaignObjScript kmyQuest = __temp as CWCampaignObjScript
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(20)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CWCampaignObjScript
Quest __temp = self as Quest
CWCampaignObjScript kmyQuest = __temp as CWCampaignObjScript
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(30)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CWCampaignObjScript
Quest __temp = self as Quest
CWCampaignObjScript kmyQuest = __temp as CWCampaignObjScript
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(15)
setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectiveDisplayed(30) ;pop it again as a reminder
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CWCampaignObjScript
Quest __temp = self as Quest
CWCampaignObjScript kmyQuest = __temp as CWCampaignObjScript
;END AUTOCAST
;BEGIN CODE
;Alias_FactionLeader.ForceRefTo((kmyquest.CW as CWScript).AliasFactionLeader.GetReference())
;Alias_FieldCO.ForceRefTo((kmyquest.CWCampaign as CWCampaignScript).FieldCO.GetReference())
setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE QF_CWCampaignObj_00026F45
Quest __temp = self as Quest
QF_CWCampaignObj_00026F45 kmyQuest = __temp as QF_CWCampaignObj_00026F45
;END AUTOCAST
;BEGIN CODE
;Called by CWEscapeCity when it notices the player has left the area
;Fail objective

setObjectiveFailed(50)
setObjectiveDisplayed(30) ;pop it again as a reminder
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
setObjectiveCompleted(10)
setObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
