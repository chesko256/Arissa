;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000C027B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DB03Script Script = pDB03 as DB03Script
Script.PitTaunt = 1
pAlainAlias.GetActorRef().AddToFaction(ArenaSelfLoathingFaction)
pAlainAlias.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB03  Auto  

ReferenceAlias Property pAlainAlias  Auto  

Faction Property ArenaSelfLoathingFaction  Auto  
