;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_FreeformRiften10_0005331D Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften10Balimund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften10Balimund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften10PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften10PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Balimund asks Player to retrieve Fire Salts for his forge
pFFR10QS.SaltCounted()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player provided Fire Salts to Balimund
Game.GetPlayer().RemoveItem(pFFRiften10Firesalt,10)
Game.GetPlayer().AddItem(pFFRiften10Gold)
Alias_FFRiften10Balimund.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start-Up
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property pFFRiften10Firesalt  Auto  

LeveledItem Property pFFRiften10Gold  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  

FFR10QuestScript Property pFFR10QS  Auto  
