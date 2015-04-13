;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname TIF__00026189 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MG02QuestScript MyQuestScript=GetOwningQuest() as MG02QuestScript
MyQuestScript.AmuletInfo=1
GetOwningQuest().SetObjectiveDisplayed(30,0)
GetOwningQuest().SetObjectiveDisplayed(35,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
