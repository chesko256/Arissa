;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SF_dunMS06ThrallBanter_0001E99F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
QF_dunMS06_0001F142 QST = getOwningQuest() as QF_dunMS06_0001F142
(QST.Alias_PotemaThrallVampire.getReference() as actor).stopCombat()
(QST.Alias_PotemaThrallVampire.getReference() as actor).setActorValue("aggression",2)
(QST.Alias_PotemaThrallVampire.getReference() as actor).startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
QF_dunMS06_0001F142 QST = getOwningQuest() as QF_dunMS06_0001F142
(QST.Alias_PotemaThrallVampire.getReference() as actor).setActorValue("aggression",2)
(QST.Alias_PotemaThrallVampire.getReference() as actor).startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
DraugrMiniboss.activate(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

objectReference Property DraugrMiniboss  Auto  
