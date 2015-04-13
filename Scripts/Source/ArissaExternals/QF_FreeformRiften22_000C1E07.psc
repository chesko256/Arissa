;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformRiften22_000C1E07 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften22SapphireAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften22SapphireAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften22Shadr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften22Shadr Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Go speak to Sapphire and satisfy the debt
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Return to Shadr
if pGlobal.Value == 1
Game.GetPlayer().AddItem(pPayoff,1)
endif
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup!
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest Completed - Reward
if pGlobal.Value == 0
Game.GetPlayer().AddItem(pReward,1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Alias_FFRiften22Shadr.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
endif
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pPayoff  Auto  

GlobalVariable Property pGlobal  Auto  

LeveledItem Property pReward  Auto  

GlobalVariable Property pThaneCount  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto
