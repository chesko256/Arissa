;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_MQ105Ustengrav_000713DC Extends Quest Hidden

;BEGIN ALIAS PROPERTY MysteriousNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MysteriousNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SleepingGiantRoomMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SleepingGiantRoomMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arngeir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arngeir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HornActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HornActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wulfgar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wulfgar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WulfgarWord
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WulfgarWord Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutroMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OutroMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setObjectiveCompleted(50)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player has read the note
setObjectiveFailed(10) ; ? failed or completed?
setObjectiveCompleted(15)
setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
setObjectiveCompleted(40)
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
setObjectiveCompleted(30)
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + " stage 10 start")
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
setObjectiveFailed(10) ; ? failed or completed?
setObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
setObjectiveCompleted(20)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
