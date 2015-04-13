;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_MQ204GreybeardsIntroScene_000B3A40 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
game.shakeCamera(NONE, 0.1, 1.0)
game.shakeController(0.1, 0.1, 1.0)
AMBRumbleShakeGreybeards.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
getowningquest().setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property AMBRumbleShakeGreybeards  Auto  
