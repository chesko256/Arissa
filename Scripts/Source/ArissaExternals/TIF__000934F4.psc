;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000934F4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pLarsAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3) 
pWhiterunBullyQuest.SetStage (200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pWhiterunBullyQuest  Auto  

ReferenceAlias Property pLarsAlias  Auto  
