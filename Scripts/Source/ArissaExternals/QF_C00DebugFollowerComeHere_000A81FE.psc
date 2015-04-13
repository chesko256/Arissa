;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_C00DebugFollowerComeHere_000A81FE Extends Quest Hidden

;BEGIN ALIAS PROPERTY Follower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Follower Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if (Alias_Follower.GetRef() != None)
    Alias_Follower.GetRef().MoveTo(Game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
