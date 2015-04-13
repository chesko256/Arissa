;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_DialogueFollower_000750BA Extends Quest Hidden

;BEGIN ALIAS PROPERTY Animal
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Animal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Follower
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Follower Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DialogueFollowerScript
Quest __temp = self as Quest
DialogueFollowerScript kmyQuest = __temp as DialogueFollowerScript
;END AUTOCAST
;BEGIN CODE
; TEST ONLY -- autodismiss follower

kmyquest.DismissFollower()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE HirelingCommentScript
Quest __temp = self as Quest
HirelingCommentScript kmyQuest = __temp as HirelingCommentScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Commented()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Recruit third blade
FreeformSkyhavenTempleA.RecruitBlade(Alias_Follower.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Recruit first blade
FreeformSkyhavenTempleA.RecruitBlade(Alias_Follower.GetActorRef() as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Recruit second blade
FreeformSkyhavenTempleA.RecruitBlade(Alias_Follower.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FreeformSkyHavenTempleAScript Property FreeformSkyhavenTempleA  Auto  
