;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000DEE85 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If WITavernS.IsRunning()
	WITavernS.ServerGreeted = 1
EndIf
akSpeaker.ShowBarterMenu()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WITavernScript Property WITavernS  Auto  
{Pointer to WITavernScript on WITavern quest}
