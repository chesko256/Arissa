;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00021E5D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MG01QuestScript MG01 = GetOwningQuest() as MG01QuestScript
if MG01.NiryaSkillVar == 1
GetOwningQuest().SetStage(20)
Elseif MG01.NiryaSkillVar == 2 
GetOwningQuest().SetStage(21)
Elseif MG01.NiryaSkillVar == 3
GetOwningQuest().SetStage(22)
Elseif MG01.NiryaSkillVar == 4
GetOwningQuest().SetStage(23)
Elseif MG01.NiryaSkillVar == 5
GetOwningQuest().SetStage(24)
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
