;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_MG08TolfdirFollowPlayer_000596FA Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
MG08Tolfdir.GetActorReference().EquipSpell(WallofFlames, 0)
MG08Tolfdir.GetActorReference().EquipSpell(WallofFlames, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

spell Property WallofFlames  Auto  

ReferenceAlias Property MG08Tolfdir  Auto  
