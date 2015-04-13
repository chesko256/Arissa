;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00098B63 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DarkBrotherhoodSanctuaryRepairScript Script = GetOwningQuest() as DarkBrotherhoodSanctuaryRepairScript
RefitMarker1.Enable()
Script.RefitChoice1 = 1
Script.RefitTotal += 1
Game.GetPlayer().RemoveItem(Gold001, 1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;DarkBrotherhoodSanctuaryRepairScript Script = GetOwningQuest() as DarkBrotherhoodSanctuaryRepairScript
;RefitMarker1.Enable()
;Script.RefitChoice1 = 1
;Script.RefitTotal += 1
;Game.GetPlayer().RemoveItem(Gold001, 1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DarkSancRepairQuest  Auto  

ObjectReference Property RefitMarker1  Auto  

MiscObject Property Gold001  Auto  
