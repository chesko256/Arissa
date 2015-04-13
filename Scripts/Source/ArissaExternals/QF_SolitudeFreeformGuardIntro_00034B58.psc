;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_SolitudeFreeformGuardIntro_00034B58 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guard2
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Guard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard1
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Guard1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(20)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_0 in script QF_SolitudeFreeformGuardIntro_00034B58
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FavorControlQuest  Auto  

MiscObject Property Gold  Auto  

GlobalVariable Property FavorReward  Auto  

Faction Property FavorCompletedFaction  Auto  

GlobalVariable Property FavorCost  Auto  

Faction Property Favor015QuestGiverFaction  Auto  

Faction Property Favor013QuestGiverFaction  Auto  
