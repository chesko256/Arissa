;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname PF_StandsInShallowsWorksAtDoc_00035E64 Extends Package Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
ObjectReference meRef = akActor as ObjectReference
(meRef as CarryActorScript).ChangeCarryState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
ObjectReference meRef = akActor as ObjectReference
(meRef as CarryActorScript).ChangeCarryState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
ObjectReference meRef = akActor as ObjectReference
(meRef as CarryActorScript).ChangeCarryState(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
