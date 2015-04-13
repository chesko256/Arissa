;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_FreeformRiften18_0005B3A5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften18MadesiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften18MadesiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFR18PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFR18PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;List of items assigned
pFFR18QS.GemCounted()
pFFR18QS.TuskCounted()
pFFR18QS.OreCounted()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Quest Completed
Game.GetPlayer().AddItem(pNecklace,1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Alias_FFRiften18MadesiAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Brought a Mammoth Tusk
SetObjectiveCompleted(25,1)
Game.GetPlayer().RemoveItem(pTusk,1)
Game.GetPlayer().AddItem(pGold,100)
pCount.Value += 1

if pCount.Value >= 3
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;All items gathered!
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Brought a chunks of Gold Ore
SetObjectiveCompleted(35,1)
Game.GetPlayer().RemoveItem(pGoldOre,1)
Game.GetPlayer().AddItem(pGold,100)
pCount.Value += 1

if pCount.Value >= 3
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Brought 2 Flawless Sapphires
SetObjectiveCompleted(15,1)
Game.GetPlayer().RemoveItem(pSapphire,2)
Game.GetPlayer().AddItem(pGold,200)
pCount.Value += 1

if pCount.Value >= 3
SetStage(60)
endif
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

FFR18QuestScript Property pFFR18QS  Auto  
