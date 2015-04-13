;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00037B4B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Game.GetPlayer().AddItem(pGold,300)
Game.GetPlayer().AddItem(LvlQuestReward03Large)
Game.GetPlayer().AddSpell(pDBSpell)
pDB05.SetStage (200)
pDB06.SetStage (5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pGold  Auto  

Spell Property pDBSpell  Auto  

Quest Property pDB05  Auto  

Quest Property pDB06  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  

LeveledItem Property LvlQuestReward03Large  Auto  
