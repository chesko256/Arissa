;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00087B82 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage (30)
Target8Alias.GetReference().Enable()
Actor Target8 = Target8Alias.GetReference() as Actor
Target8.Resurrect()
DBrecurringQuestScript Script = GetOwningQuest() as DBrecurringQuestScript
Script.Target = 8
;Game.GetPlayer().AddItem(pGold,100)
Game.GetPlayer().AddItem(LvlQuestReward02Medium)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


MiscObject Property pGold  Auto  

ReferenceAlias Property Target8Alias  Auto

LeveledItem Property LvlQuestReward02Medium  Auto  
