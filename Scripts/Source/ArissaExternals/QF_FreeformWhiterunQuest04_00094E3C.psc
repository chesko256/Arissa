;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_FreeformWhiterunQuest04_00094E3C Extends Quest Hidden

;BEGIN ALIAS PROPERTY AmuletAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmuletAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AndursAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AndursAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmuletMarkerAlias
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AmuletMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted (10)
SetObjectiveDisplayed (20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed (10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_AndursAlias.GetReference().AddItem(Alias_AmuletAlias.GetReference())
Alias_AndursAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3) 
Game.GetPlayer().AddItem(pGold,15)
SetObjectiveCompleted (20)
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
UnRegisterForUpdate()
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


GlobalVariable Property pFavorReward  Auto  

MiscObject Property pGold  Auto  
