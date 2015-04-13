;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_DA09ChangeLocation_00081C59 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DA09ChangeLocationScript
Quest __temp = self as Quest
DA09ChangeLocationScript kmyQuest = __temp as DA09ChangeLocationScript
;END AUTOCAST
;BEGIN CODE
; debug.trace("DA09ChangeLocation adding DA09 Gem to boss container:" + Alias_BossContainer.GetReference() + " in location: " + Alias_Location.GetLocation() )
Alias_BossContainer.GetReference().AddItem(Alias_Gem.GetReference())

; debug.trace("DA09ChangeLocation forcing DA09 GemContainer  alias to BossContainer, and GemContainerLocation to Location, and GemMapMarker to MapMarker" )
kmyquest.DA09GemContainerLocation.ForceLocationTo(Alias_Location.GetLocation())
kmyquest.DA09GemContainer.ForceRefTo(Alias_BossContainer.GetReference())
kmyquest.DA09GemMapMarker.ForceRefTo(Alias_MapMarker.GetReference())

; debug.trace("DA09ChangeLocation calling stop() on itself")
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
