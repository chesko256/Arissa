;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_FreeformRiften14_00043E25 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften14WylandriahAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften14WylandriahAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften14Satchel02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften14Satchel02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften14Satchel01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften14Satchel01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften14Satchel03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften14Satchel03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften14SpoonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften14SpoonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften14IngotAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften14IngotAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften14SoulGemAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften14SoulGemAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest Completed
Game.GetPlayer().RemoveItem(Alias_FFRiften14SpoonAlias.GetRef())
Game.GetPlayer().RemoveItem(Alias_FFRiften14IngotAlias.GetRef())
Game.GetPlayer().RemoveItem(Alias_FFRiften14SoulGemAlias.GetRef())
Alias_FFRiften14Satchel01Alias.GetRef().Disable()
Alias_FFRiften14Satchel02Alias.GetRef().Disable()
Alias_FFRiften14Satchel03Alias.GetRef().Disable()
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
Alias_FFRiften14WylandriahAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Bring all items to Wylandriah
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
SetObjectiveDisplayed(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Got Wylandriah's Soul Gem
SetObjectiveCompleted(30,1)
pCount.Value += 1

if pCount.Value >= 3
setstage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Got Wylandriah's Ingot
SetObjectiveCompleted(20,1)
pCount.Value += 1

if pCount.Value >= 3
setstage(60)
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Got Wylandriah's Spoon
SetObjectiveCompleted(10,1)
pCount.Value += 1

if pCount.Value >= 3
setstage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pReward  Auto  

GlobalVariable Property pCount  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  
