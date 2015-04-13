;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_MGPhinisLecture02_001076CE Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(GetOwningQuest() as MGCollegeLecturesQuestScript).ScenePicked=0
(GetOwningQuest() as MGCollegeLecturesQuestScript).RegisterForSingleUpdateGameTime(12)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
