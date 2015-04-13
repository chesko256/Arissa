;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname SF_MG06PatarusDoorScene_0007D41A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
ObservDoor.SetOpen()
MG06QuestScript QuestScript = MG06 as MG06QuestScript
QuestScript.MG06ParatusTracker = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;test
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;test
MG06Paratus.GetActorReference().EquipSpell(Flames, 0)
MG06Paratus.GetActorReference().EquipSpell(Flames, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Door Property ObservatoryDoor  Auto  

ObjectReference Property ObservDoor  Auto  

Quest Property MG06  Auto  

ReferenceAlias Property MG06Paratus  Auto  

Spell Property Flames  Auto  
