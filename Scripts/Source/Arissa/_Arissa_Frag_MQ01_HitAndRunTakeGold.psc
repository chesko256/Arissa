;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_MQ01_HitAndRunTakeGold Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Take the player's money
if Game.GetPlayer().GetItemCount(Gold001) > 500
   (GetOwningQuest() as _Arissa_MQ01_Data).GoldStolenFromPlayer = 500
   Game.GetPlayer().RemoveItem(Gold001, 500)
else
   (GetOwningQuest() as _Arissa_MQ01_Data).GoldStolenFromPlayer = Game.GetPlayer().GetItemCount(Gold001)
   Game.GetPlayer().RemoveItem(Gold001, Game.GetPlayer().GetItemCount(Gold001))
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  
