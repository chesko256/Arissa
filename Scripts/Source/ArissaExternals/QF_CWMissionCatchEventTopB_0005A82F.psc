;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CWMissionCatchEventTopB_0005A82F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ref2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ref2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ref1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ref1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;THIS IS USED FOR DEBUGGING PURPOSES TO AUDIT THE CWMISSION STORY MANAGER EVENTS
; debug.trace("CWMissionCatchEventTopB: CWMissionStart event passing through story manager. Location:" + Alias_Location.GetLocation() + ", Ref1:" +  Alias_Ref1.GetReference() + ", Ref2:" + Alias_Ref2.GetReference())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
