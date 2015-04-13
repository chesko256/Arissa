;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_MQ103aInteriorAttack_00039678 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; debug.Trace("DARYL - CW02A's InteriorAttack just ENDED")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
GetOwningQuest().SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MQ103QuestScript pQuestScript = GetOwningQuest() as MQ103QuestScript

;pQuestScript.LockedDoor01.Disable()
pQuestScript.InteriorAttack02.Start()
;pQuestScript.Leader.GetRef().MoveTo(pQuestScript.LeaderGateMoveTo)
;pQuestScript.Friendly01.GetRef().MoveTo(pQuestScript.Friendly01GateMoveTo)
;pQuestScript.Friendly02.GetRef().MoveTo(pQuestScript.Friendly02GateMoveTo)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; debug.Trace("DARYL - CW02A's InteriorAttack just STARTED")
MQ103QuestScript pQuestScript = GetOwningQuest() as MQ103QuestScript
;
pQuestScript.RespawnPoint.Moveto(pQuestScript.RespawnMoveTo10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
MQ103QuestScript pQuestScript = GetOwningQuest() as MQ103QuestScript

pQuestScript.RespawnPoint.Moveto(pQuestScript.RespawnMoveTo20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RikkeGateMoveTo  Auto  
ObjectReference Property Friendly01GateMoveTo  Auto  
ObjectReference Property Friendly02GateMoveTo  Auto  
