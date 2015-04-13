;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0008CBEB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DB02Script DBScript = pDB02 as DB02Script
DBScript.pCaptive3Free = 2
DB02Captive3Alias.GetActorRef().SetOutfit (FineClothesOutfit02)
Actor Captive3 = DB02Captive3Alias.GetReference() as Actor
Captive3.SetRestrained(False)
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

ReferenceAlias Property DB02Captive3Alias  Auto  

Outfit Property FineClothesOutfit02  Auto  
