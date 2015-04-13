;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_TG04EECHandler_001007FC Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG04EECOrthas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG04EECOrthas Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Sons Ownership Solitude
pSonsEnabler.Enable()
pImperialEnabler.Disable()
pQuestEnabler.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;TG04 is Running!
pQuestEnabler.Enable()
pSonsEnabler.Disable()
pImperialEnabler.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Imperial Ownership Solitude
pImperialEnabler.Enable()
pSonsEnabler.Disable()
pQuestEnabler.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pImperialEnabler  Auto  

ObjectReference Property pSonsEnabler  Auto  

ObjectReference Property pQuestEnabler  Auto  
