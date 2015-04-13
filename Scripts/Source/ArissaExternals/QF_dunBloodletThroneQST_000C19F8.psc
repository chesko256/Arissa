;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_dunBloodletThroneQST_000C19F8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY wolf3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_wolf3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY wolfLever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_wolfLever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY wolf1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_wolf1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY wolf2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_wolf2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Set when the player hits the vampires, the wolves are dead, or the player walks up the platform
;Stops scene, Starts combat on the vampires
dunBloodletThroneQSTView.stop()
alias_vampireBoss.getActorReference().setActorValue("Aggression", 2)
alias_vampire01.getActorReference().setActorValue("Aggression", 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
alias_vampireBoss.getActorReference().setActorValue("Aggression", 0)
alias_vampire01.getActorReference().setActorValue("Aggression", 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Set during scene, releases wolves from cages

alias_wolfLever.getReference().Activate(alias_wolfLever.getReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

faction property VampireFaction auto

Scene Property dunBloodletThroneQSTView  Auto  
