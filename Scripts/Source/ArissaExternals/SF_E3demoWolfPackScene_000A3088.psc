;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_E3demoWolfPackScene_000A3088 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
QF_E3demo_00093637 E3demo = getOwningQuest() as QF_E3demo_00093637

e3demo.Alias_WolfAlpha.getActorReference().startCombat(game.getPlayer())
e3demo.Alias_Wolf01.getActorReference().startCombat(game.getPlayer())
e3demo.Alias_Wolf02.getActorReference().startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
