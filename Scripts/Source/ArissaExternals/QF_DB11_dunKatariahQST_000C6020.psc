;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_DB11_dunKatariahQST_000C6020 Extends Quest Hidden

;BEGIN ALIAS PROPERTY HoldSailor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldSailor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldSailorFriend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldSailorFriend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Trigger mid-deck conversation.
; Debug.Trace("Stage 20 set.")
Alias_Guard01.GetActorRef().Enable()
Alias_Guard02.GetActorRef().Enable()
Alias_Guard01.GetActorRef().Activate(Game.GetPlayer())
Alias_Guard02.GetActorRef().Activate(Game.GetPlayer())
MidDeckScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Sailor scene complete.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player enters the Emperor's Quarters.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Sailor scene midpoint continue.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player kills the Emperor.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Katariah sailor scene starts.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerFaction  Auto  

Faction Property dunKatariahCrewFaction  Auto  

Scene Property MidDeckScene  Auto  
