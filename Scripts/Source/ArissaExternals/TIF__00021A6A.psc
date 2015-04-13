;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00021A6A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If Game.GetPlayer().HasSpell(WardLesser) == 0
Game.GetPlayer().AddSpell(WardLesser)
endif

MG01QuestScript MG01 = GetOwningQuest() as MG01QuestScript
MG01.WardGiven = 5
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int Property NewProperty  Auto  

Scene Property WardScene  Auto  

Spell Property WardLesser  Auto  
