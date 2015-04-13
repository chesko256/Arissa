;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DA16RitualScene02_0007EA29 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if pDA16ErandurAlias.GetActorRef().GetCombatState() == 0
if pDA16ErandurAlias.GetActorRef().IsDead() == 0
getowningquest().setstage(198)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pDA16ErandurAlias  Auto  
