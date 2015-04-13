;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname _Arissa_Frag_MQ01_GiveGoldFailsafe Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;If Arissa still has the player's gold, give it back
if (GetOwningQuest() as _Arissa_MQ01_Data).GoldStolenFromPlayer > 0
    Game.GetPlayer().AddItem(Gold001, (GetOwningQuest() as _Arissa_MQ01_Data).GoldStolenFromPlayer)
    (GetOwningQuest() as _Arissa_MQ01_Data).GoldStolenFromPlayer = 0
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  
