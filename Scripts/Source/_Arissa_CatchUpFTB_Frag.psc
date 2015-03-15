;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_CatchUpFTB_Frag Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
FadeToBlackImod.Apply()
utility.wait(2.1)
FadeToBlackImod.PopTo(FadeToBlackHoldImod)
FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ImageSpaceModifier Property FadeToBlackImod  Auto  

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  

ImageSpaceModifier Property FadeToBlackBackImod  Auto  
