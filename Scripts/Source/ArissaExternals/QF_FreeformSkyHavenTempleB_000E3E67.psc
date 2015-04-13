;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_FreeformSkyHavenTempleB_000E3E67 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Blade01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blade01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blade03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blade03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkyhavenCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkyhavenCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonLair
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DragonLair Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blade02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blade02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationEdgeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationEdgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Blades move to dragon lair on unload

;Make sure you're not the player's current follower before moving
If Alias_Blade01.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
  Alias_Blade01.GetActorRef().MoveTo(Alias_LocationEdgeMarker.GetRef())
EndIf

If Alias_Blade02.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
  Alias_Blade02.GetActorRef().MoveTo(Alias_LocationEdgeMarker.GetRef())
EndIf

If Alias_Blade03.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
  Alias_Blade03.GetActorRef().MoveTo(Alias_LocationEdgeMarker.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Dragon is dead
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;clear the objective from Delphine
FreeformSkyhavenTempleA.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;quest completes
SetObjectiveCompleted(20, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Blades move back home on unload

;Make sure you're not the player's current follower before moving
If Alias_Blade01.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
  Alias_Blade01.GetActorRef().MoveTo(Alias_SkyhavenCenter.GetRef())
EndIf

If Alias_Blade02.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
  Alias_Blade02.GetActorRef().MoveTo(Alias_SkyhavenCenter.GetRef())
EndIf

If Alias_Blade03.GetActorRef().IsInFaction(CurrentFollowerFaction) == 0
  Alias_Blade03.GetActorRef().MoveTo(Alias_SkyhavenCenter.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player is told to hunt dragon
SetObjectiveDisplayed(10, 1)

Alias_MapMarker.GetRef().AddtoMap()

;Make sure we have all the Blades ready to go
Alias_Blade01.ForceRefTo(Blade01A.GetActorRef())
Alias_Blade02.ForceRefTo(Blade02A.GetActorRef())
Alias_Blade03.ForceRefTo(Blade03A.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Outfit Property ArmorBladesOutfit  Auto  

DialogueFollowerScript Property DialogueFollower  Auto  

Quest Property FreeformSkyHavenTempleA  Auto  

Faction Property CurrentFollowerFaction  Auto  

ReferenceAlias Property Blade01A  Auto  

ReferenceAlias Property Blade02A  Auto  
ReferenceAlias Property Blade03A  Auto  
