;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000D0314 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Ammo practiceArrows
Int playerArrows
practiceArrows = (getOwningQuest() as dunArcherQuestScript).myAmmo
playerArrows = game.getPlayer().getItemCount(practiceArrows)
Game.getPlayer().addItem(practiceArrows, (10-playerArrows))
getOwningQuest().setStage(70)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
