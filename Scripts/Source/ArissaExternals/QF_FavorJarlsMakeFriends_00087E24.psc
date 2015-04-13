;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_FavorJarlsMakeFriends_00087E24 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for Eastmarch
SetObjectiveDisplayed(50, 1)

;Player already has all the friends
If kmyquest.FriendsCountEastmarch.value >= kmyquest.FriendsTotalMajorHold.value
  SetStage(55)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Player has enough friends in the Rift
SetObjectiveCompleted(20, 1)

; Player also owns the house
If Favor251.GetStageDone(15)
  Favor251.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; Player has enough friends in Hjaalmarch
SetObjectiveCompleted(90, 1)

Favor258.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; Player has enough friends in Whiterun
SetObjectiveCompleted(40, 1)

; Player also owns the house
If Favor253.GetStageDone(15)
  Favor253.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for Hjaalmrach
SetObjectiveDisplayed(60, 1)

;Player already has all the friends
If kmyquest.FriendsCountHjaalmarch.value >= kmyquest.FriendsTotalMinorHold.value
  SetStage(65)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Player has enough friends in Haafingar
SetObjectiveCompleted(20, 1)

; Player also owns the house
If Favor252.GetStageDone(15)
  Favor252.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for Falkreath
SetObjectiveDisplayed(90, 1)

;Player already has all the friends
If kmyquest.FriendsCountFalkreath.value >= kmyquest.FriendsTotalMinorHold.value
  SetStage(95)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for Winterhold
SetObjectiveDisplayed(80, 1)

;Player already has all the friends
If kmyquest.FriendsCountWinterhold.value >= kmyquest.FriendsTotalMinorHold.value
  SetStage(85)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Player has enough friends in Eastmarch
SetObjectiveCompleted(50, 1)

; Player also owns the house
If Favor254.GetStageDone(15)
  Favor254.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Player has enough friends in the Reach
SetObjectiveCompleted(10, 1)

; Player also owns the house
If Favor250.GetStageDone(15)
  Favor250.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for the Pale
SetObjectiveDisplayed(70, 1)

;Player already has all the friends
If kmyquest.FriendsCountPale.value >= kmyquest.FriendsTotalMinorHold.value
  SetStage(75)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; Player has enough friends in Hjaalmarch
SetObjectiveCompleted(80, 1)

Favor257.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; Player has enough friends in Hjaalmarch
SetObjectiveCompleted(70, 1)

Favor256.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for the Reach
SetObjectiveDisplayed(10, 1)

;Player already has all the friends
If kmyquest.FriendsCountReach.value >= kmyquest.FriendsTotalMajorHold.value
  SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Player has enough friends in Hjaalmarch
SetObjectiveCompleted(60, 1)

Favor255.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for the Rift
SetObjectiveDisplayed(20, 1)

;Player already has all the friends
If kmyquest.FriendsCountRift.value >= kmyquest.FriendsTotalMajorHold.value
  SetStage(25)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for Haafingar
SetObjectiveDisplayed(30, 1)

;Player already has all the friends
If kmyquest.FriendsCountHaafingar.value >= kmyquest.FriendsTotalMajorHold.value
  SetStage(35)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE FavorJarlsMakeFriendsScript
Quest __temp = self as Quest
FavorJarlsMakeFriendsScript kmyQuest = __temp as FavorJarlsMakeFriendsScript
;END AUTOCAST
;BEGIN CODE
;Start the quest for Whiterun
SetObjectiveDisplayed(40, 1)

;Player already has all the friends
If kmyquest.FriendsCountWhiterun.value >= kmyquest.FriendsTotalMajorHold.value
  SetStage(45)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FriendsCountReach  Auto  

HousePurchaseScript Property HousePurchase  Auto  

Quest Property Favor250  Auto  

Quest Property Favor255  Auto  

Quest Property Favor251  Auto  

Quest Property Favor252  Auto  

Quest Property Favor253  Auto  

Quest Property Favor254  Auto  

Quest Property Favor256  Auto  

Quest Property Favor257  Auto  

Quest Property Favor258  Auto  
