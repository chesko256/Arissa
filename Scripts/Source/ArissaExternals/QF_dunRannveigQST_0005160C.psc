;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_dunRannveigQST_0005160C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Corpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Corpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaitingForPlayerHeadtrack
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitingForPlayerHeadtrack Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FallingCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FallingCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SneakTrigger01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SneakTrigger01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SneakTrigger02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SneakTrigger02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MoveSildOnDropMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MoveSildOnDropMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Assistant
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Assistant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Warlock
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Warlock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TalkingToPreyMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TalkingToPreyMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CageDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CageDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player bypassed the trap and is now behind
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Alias_FallingCorpse.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;The other bandit has fallen for the trap.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has fallen into the trap/cage
Alias_Warlock.GetReference().MoveTo(Alias_MoveSildOnDropMarker.GetReference())
Alias_CageDoor.GetReference().SetOpen(false)
debug.notification("Door Closed and Sild Moved")
Alias_Warlock.GetActorRef().SetAV("Aggression",0)
Alias_Warlock.GetActorRef().StopCombat()
dunRannSneakySCENE.Stop()
dunRannTrappedSCENE.Start()
Alias_SneakTrigger01.GetReference().Disable()
;Alias_SneakTrigger02.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Called when I need to have the warlock start combat with the player
;Alias_Warlock.GetActorRef().StartCombat(Game.GetPlayer())

Alias_Warlock.GetActorRef().SetAV("Aggression",2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Starting Stage
Alias_Warlock.GetActorRef().SetAV("Aggression",0)
Alias_Warlock.GetActorRef().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property dunRannTrappedSCENE  Auto  

scene Property dunRannSneakySCENE  Auto  
