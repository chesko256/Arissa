;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_SolitudeFreeform01_000E8BD7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(20)

Setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
If GetStageDone(30) == 0
  FailAllObjectives()
EndIf

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; player completes the favor successfully
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
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
