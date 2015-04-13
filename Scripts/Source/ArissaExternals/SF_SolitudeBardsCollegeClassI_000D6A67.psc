;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SF_SolitudeBardsCollegeClassI_000D6A67 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
ATAfAlanRef.playIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
AtAfAlanRef.playIdle(IdleLuteStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getowningquest().setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
IngeSixFingersRef.playIdle(IdleLuteStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
IngeSixFingersRef.playIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property AtAfAlanRef  Auto  

Actor Property IngeSixFingersREF  Auto  

Idle Property idleLuteStart  Auto  

Idle Property idleStop  Auto  
