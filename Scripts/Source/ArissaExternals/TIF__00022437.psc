;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00022437 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Coffin.PlayAnimation("playanim02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Game.EnablePlayerControls()
;pAstridAlias.GetRef().MoveTo (pAstridNMChamberMarker) 
;GetOwningQuest().SetStage(30)
;DB04Script pDB04Script = pDB04 as DB04Script
;pDB04Script.Listener = 1
Coffin.PlayAnimation("playanim01")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pAstridNMEnterScene  Auto  
ReferenceAlias Property pAstridAlias Auto
ObjectReference Property pAstridNMChamberMarker Auto

Quest Property pDB04  Auto  

ObjectReference Property Coffin  Auto  
