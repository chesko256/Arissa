;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_dunPOITundraWitchShackQST_000DDF8D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Witch
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Witch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitchAttackPosition
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WitchAttackPosition Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bed
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Bed Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Witch dies.
Alias_Bed.GetReference().SetFactionOwner(None)
Self.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Startup stage.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Witch attacks.
Alias_Witch.GetActorRef().Activate(None)
Alias_Witch.GetActorRef().SetAv("Aggression", 2)
Alias_Witch.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player enters the cellar.
if (!Alias_Witch.GetActorRef().IsDead())
   Alias_Witch.GetActorRef().EvaluatePackage()
   Alias_Witch.GetActorRef().MoveToPackageLocation()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
