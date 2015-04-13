;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_CompanionsSingleCombatQues_000880EB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bystander1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Opponent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Opponent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; this is all cribbed fomr DGIntimidateQuest
; Debug.MessageBox("Starting single combat.")
; Debug.Trace(self + " stage 10")
Game.GetPlayer().AddToFaction(SingleCombatFaction)

Alias_Opponent.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player cheated somehow
; Debug.Trace(self + " stage 150")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; player wins
; Debug.Trace(self + " stage 200")
Game.GetPlayer().RemoveFromFaction(SingleCombatFaction)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property SingleCombatFaction  Auto  
