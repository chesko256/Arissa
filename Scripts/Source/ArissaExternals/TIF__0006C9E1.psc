;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0006C9E1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Chalice, 1)
if ((GetOwningQuest() as T01QuestScript).DegainedEnlisted)
	T01DegaineFavor.SetStage(200)
endif
(GetOwningQuest() as T01QuestScript).HamalShouldConfront = False
GetOwningQuest().SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Chalice  Auto  

Quest Property T01DegaineFavor  Auto  
