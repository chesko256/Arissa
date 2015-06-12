;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 64
Scriptname _Arissa_Frag_Debug_MQ01Guards Extends Scene Hidden

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Guard1.TryToMoveTo(_Arissa_MQ01_ArrestGuard1StartMarker)
Alias_Guard2.TryToMoveTo(_Arissa_MQ01_ArrestGuard2Marker)
Alias_Guard3.TryToMoveTo(_Arissa_MQ01_ArrestGuard3Marker)
Guard4.TryToMoveTo(_Arissa_MQ01_ArrestGuard4StartMarker)
Guard5.TryToMoveTo(_Arissa_MQ01_ArrestGuard5StartMarker)

;Make Arissa effectively invincible and ignore the player's attacks
Alias_Arissa.GetActorReference().IgnoreFriendlyHits()
Alias_Arissa.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_28 in script _Arissa_Frag_Debug_MQ01Guards
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
Alias_Arissa.GetActorRef().MoveTo(_Arissa_ArrestArissaMarker)
Alias_Guard1.GetActorRef().MoveTo(_Arissa_MQ01_ArrestGuard1Marker)
Alias_Guard2.GetActorRef().MoveTo(_Arissa_MQ01_ArrestGuard2MarkerHoldPos)
Alias_Guard3.GetActorRef().MoveTo(_Arissa_MQ01_ArrestGuard3MarkerHoldPos)
Guard4.GetActorRef().MoveTo(_Arissa_MQ01_ArrestGuard4Marker)
Guard5.GetActorRef().MoveTo(_Arissa_MQ01_ArrestGuard5Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_35 in script _Arissa_Frag_Debug_MQ01Guards
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
if (GetOwningQuest() as _Arissa_MQ01_Data).SaveArissaChoice == true
    GetOwningQuest().SetStage(99)
else
    ;Scene interrupted for some reason, failsafe
    GetOwningQuest().SetObjectiveFailed(20)
    GetOwningQuest().SetObjectiveDisplayed(101)
    GetOwningQuest().SetStage(101)
endif

;Return Arissa to normal combat behavior
Alias_Arissa.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 0)

Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
Game.EnablePlayerControls()
;Set her normal outfit
Alias_Arissa.GetActorRef().AddItem(_Arissa_ArmorThievesGuildVariantBoots)
Alias_Arissa.GetActorRef().AddItem(_Arissa_ArmorThievesGuildVariantGauntlets)
Alias_Arissa.GetActorRef().AddItem(_Arissa_ArmorThievesGuildVariantCuirass)
Alias_Arissa.GetActorRef().AddItem(IronArrow, 100)
Alias_Arissa.GetActorRef().AddItem(HuntingBow)
Alias_Arissa.GetActorRef().AddItem(SteelDagger)
Alias_Arissa.GetActorRef().AddItem(SteelSword)
utility.wait(0.1)
Alias_Arissa.GetActorRef().EquipItem(_Arissa_ArmorThievesGuildVariantGauntlets)
Alias_Arissa.GetActorRef().EquipItem(_Arissa_ArmorThievesGuildVariantBoots)
Alias_Arissa.GetActorRef().EquipItem(_Arissa_ArmorThievesGuildVariantCuirass)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Guard1  Auto  

ReferenceAlias Property Alias_Guard2  Auto  

ReferenceAlias Property Alias_Guard3  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard2Marker  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard3Marker  Auto  

ReferenceAlias Property Alias_Arissa  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard5StartMarker  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard4StartMarker  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard1StartMarker  Auto  

ReferenceAlias Property Guard4  Auto  

ReferenceAlias Property Guard5  Auto  

Sound Property WPNBashShieldL  Auto  

Idle Property CombatIdleStagger_withShield  Auto  

Idle Property BumpedFromFront  Auto  

Idle Property staggerStart  Auto  

Idle Property PowerAttackStanding  Auto  

Idle Property DefaultSheathe  Auto  

ObjectReference Property _Arissa_ArrestArissaMarker  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard1Marker  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard4Marker  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard5Marker  Auto  

Outfit Property _Arissa_Armor1_Outfit  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard2MarkerHoldPos  Auto  

ObjectReference Property _Arissa_MQ01_ArrestGuard3MarkerHoldPos  Auto  

Armor Property _Arissa_ArmorThievesGuildVariantBoots  Auto  

Armor Property _Arissa_ArmorThievesGuildVariantCuirass  Auto  

Armor Property _Arissa_ArmorThievesGuildVariantGauntlets  Auto  

WEAPON Property SteelSword  Auto  

WEAPON Property SteelDagger  Auto  

Ammo Property IronArrow  Auto  

WEAPON Property HuntingBow  Auto  
