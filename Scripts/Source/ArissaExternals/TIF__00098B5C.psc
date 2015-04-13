;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00098B5C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DarkBrotherhoodSanctuaryRepairScript Script = GetOwningQuest() as DarkBrotherhoodSanctuaryRepairScript
RefitMarker3.Enable()
TortureCaptivesMarker.Enable()
Actor Captive1 = Alias_Captive1.GetReference() as Actor
Captive1.SetRestrained(1)
Actor Captive2 = Alias_Captive2.GetReference() as Actor
Captive2.SetRestrained(1)
Actor Captive3 = Alias_Captive3.GetReference() as Actor
Captive3.SetRestrained(1)
Actor Captive4 = Alias_Captive4.GetReference() as Actor
Captive4.SetRestrained(1)
Script.RefitChoice3 = 1
Script.RefitTotal += 1
Game.GetPlayer().RemoveItem(Gold001, 5000)
TortureDoor.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;DarkBrotherhoodSanctuaryRepairScript Script = GetOwningQuest() as DarkBrotherhoodSanctuaryRepairScript
;RefitMarker3.Enable()
;TortureCaptivesMarker.Enable()
;Actor Captive1 = Alias_Captive1.GetReference() as Actor
;Captive1.SetRestrained(1)
;Actor Captive2 = Alias_Captive2.GetReference() as Actor
;Captive2.SetRestrained(1)
;Actor Captive3 = Alias_Captive3.GetReference() as Actor
;Captive3.SetRestrained(1)
;Actor Captive4 = Alias_Captive4.GetReference() as Actor
;Captive4.SetRestrained(1)
;Script.RefitChoice3 = 1
;Script.RefitTotal += 1
;Game.GetPlayer().RemoveItem(Gold001, 5000)
;TortureDoor.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RefitMarker3  Auto  

MiscObject Property Gold001  Auto  

ObjectReference Property TortureCaptivesMarker  Auto  

ReferenceAlias Property Alias_Captive1  Auto  
ReferenceAlias Property Alias_Captive2  Auto  
ReferenceAlias Property Alias_Captive3  Auto  
ReferenceAlias Property Alias_Captive4  Auto  

ObjectReference Property TortureDoor  Auto  
