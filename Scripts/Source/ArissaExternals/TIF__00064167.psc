;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00064167 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDB07.SetStage (20)
;Shadowmere.Enable()
ShadowmereEffect.Enable()
Game.IncrementStat( "Horses Owned" )
;pCiceroGoneScene3.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB07  Auto  

ObjectReference Property Shadowmere  Auto  

Scene Property pCiceroGoneScene3  Auto  

ObjectReference Property ShadowmereEffect  Auto  
