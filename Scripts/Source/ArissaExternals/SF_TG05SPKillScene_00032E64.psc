;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname SF_TG05SPKillScene_00032E64 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getowningquest().setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
pMercer.GetActorRef().PlayIdle(pStab)
utility.Wait(7.5)
pTG05MercerStabAudio.Enable()
pStabISM.Apply()
utility.Wait(3.0)
pTG05BlackFrame.ApplyCrossfade(1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property pStab  Auto  

ReferenceAlias Property pMercer  Auto  

ImageSpaceModifier Property pStabISM  Auto  

ObjectReference Property pTG05MercerStabAudio  Auto  

ImageSpaceModifier Property pTG05BlackFrame  Auto  
