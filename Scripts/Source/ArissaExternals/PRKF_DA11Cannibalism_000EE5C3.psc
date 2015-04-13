;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname PRKF_DA11Cannibalism_000EE5C3 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().StartCannibal(akTargetRef as Actor)
DA11CannibalismAbility.Cast(Game.GetPlayer(), Game.GetPlayer())
DA11CannibalismAbility02.Cast(Game.GetPlayer(), Game.GetPlayer())

;Game.GetPlayer().AddSpell(DA11CannibalismAbility)
;Game.GetPlayer().AddSpell(DA11CannibalismAbility02, abVerbose= false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

PlayerVampireQuestScript Property PlayerVampireQuest  Auto  

Spell Property DA11CannibalismAbility  Auto  

Spell Property DA11CannibalismAbility02  Auto  
