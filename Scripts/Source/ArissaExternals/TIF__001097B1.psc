;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__001097B1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(CursedRing, 1, true)
Game.GetPlayer().AddItem(NormalRing, 1, true)
AchievementsQuest.IncDaedricArtifacts()

QuestingBeastGhost.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property CursedRing  Auto  

Armor Property NormalRing  Auto  

ReferenceAlias Property QuestingBeastGhost  Auto  

AchievementsScript Property AchievementsQuest  Auto  
