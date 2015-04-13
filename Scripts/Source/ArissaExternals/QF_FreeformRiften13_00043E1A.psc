;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_FreeformRiften13_00043E1A Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften13Andurs
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften13Andurs Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften13DaggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften13DaggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften13AlessandraAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften13AlessandraAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player accepts pilgrimage and gets dagger
SetObjectiveDisplayed(10,1)
Game.GetPlayer().AddItem(Alias_FFRiften13DaggerAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player arrives at Andurs and leaves dagger
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Game.GetPlayer().RemoveItem(Alias_FFRiften13DaggerAlias.GetRef())
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
;Quest Completed
Game.GetPlayer().AddItem(pReward,1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Alias_FFRiften13AlessandraAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pReward  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  
