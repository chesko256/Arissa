;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0009BCA1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
DarkBrotherhood DBScript = GetOwningQuest() as DarkBrotherhood
DBScript.CiceroBack = 1
CiceroAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 3) 
DBScript.CiceroState = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CiceroAlias  Auto  

GlobalVariable Property pFavorReward  Auto  
