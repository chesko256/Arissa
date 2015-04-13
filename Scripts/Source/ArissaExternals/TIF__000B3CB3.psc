;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000B3CB3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
QF_dunBlindCliffQST_00039B3B fragScript = getOwningQuest() as QF_dunBlindCliffQST_00039B3B
dunBlindCliffQSTscript questScript = getOwningQuest() as dunBlindCliffQSTscript
akSpeaker.removeItem(fragScript.rewardStaff,1)
questScript.gotReward = true
(game.getPlayer()).addItem(fragScript.rewardStaff, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
