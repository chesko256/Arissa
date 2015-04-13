;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_FreeformRiften06_00053318 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften06PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften06PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften06TalenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften06TalenAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Gem found and brought back
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Game.GetPlayer().RemoveItem(pFFRiften06Amethyst,3)
Game.GetPlayer().AddItem(pLoot,1)
Alias_FFRiften06TalenAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest given + StartUp
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
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
;Get the gems for Talen-Jei
pFFR06QS.GemsCounted()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pFFRiften06Amethyst  Auto  
LeveledItem Property pLoot  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  

FFR06QuestScript Property pFFR06QS  Auto  
