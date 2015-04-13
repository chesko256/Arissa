;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0004BCAF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDB09Script Script = pDB09 as pDB09Script
;Game.GetPlayer().RemoveItem(Poison,1)
Game.GetPlayer().RemoveItem(pJarrin,1)
Script.pPotagePoisoned = 1
pDB09.SetStage (40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB09  Auto  


MiscObject Property Poison  Auto  

Ingredient Property pJarrin  Auto  
