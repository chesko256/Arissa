;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00026E3D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;set DialogueRiverwoodLucansDryGoodsScene1.sale to 1
RiverwoodDryGoodsScene1Script Script = pDialogueLucans as RiverwoodDryGoodsScene1Script 
Script.Sale = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDialogueLucans  Auto  
