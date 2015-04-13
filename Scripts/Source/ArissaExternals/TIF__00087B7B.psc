;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00087B7B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage (30)
Target1Alias.GetReference().Enable()
Actor Target1 = Target1Alias.GetReference() as Actor
Target1.Resurrect()
DBrecurringQuestScript Script = GetOwningQuest() as DBrecurringQuestScript
Script.Target = 1
;Game.GetPlayer().AddItem(pGold,100)
Game.GetPlayer().AddItem(LvlQuestReward02Medium)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Target1Alias  Auto  

MiscObject Property pGold  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  
