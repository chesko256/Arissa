;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000DC169 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pSabine.GetActorRef().RemoveItem(pKey,1)
Game.GetPlayer().AddItem(pKey,1)
Game.GetPlayer().RemoveItem(pGold,1500)
getowningquest().setstage(25)
pTGTQ02QS.pTGTQ02NoteRead = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property pKey  Auto  

ReferenceAlias Property pSabine  Auto  

TGTQ02QuestScript Property pTGTQ02QS  Auto  

MiscObject Property pGold  Auto  
