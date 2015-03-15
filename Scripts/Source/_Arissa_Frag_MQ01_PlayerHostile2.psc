;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Frag_MQ01_PlayerHostile2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().CompleteAllObjectives()
_ArissaFaction.SetEnemy(PlayerFaction)
GetOwningQuest().SetObjectiveDisplayed(60)
GetOwningQuest().SetStage(60)
akSpeaker.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property _ArissaFaction  Auto  

Faction Property PlayerFaction  Auto  
