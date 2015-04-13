;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000340BA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Set DialogueRiverwoodKidsScene.RiverwoodPlay to 4
RiverwoodKidsPlayScript Script = pKidsScene as RiverwoodKidsPlayScript
Script.RiverwoodPlay = 4
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pKidsScene  Auto  
