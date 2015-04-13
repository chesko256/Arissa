;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00040356 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.AddItem(QuestItem.GetRef())
Game.GetPlayer().AddItem(FavorRewardGold)
GetOwningQuest().SetStage(17)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property QuestItem  Auto  

LeveledItem Property FavorRewardFood  Auto  

LeveledItem Property FavorRewardGold  Auto  
