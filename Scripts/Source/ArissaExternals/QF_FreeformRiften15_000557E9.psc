;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_FreeformRiften15_000557E9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften15BolliAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften15BolliAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften15AgreementAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften15AgreementAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften15Kleppr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften15Kleppr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften15Holding
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften15Holding Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player is given trade agreement letter
Game.GetPlayer().AddItem(Alias_FFRiften15AgreementAlias.GetRef())
SetObjectiveDisplayed(10,1)
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
;Quest Completed
Game.GetPlayer().RemoveItem(Alias_FFRiften15AgreementAlias.GetRef())
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Alias_FFRiften15BolliAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pReward  Auto  

GlobalVariable Property pCount  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  
