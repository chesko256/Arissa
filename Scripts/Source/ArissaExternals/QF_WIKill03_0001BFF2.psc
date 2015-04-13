;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_WIKill03_0001BFF2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadFriend
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DeadFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Killer
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Killer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WIKill03Script
Quest __temp = self as Quest
WIKill03Script kmyQuest = __temp as WIKill03Script
;END AUTOCAST
;BEGIN CODE
;DO NOT MAKE THIS A STARTUP STAGE... CALLED IN OnStoryKillActor event in WIKill03Script

;debug.messageBox("WIKill03 Started")
kmyquest.SetNextEventGlobals()			;lives in parent script WorldInteractionsScript
WICourierScript vWICourierScript = kmyquest.pWICourier as WICourierScript
; debug.trace("WIKill03 started, letter:" + Alias_Letter.GetReference())
vWICourierScript.addItemToContainer(Alias_Letter.GetReference())	;add the inheritance letter to the courier so he will deliver it
vWICourierScript.addItemToContainer(kmyquest.pGold001, kmyquest.pAward)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
