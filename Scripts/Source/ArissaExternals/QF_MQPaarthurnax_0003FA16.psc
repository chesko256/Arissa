;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_MQPaarthurnax_0003FA16 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Esbern
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Esbern Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Paarthurnax
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Paarthurnax Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Delphine
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Delphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arngeir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Arngeir Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; Esbern and Delphine blocking dialogue
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Blades are happy with you again
SetObjectiveCompleted(20)
; make Esbern more friendly
Alias_Esbern.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3)
; make Delphine a friend
Alias_Delphine.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3)
; add player back to Blades faction
Game.GetPlayer().AddToFaction(BladesFaction)

; TODO -- whatever else needs to be set to allow access to Sky Haven Temple again
; ...
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Greybeards are angry with you - player has spoken with Arngeir
Alias_Arngeir.GetActorRef().ModFavorPoints(FavorRewardLarge.GetValueInt() * -2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; quest starts
; make Paarthurnax killable
Alias_Paarthurnax.GetActorRef().GetActorBase().SetEssential(false)
; Esbern and Delphine no longer friends of player
Alias_Esbern.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
Alias_Delphine.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 0)
; player no longer in Blades faction
Game.GetPlayer().RemoveFromFaction(BladesFaction)
; enable book
MQPaarthurnaxBookRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; turn off access to High Hrothgar services
Game.GetPlayer().RemoveFromFaction(GreybeardFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
; if P is already dead, finish objective
if Alias_Paarthurnax.GetActorRef().IsDead() == 1
	setstage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; player has told Arngeir that Blades want him to kill Paarthurnax
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Paarthurnax is dead
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property IntroScene  Auto  

GlobalVariable Property FavorRewardLarge  Auto  

ObjectReference Property MQPaarthurnaxBookRef  Auto  

Faction Property BladesFaction  Auto  

Faction Property GreybeardFaction  Auto  
