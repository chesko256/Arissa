;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000799DA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pFDS.Bribe(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
TGTQ01QuestScript  pTGTQ01Script = getowningquest() as TGTQ01QuestScript
pTGTQ01Script .pTGTQ01RhorlakSolved = 1
pRhorlakAlias.GetActorRef().EvaluatePackage()
dunPinewatchMakeHostileScript mypDoorThingie
mypDoorThingie = pDoorThingie.GetRef() as dunPinewatchMakeHostileScript
mypDoorThingie.pBribed = true
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pRhorlakAlias  Auto  

ReferenceAlias Property pDoorThingie  Auto  

FavorDialogueScript Property pFDS  Auto  
