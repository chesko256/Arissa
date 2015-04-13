;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_FreeformSkyHavenTempleA_000E38C9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blade03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blade03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blade01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blade01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blade02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blade02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player has asked Esbern about the Dragon Lairs
SetObjectiveCompleted(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE FreeformSkyHavenTempleAScript
Quest __temp = self as Quest
FreeformSkyHavenTempleAScript kmyQuest = __temp as FreeformSkyHavenTempleAScript
;END AUTOCAST
;BEGIN CODE
;second follower brought
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

; moved to alias script
;kmyquest.EquipBlade(Alias_Blade02.GetActorRef())

; make sure out of potential hireling faction to get rid of hiring dialogue
Alias_Blade02.GetActorRef().RemoveFromFaction(PotentialHireling)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player can bring followers to Delphine
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE FreeformSkyHavenTempleAScript
Quest __temp = self as Quest
FreeformSkyHavenTempleAScript kmyQuest = __temp as FreeformSkyHavenTempleAScript
;END AUTOCAST
;BEGIN CODE
;No more blades available
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

; moved to alias script
;kmyquest.EquipBlade(Alias_Blade03.GetActorRef())

; make sure out of potential hireling faction to get rid of hiring dialogue
Alias_Blade03.GetActorRef().RemoveFromFaction(PotentialHireling)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;First follower brought
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)

BladesOathScene01.Start()
; make sure out of potential hireling faction to get rid of hiring dialogue
Alias_Blade01.GetActorRef().RemoveFromFaction(PotentialHireling)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Outfit Property ArmorBladesOutfit  Auto  

DialogueFollowerScript Property DialogueFollower  Auto  

Scene Property BladesOathScene01  Auto  

Faction Property PotentialHireling  Auto  
