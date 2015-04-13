;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0002513F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as MG02QuestScript).MG02Stage20FG=-1
if MG02LectureScene.IsPlaying()
MG02LectureScene.Stop()
endif
MG02Tolfidr.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property MG02Tolfidr  Auto  

Scene Property MG02LectureScene  Auto  
