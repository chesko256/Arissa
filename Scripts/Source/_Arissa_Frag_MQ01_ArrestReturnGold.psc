;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_MQ01_ArrestReturnGold Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if (GetOwningQuest() as _Arissa_MQ01_Data).GoldStolenFromPlayer > 0
   Game.GetPlayer().AddItem(Gold001, (GetOwningQuest() as _Arissa_MQ01_Data).GoldStolenFromPlayer)
   (GetOwningQuest() as _Arissa_MQ01_Data).GoldStolenFromPlayer = 0
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  
