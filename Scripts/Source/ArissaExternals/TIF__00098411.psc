;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00098411 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;
Game.GetPlayer().RemoveItem(Gold001, horsecost.value as int)
Alias_Horse.GetActorReference().SetFactionRank(PlayerHorseFaction, 1)
Alias_Horse.GetActorRef().SetFactionOwner(PlayerFaction)
PlayersHorse.ForceRefTo(Alias_Horse.GetActorRef())
game.IncrementStat( "Horses Owned" )
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

ReferenceAlias Property Alias_Horse  Auto  

Faction Property PlayerHorseFaction  Auto  

Faction Property PlayerFaction  Auto  

ReferenceAlias Property PlayersHorse  Auto  

GlobalVariable Property Horsecost  Auto  
