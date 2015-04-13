;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname SF_TG08BFight_000E6C27 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
myQuest = TG08B as TG08BQuestScript
BrynjolfRef.placeAtMe(TG08BSubterfugeExplosion)
myQuest.pTG08BBrynjolfIsCharmed = true
MercerFreyRef.removeSpell(TGNightingaleSubterfugeMercer)
MercerFreyRef.setAV("Aggression", 2)
MercerFreyRef.startCombat(game.getPlayer())
MercerFreyRef.evaluatePackage()
KarliahRef.evaluatePackage()
BrynjolfRef.evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getOwningQuest().setStage(41)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TG08B  Auto  

TG08BQuestScript Property myQuest  Auto  

Actor Property BrynjolfRef  Auto  

Actor Property MercerFreyRef  Auto  

Actor Property KarliahRef  Auto  

Explosion Property TG08BSubterfugeExplosion  Auto  

Spell Property TGNightingaleSubterfugeMercer  Auto  
