;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformRiften08_0005331B Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften08ChestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften08ChestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften08BrandSheiAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften08BrandSheiAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften08BookAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FFRiften08BookAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest Completed
CompleteAllObjectives()
Game.GetPlayer().Additem(pKey,1)
Game.GetPlayer().RemoveItem(pBook,1)
Alias_FFRiften08BrandSheiAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
Stop()
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
;Book discovered
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
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
;Quest Taken
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property pKey  Auto  

Book Property pBook  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  
