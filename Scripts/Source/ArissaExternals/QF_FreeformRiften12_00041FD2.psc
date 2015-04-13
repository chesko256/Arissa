;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_FreeformRiften12_00041FD2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften12WujeetaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften12WujeetaAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player needs to heal Wujeeta
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Wujeeta Heals
Game.GetPlayer().AddItem(pReward,1)
Alias_FFRiften12WujeetaAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup
If Alias_FFRiften12WujeetaAlias.GetActorReference().GetActorValuePercentage("health") == 1
  Alias_FFRiften12WujeetaAlias.GetActorReference().DamageActorValue("health", 5)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest Completed, Wujeeta Healed
pFFRiften20Quest.SetStage(10)
Alias_FFRiften12WujeetaAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pReward  Auto  

Quest Property pFFRiften20Quest  Auto

FFR12QuestScript Property pFFR12QS Auto

FFRiftenThaneQuestScript Property pFFRTQS Auto

GlobalVariable Property pThaneCount  Auto  
