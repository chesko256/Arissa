;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_dunBrokenOarQST_0001E437 Extends Quest Hidden

;BEGIN ALIAS PROPERTY chattyNPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyNPC2Start
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC2Start Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyNPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DuringQuestNPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DuringQuestNPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaptainHargar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaptainHargar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DuringQuestNPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DuringQuestNPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY chattyNPC1Start
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_chattyNPC1Start Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DunQuestScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Simulates the post dungeon during MS07
DunBrokenOarRespawnEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(Alias_ChattyNpc1.GetReference()).Moveto(Alias_ChattyNpc1Start.GetReference())
(Alias_ChattyNpc2.GetReference()).Moveto(Alias_ChattyNpc2Start.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Gets set when Hargar Dies.  So that Nate can know whether or not to enable the extra baddies.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Simulates the normal dungeon during MS07
DunBrokenOarLootEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property dunQuestScene  Auto  

objectreference Property dunBrokenOarLootEnableMarker  Auto  

objectreference Property dunBrokenOarRespawnEnableMarker  Auto  

Scene Property dunBrokenOarTalky01  Auto  
