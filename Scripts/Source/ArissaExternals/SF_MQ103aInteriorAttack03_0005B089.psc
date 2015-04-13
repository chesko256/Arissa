;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_MQ103aInteriorAttack03_0005B089 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
MQ103QuestScript pQuestScript = GetOwningQuest() as MQ103QuestScript

pQuestScript.RespawnPoint.Moveto(pQuestScript.RespawnMoveTo30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MQ103QuestScript pQuestScript = GetOwningQuest() as MQ103QuestScript

pQuestScript.MQ103aBookRoom.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
MQ103QuestScript pQuestScript = GetOwningQuest() as MQ103QuestScript

pQuestScript.RespawnPoint.Moveto(pQuestScript.RespawnMoveTo40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
