;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_SolitudeFreeform03_000C7D42 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DeadPerson
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DeadPerson Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Item Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Target
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Target Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; player completes the favor successfully
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
If GetStageDone(40) == 0
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

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(30)
Setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
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
