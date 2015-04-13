;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_dunValtheimKeepQST_000ADFE7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ValtheimKeepLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_ValtheimKeepLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GenericBandit01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GenericBandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GenericBandit04
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GenericBandit04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShakeDownBandit
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_ShakeDownBandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GenericBandit02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GenericBandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackTriggerTower03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AttackTriggerTower03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GenericBandit03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GenericBandit03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackTriggerTower02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AttackTriggerTower02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GenericBandit05
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_GenericBandit05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackTriggerTower01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_AttackTriggerTower01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has paid off bandits and can now proceed
game.getPlayer().removeItem(Gold001,200)
alias_AttackTriggerTower02.getReference().disable()
utility.wait(60.0)
setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;player has persuaded the bandit to accept 50 gold
game.getPlayer().removeItem(Gold001,50)
alias_AttackTriggerTower02.getReference().disable()
utility.wait(60.0)
setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;shut down stage

alias_AttackTriggerTower01.getReference().disable()
alias_AttackTriggerTower02.getReference().disable()
alias_AttackTriggerTower03.getReference().disable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Timer has expired and the player should have left, if not attack
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;beginning stage
(alias_boss.getReference() as actor).setav("aggression", 1)
(alias_shakeDownBandit.getReference() as actor).setav("aggression", 1)
(alias_genericBandit01.getReference() as actor).setav("aggression", 1)
(alias_genericBandit02.getReference() as actor).setav("aggression", 1)
(alias_genericBandit03.getReference() as actor).setav("aggression", 1)
(alias_genericBandit04.getReference() as actor).setav("aggression", 1)
(alias_genericBandit05.getReference() as actor).setav("aggression", 1)


alias_AttackTriggerTower01.getReference().enable()
alias_AttackTriggerTower02.getReference().enable()
alias_AttackTriggerTower03.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Bandits go hostile for whatever reason
(alias_boss.getReference() as actor).setav("aggression", 2)
(alias_shakeDownBandit.getReference() as actor).setav("aggression", 2)
(alias_shakeDownBandit.getReference() as actor).evaluatePackage()
(alias_genericBandit01.getReference() as actor).setav("aggression", 2)
(alias_genericBandit01.getReference() as actor).evaluatePackage()
(alias_genericBandit02.getReference() as actor).setav("aggression", 2)
(alias_genericBandit02.getReference() as actor).evaluatePackage()
(alias_genericBandit03.getReference() as actor).setav("aggression", 2)
(alias_genericBandit03.getReference() as actor).evaluatePackage()
(alias_genericBandit04.getReference() as actor).setav("aggression", 2)
(alias_genericBandit04.getReference() as actor).evaluatePackage()
(alias_genericBandit05.getReference() as actor).setav("aggression", 2)
(alias_genericBandit05.getReference() as actor).evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment




MiscObject Property Gold001  Auto  
