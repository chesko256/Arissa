;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CWMissionCatchEventBottomB_0005A830 Extends Quest Hidden

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
; debug.trace("CWMissionCatchEventBottomB: WARNING a CWMissionStart event wasn't caught by any quest!!! Location:" + Alias_Location.GetLocation() + ", Ref1:" +  Alias_Ref1.GetReference() + ", Ref2:" + Alias_Ref2.GetReference(), 2)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
