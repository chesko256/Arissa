;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_MG02Saarthal02Scene01_0004E85D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MG02QuestScript QuestScript = GetOwningQuest() as MG02QuestScript
QuestScript.TolfdirFollow = 1
MG02Tolfdir.GetActorReference().EvaluatePackage()
GetOwningQuest().SetObjectiveCompleted(60,1)
GetOwningQuest().SetObjectiveDisplayed(65,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MG02Tolfdir  Auto  
