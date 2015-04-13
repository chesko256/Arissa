;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PF_TG08BMercerStatueSceneCast_000FDBB6 Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
akActor.PlaceAtMe(Tg08bShockwaveExplosion)
getowningquest().setstage(37)
akActor.removeSpell(TG08BShockwave)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property TG08BShockwave  Auto  

Explosion Property TG08BShockwaveExplosion  Auto  
