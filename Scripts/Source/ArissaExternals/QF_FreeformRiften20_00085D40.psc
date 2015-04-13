;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_FreeformRiften20_00085D40 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften20SatchelAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20SatchelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20SarthisSpawnMarkerAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20SarthisSpawnMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20OriniAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20OriniAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20NoteAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20NoteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20OriniSpawnMarkerAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20OriniSpawnMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20MavenJarlAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20MavenJarlAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20SourceNoteAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20SourceNoteAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20SarthisAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20SarthisAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20Wujeeta
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20Wujeeta Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften20LailaJarlAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften20LailaJarlAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Sarthis is Dead, get the Source Info
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Quest Completed - Start Freeform Riften 01
pFFR01.SetStage(10)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Speak to the Jarl
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Kill Sarthis
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Get Warehouse Location from Wujeeta
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Enter Warehouse (Trigger)
Game.GetPlayer().AddItem(pKey,1)
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pCount  Auto  

MiscObject Property pGold  Auto  

MiscObject Property pGoldOre  Auto  

MiscObject Property pSapphire  Auto  

MiscObject Property pTusk  Auto  

LeveledItem Property pNecklace  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  

Key Property pKey  Auto  

Quest Property pFFR01  Auto  
