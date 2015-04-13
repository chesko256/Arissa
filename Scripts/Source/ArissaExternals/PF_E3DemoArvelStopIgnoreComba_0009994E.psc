;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname PF_E3DemoArvelStopIgnoreComba_0009994E Extends Package Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5(Actor akActor)
;BEGIN CODE
akActor.setav("Variable01", 1)
akActor.removeFromFaction(SpiderFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(Actor akActor)
;BEGIN CODE
akActor.setav("Aggression", 3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

faction Property BanditFaction  Auto  

Faction Property SpiderFaction  Auto  
