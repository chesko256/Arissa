;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 50
Scriptname QF_MS03_0001DA3C Extends Quest Hidden

;BEGIN ALIAS PROPERTY MS03Grane
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS03Grane Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StashKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StashKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LouisLetrush
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LouisLetrush Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SibbiBlackBriar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SibbiBlackBriar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MavenBlackBriar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MavenBlackBriar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS03LouisLetrushMeetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS03LouisLetrushMeetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS03JailSibbiMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS03JailSibbiMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS03IdentityPapers
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS03IdentityPapers Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS03HiddenStash
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS03HiddenStash Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BlackBriarLodgeMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BlackBriarLodgeMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
setObjectiveDisplayed (20)
Alias_MS03HiddenStash.GetRef().Enable()
Alias_sibbiblackbriar.GetRef().removeitem(alias_stashkey.GetRef())
Game.GetPlayer().additem(alias_stashkey.GetRef())
Setstage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player has heard Louis' offer. (obj 10 stop, obj 20 start; obj 25 start if available)
(Alias_SibbiBlackBriar.GetRef()).moveto(Alias_MS03JailSibbiMarkerAlias.getref())
setObjectiveCompleted (5)
setObjectiveDisplayed (10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
AchievementsQuest.IncSideQuests()
setObjectiveCompleted(50)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;setObjectiveCompleted(50)
Alias_MS03Grane.GetRef().SetActorOwner(Alias_LouisLetrush.GetActorRef().GetActorBase())
Game.GetPlayer().RemoveItem(Alias_MS03IdentityPapers.GetRef())
Game.GetPlayer().AddItem(lvlQuestReward03Large)
Alias_LouisLetrush.GetActorRef().EvaluatePackage()
setstage(275)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;setObjectiveCompleted(50)
Alias_MS03Grane.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())
;Game.GetPlayer().RemoveItem(Alias_MS03IdentityPapers.GetRef())
Game.GetPlayer().AddItem(lvlQuestReward03Large)
setstage(275)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has been hailed by Louis Letrush, who offers work. (obj 10 start)
setObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
Alias_MS03Grane.GetRef().Enable()
Alias_MS03IdentityPapers.GetRef().Enable()
setObjectiveCompleted (10)
setObjectiveDisplayed (25)
Alias_MS03HiddenStash.GetRef().Enable()
Alias_BlackBriarLodgeMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
setObjectiveCompleted (25)
setObjectiveDisplayed (30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
;Sibbi has explained about the horse not being his.
Alias_LouisLetrush.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE MS03Script
Quest __temp = self as Quest
MS03Script kmyQuest = __temp as MS03Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted (25)
setObjectiveCompleted (30)
setObjectiveDisplayed (50)
Alias_LouisLetrush.GetRef().Enable()
Alias_LouisLetrush.GetRef().Moveto(Alias_MS03LouisLetrushMeetMarker.GetRef())

If (KmyQuest.WorkingWithMaven) == 1
     ;Alias_LouisLetrush.GetActorRef().AddItem(MS03MavenBlackBriarNote,1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;setObjectiveCompleted(50)
;Alias_MS03Grane.GetRef().SetActorOwner(Alias_LouisLetrush.GetActorRef().GetActorBase())
;Game.GetPlayer().RemoveItem(Alias_MS03IdentityPapers.GetRef())
Alias_MS03Grane.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())
Alias_LouisLetrush.GetActorRef().AddItem(lvlQuestReward03Large)
Alias_LouisLetrush.GetActorRef().GetActorBase().SetEssential(False)
setstage(275)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MS03LouisEntrance  Auto  

Message Property TempWarning  Auto  

Scene Property LouisEscapeScene  Auto  

Scene Property EndSceneLouis  Auto  

Scene Property EndSceneMaven  Auto  

ObjectReference Property MS03NearHideoutMarker  Auto  

Scene Property EndSceneTG  Auto  

MiscObject Property Gold001  Auto  

Book Property MS03MAvenBlackBriarNote  Auto  

AchievementsScript Property AchievementsQuest Auto

LeveledItem Property LvlQuestReward03Large  Auto  
