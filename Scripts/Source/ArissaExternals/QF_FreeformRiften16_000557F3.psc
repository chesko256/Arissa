;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_FreeformRiften16_000557F3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften16Holding
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften16Holding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften16Sword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften16Sword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften16BalimundAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften16BalimundAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften16HarraldAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften16HarraldAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
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
;Player is given quest to get sword
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
Game.GetPlayer().RemoveItem(Alias_FFRiften16Sword.GetRef())
Alias_FFRiften16HarraldAlias.GetActorRef().AddItem(Alias_FFRiften16Sword.GetRef())
Alias_FFRiften16HarraldAlias.GetActorRef().EquipItem(Alias_FFRiften16Sword.GetRef())
Game.GetPlayer().AddItem(pReward)
Game.GetPlayer().AddItem(pReward)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Sword Picked up from Blacksmith
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Game.GetPlayer().AddItem(Alias_FFRiften16Sword.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pReward  Auto  

GlobalVariable Property pCount  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  
