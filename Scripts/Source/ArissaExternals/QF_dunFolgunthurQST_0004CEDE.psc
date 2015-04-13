;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_dunFolgunthurQST_0004CEDE Extends Quest Hidden

;BEGIN ALIAS PROPERTY MikrulAlly2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MikrulAlly2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mikrul
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Mikrul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MikrulAlly1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MikrulAlly1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MikrulAlly3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MikrulAlly3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Tracking stage. Player has taken the amulet fragment.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property dunRagnQST  Auto  

scene Property dunFolgunthurIntroScn  Auto  

scene Property dunFolgunthurDisagreeScn  Auto  

scene Property dunFolgunthurDisagreeLeftScn  Auto  

scene Property dunFolgunthurForceGettingScn  Auto  

scene Property dunFolgunthurAgreeScn  Auto  

scene Property dunFolgunthurAmbushScn  Auto  

Faction Property BanditFaction  Auto  

Faction Property PlayerFaction  Auto  

Scene Property dunFolgunthurLeaveScene  Auto  

Scene Property dunFolgunthurAttackedScene  Auto  

Faction Property HunterFaction  Auto  

Quest Property dunRagnQuest  Auto  
