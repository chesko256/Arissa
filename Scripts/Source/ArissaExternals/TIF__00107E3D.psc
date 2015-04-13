;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00107E3D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as DialogueWinterholdCollegeQuestScript).TolfdirPostQuestFG=1
Game.GetPlayer().AddItem(ArchMageRobes,1)
Game.GetPlayer().AddItem(CollegeArchMageKey,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

armor Property ArchMageRobes  Auto  

Key Property CollegeArchMageKey  Auto  
