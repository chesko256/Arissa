;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00098B68 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DarkBrotherhoodSanctuaryRepairScript Script = GetOwningQuest() as DarkBrotherhoodSanctuaryRepairScript
RefitMarker5.Enable()
Script.RefitChoice5 = 1
Script.RefitTotal += 1
Game.GetPlayer().RemoveItem(Gold001, 3000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;DarkBrotherhoodSanctuaryRepairScript Script = GetOwningQuest() as DarkBrotherhoodSanctuaryRepairScript
;RefitMarker5.Enable()
;Script.RefitChoice5 = 1
;Script.RefitTotal += 1
;Game.GetPlayer().RemoveItem(Gold001, 3000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RefitMarker5  Auto  

MiscObject Property Gold001  Auto  
