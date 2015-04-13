;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00099D10 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;in case the Jagged Crown Scene is hadn't finished playing:
((GetOwningQuest() as CW01Script).CW01SolitudeMapTableScene as CWMapTableSceneScript).StartMyScene(WaitUntilSceneCompletes = true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
