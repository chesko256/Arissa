;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_dunHillgrundsTombQSTFIN_000D7370 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Agna
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Agna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LongExitTrigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LongExitTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Golldir
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Golldir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExtClutterEnableMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ExtClutterEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Door Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Golldir dead, stop quest
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has left area, go to entrance and sandbox
;alias_ExtClutterEnableMarker.getReference().enable(alias_ExtClutterEnableMarker.getReference())
alias_Agna.getReference().disable(alias_Agna.getReference())
alias_Golldir.getActorRef().setRelationshipRank(game.getPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;post dungeon quest

alias_longExitTrigger.getReference().enable()
if (alias_Golldir.getReference() as actor).isDead()
	setstage(100)
else
	(alias_Golldir.getReference() as Actor).makePlayerFriend()
	;setstage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Golldir should wait by aunt
alias_longExitTrigger.getReference().disable()
(alias_Golldir.getReference() as actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialFollowerFaction  Auto  
