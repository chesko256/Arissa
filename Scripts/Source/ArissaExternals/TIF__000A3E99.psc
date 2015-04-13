;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000A3E99 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.EvaluatePackage()
Game.GetPlayer().AddToFaction(TrainingFaction)
akSpeaker.AddToFaction(TrainingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if (!GetOwningQuest().GetStageDone(20))
	GetOwningQuest().SetStage(20)
endif
(GetOwningQuest() as CompanionsHousekeepingScript).PlayerWalkedAwayDuringKVScene = false
TrainingQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TrainingQuest  Auto  

Faction Property TrainingFaction  Auto  
