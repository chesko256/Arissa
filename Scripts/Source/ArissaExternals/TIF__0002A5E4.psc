;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0002A5E4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DA06QuestScript DA06Script = DA06 as DA06QuestScript
DA06Script.GiantDead100 = -1
(DA06YamarzAlias.GetActorReference().GetBaseObject() as ActorBase).SetEssential(False)
DA06YamarzAlias.GetActorReference().Startcombat(Game.GetPlayer())
DA06YamarzAlias.GetActorReference().RemoveFromFaction(TownLargashburFaction)
DA06YamarzAlias.GetActorReference().SetAV("Aggression", 2)
DA06YamarzCombatFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA06  Auto  

ReferenceAlias Property DA06YamarzAlias  Auto  

Faction Property DA06YamarzCombatFaction  Auto  

Faction Property PlayerFaction  Auto  

Faction Property TownLargashburFaction  Auto  
