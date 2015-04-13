;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_DA14StartSamsFirstDrink_000A967B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
DA14StartSamwell.GetActorRef().PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DA14StartSamwell.GetActorRef().PlayIdle(IdleDrink)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().Setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

idle Property IdleDrink  Auto  

Idle Property IdleStop  Auto  

ReferenceAlias Property DA14StartSamwell  Auto  
