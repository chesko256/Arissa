;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000AE72A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; just to be safe
SpielScene.Stop()
(GetOwningQuest() as C03QuestScript).SkjorOfferingTransform = false
akSpeaker.EvaluatePackage()

BloodRitual.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BloodRitual  Auto  

Scene Property SpielScene  Auto  
