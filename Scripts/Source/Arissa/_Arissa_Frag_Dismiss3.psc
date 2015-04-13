;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_Dismiss3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;@TODO: This script is deprecated and should be removed from the plug-in.
;(self.GetOwningQuest() as _Arissa_iNPC_Behavior).Dismiss()
;(self.GetOwningQuest() as _Arissa_iNPC_Behavior).TestSayLine()
;utility.wait(3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
