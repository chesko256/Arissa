;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0001F814 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(20)
Game.GetPlayer().RemoveItem(Gold, 30)
Game.GetPlayer().Addspell(MageLight)
(GetOwningQuest() as MG01QuestScript).NiryaSpellSold=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property MageLight  Auto  

MiscObject Property Gold  Auto  
