;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_FreeformRiften05_00053309 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFR05Dinya
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFR05Dinya Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player is Done - Dinya has blessed Player
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
pThaneCount.Value += 1
Alias_FFR05Dinya.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Handler Stage when Player gives a pamphlet
ModObjectiveGlobal(1, pFF05Global, 10)
Game.GetPlayer().RemoveItem(pFF05Pamphlet,1)

if pFF05Global.Value >= 20
pFFRiften05Quest.SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Dinya gives the Player the pamphlets to deliver
SetObjectiveDisplayed(10,1)
Game.GetPlayer().AddItem(pFF05Pamphlet,20)
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

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player has preached the gospel to the requisite number of people in Riften
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property pFF05Pamphlet  Auto  

GlobalVariable Property pFF05Global  Auto  

Quest Property pFFRiften05Quest  Auto  

LeveledItem Property pReward  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  
