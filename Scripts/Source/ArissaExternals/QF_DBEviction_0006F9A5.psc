;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_DBEviction_0006F9A5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NazirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NazirAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBInitiate1Alias.GetActorReference().SetPlayerTeammate(False)
DBInitiate2Alias.GetActorReference().SetPlayerTeammate(False)
CiceroAlias.GetActorReference().SetPlayerTeammate(False)
PlayerFollowerCount.SetValue(0)
DBScript.CiceroFollower = 0
DBScript.CiceroState = 1
DBScript.Initiate1Follower = 0
DBScript.Initiate1State = 1
DBScript.Initiate2Follower = 0
DBScript.Initiate2State = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DBEvictionQuestScript Script = EvictionQuest as DBEvictionQuestScript
Script.DBEvicted = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
DBEvictionQuestScript Script = EvictionQuest as DBEvictionQuestScript
Script.DBEvicted = 0
SetObjectiveCompleted(10)
SuspensionQuest.Stop()
Utility.Wait(5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property EvictionQuest  Auto  

Quest Property SuspensionQuest  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

GlobalVariable Property PlayerFollowerCount  Auto  
ObjectReference Property DBInitiate1  Auto  

ReferenceAlias Property DBInitiate1Alias  Auto  

ReferenceAlias Property DBInitiate2Alias  Auto  

ReferenceAlias Property CiceroAlias  Auto  
