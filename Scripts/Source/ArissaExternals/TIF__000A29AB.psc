;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000A29AB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
TG01QuestScript pTG01Script = getowningquest() as TG01QuestScript
game.getplayer().removeitem(pTG01Script.pTG01Gold,300)
pTG01Script.pTG01Dialogue01 = 1
game.getplayer().additem(pPotion01,1)
game.getplayer().additem(pPotion02,1)
game.getplayer().additem(pPotion03,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pPotion01  Auto  

LeveledItem Property pPotion02  Auto  

LeveledItem Property pPotion03  Auto  
