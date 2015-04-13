;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00020F99 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pTGRSS.TGArrestedCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
WinterholdJailFaction.SetAlly(PlayerFaction)
akSpeaker.GetCrimeFaction().SendPlayerToJail(abRemoveInventory=False, abRealJail=True)
;Game.GetPlayer().MoveTo(JailMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property JailMarker  Auto  

TGRShellScript Property pTGRSS  Auto  

Faction Property WinterholdJailFaction  Auto  

Faction Property PlayerFaction  Auto  
