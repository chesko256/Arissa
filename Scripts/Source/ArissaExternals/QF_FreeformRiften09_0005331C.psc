;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_FreeformRiften09_0005331C Extends Quest Hidden

;BEGIN ALIAS PROPERTY FFRiften09Mjoll
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften09Mjoll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FFRiften09Grimsever
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_FFRiften09Grimsever Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Grimsever found
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player was told of Grimsever's existence
SetObjectiveDisplayed(10,1)
pMap.AddToMap()
if Game.GetPlayer().GetItemCount(Alias_FFRiften09Grimsever.GetRef()) >= 1
Setstage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player gains Mjoll as a follower
Alias_FFRiften09Mjoll.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Game.GetPlayer().RemoveItem(pFFGS,1)
Alias_FFRiften09Mjoll.GetActorRef().Additem(pFFGS,1)
pThaneCount.Value += 1
pFFRTQS.ThaneCheck()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start-Up
pFFR09GrimseverRef.Enable()
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

Weapon Property pFFGS  Auto  

ObjectReference Property pMap  Auto  

FFRiftenThaneQuestScript Property pFFRTQS  Auto  

GlobalVariable Property pThaneCount  Auto  

ObjectReference Property pFFR09GrimseverRef  Auto  
