;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00087B6F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DarkBrotherhoodSanctuaryRepairScript Script = GetOwningQuest() as DarkBrotherhoodSanctuaryRepairScript
Script.RefitFirst = 1
DBInitiate1.Enable()
DBInitiate2.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RepairQuest  Auto  

ObjectReference Property DBInitiate1  Auto  

ObjectReference Property DBInitiate2  Auto  
