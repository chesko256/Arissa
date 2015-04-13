;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_FreeformRiften07_0005331A Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften07Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften07Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften07MariseAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften07MariseAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player accepted Quest
pFFR07QS.TeethCounted()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Completed
Game.GetPlayer().RemoveItem(pTeeth,5)
Game.GetPlayer().AddItem(pSpelltomeList,1)
Game.GetPlayer().AddItem(pPheasantRaw,5)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Alias_FFRiften07MariseAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;StartUp
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property pTeeth  Auto  

LeveledItem Property pSpelltomeList  Auto  

Potion Property pPheasantRaw  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  

FFR07QuestScript Property pFFR07QS  Auto  
