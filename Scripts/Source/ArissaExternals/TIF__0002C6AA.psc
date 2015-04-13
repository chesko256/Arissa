;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__0002C6AA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
faction myCrimeFaction = akSpeaker.GetCrimeFaction()
; debug.trace("WiRemoveItem01 dialogue result: Modding Crimefaction for:" + myCrimeFaction)
myCrimeFaction.ModCrimeGold(10)
WIRemoveItem01BountyMessage.show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property WIRemoveItem01BountyMessage  Auto  
