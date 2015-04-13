;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_C00JorrvaskrFight_000BC0BD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Vignar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Vignar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Njada
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Njada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skjor
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Skjor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Torvar
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Torvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brill
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Brill Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tilma
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Tilma Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Athis
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Athis Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE C00JorrvaskrFightSceneScript
Quest __temp = self as Quest
C00JorrvaskrFightSceneScript kmyQuest = __temp as C00JorrvaskrFightSceneScript
;END AUTOCAST
;BEGIN CODE
Alias_Njada.GetActorRef().StopCombat()
Alias_Athis.GetActorRef().StopCombat()

kmyQuest.FightEnd()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE C00JorrvaskrFightSceneScript
Quest __temp = self as Quest
C00JorrvaskrFightSceneScript kmyQuest = __temp as C00JorrvaskrFightSceneScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FightStart()
SpectatorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C00JorrvaskrFightSceneScript
Quest __temp = self as Quest
C00JorrvaskrFightSceneScript kmyQuest = __temp as C00JorrvaskrFightSceneScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FightPrep()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property SouthPoint  Auto  

ObjectReference Property NorthPoint  Auto  

Scene Property FightScene  Auto  

Scene Property SpectatorScene  Auto  
