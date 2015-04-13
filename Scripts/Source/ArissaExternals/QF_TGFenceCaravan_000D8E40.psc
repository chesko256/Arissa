;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_TGFenceCaravan_000D8E40 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGFCToniliaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFCToniliaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFCSatchelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFCSatchelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGFCRisaadAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGFCRisaadAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Quest Completed - Initiate Fences at all 3 Caravans
Game.GetPlayer().AddItem(pReward,1)
pTGFencesQuest.SetStage(60)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player needs to bring Moon Sugar to Ri'saad
SetObjectiveDisplayed(10,1)
Game.GetPlayer().AddItem(Alias_TGFCSatchelAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player gives Moon Sugar to Ri'saad and establishes deal
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Game.GetPlayer().RemoveItem(Alias_TGFCSatchelAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Startup (Initiated when Stage Three of Guild is Reached)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTGFencesQuest  Auto  

LeveledItem Property pReward  Auto  
