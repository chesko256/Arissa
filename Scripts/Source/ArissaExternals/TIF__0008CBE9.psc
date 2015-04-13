;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0008CBE9 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DB02Script DBScript = pDB02 as DB02Script
DBScript.pCaptive2Free = 2
DB02Captive2Alias.GetActorRef().SetOutfit (FarmClothesOutfit01)
Actor Captive2 = DB02Captive2Alias.GetReference() as Actor
Captive2.SetRestrained(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB02  Auto  

ReferenceAlias Property DB02Captive2Alias  Auto  

Outfit Property FarmClothesOutfit01  Auto  
