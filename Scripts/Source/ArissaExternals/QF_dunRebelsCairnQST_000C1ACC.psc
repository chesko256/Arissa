;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_dunRebelsCairnQST_000C1ACC Extends Quest Hidden

;BEGIN ALIAS PROPERTY RebelsCairnSwordSlot
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RebelsCairnSwordSlot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedEagleSword
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RedEagleSword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedEagleBoss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RedEagleBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedEagleRedoubtNote
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RedEagleRedoubtNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedEagleRedoubtEntrance
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_RedEagleRedoubtEntrance Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player uses the sword in Rebel's Cairn.
SetObjectiveCompleted(10)
SetObjectiveCompleted(22)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player reads the book at Red Eagle Redoubt.
if (GetStageDone(21))
   SetStage(22)
Else
   SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has the sword, and has learned about Rebel's Cairn.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(22)
RebelsCairnMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player reads the Legend of Red Eagle (now a general-use book).
if (GetStageDone(21))
   SetStage(22)
Else
   SetObjectiveDisplayed(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player acquires Red Eagle's Fury
if (GetStageDone(10))
   SetStage(22)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RebelsCairnMapMarker  Auto  
