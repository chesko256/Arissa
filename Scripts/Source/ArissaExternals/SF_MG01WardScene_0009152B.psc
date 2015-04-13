;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_MG01WardScene_0009152B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(GetOwningQuest() as MG01QuestScript).PlayerHit = 0
(GetOwningQuest() as MG01QuestScript).TimerInit = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;test
MG01Tolfdir.GetActorReference().AddSpell(TeachingSpell)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;MG01QuestScript QuestScript = GetOwningQuest() as MG01QuestScript
;QuestScript.WardGiven = 10
WardPostScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MG01Tolfdir  Auto  

Spell Property TeachingSpell  Auto  

Scene Property WardPostScene  Auto  
