;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_TG08BMercerCombatOverrideC_000FDBC3 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
(MercerFreyRef as actor).RemoveSpell(TGNightingaleStrifeMercer)
fightController = (TG08bFightControllerRef as TG08BFightController)
fightController.MercerDrainSpellDone()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell property TGNightingaleStrifeMercer auto
objectReference property MercerFreyRef auto

ObjectReference Property TG08bFightControllerRef  Auto  

TG08BFightController Property fightController  Auto  
