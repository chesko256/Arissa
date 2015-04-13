;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__00040F7E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If akSpeaker.ShowGiftMenu(True, PotionList) > 0
 GetOwningQuest().SetStage(20)
Else
;   Debug.Trace("ShowGiftMenu returned a value <= 0")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property dunMossMotherQST  Auto  

Potion Property RestoreHealth01  Auto  

FormList Property PotionList  Auto  
