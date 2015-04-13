;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00020430 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDBSideContract07.SetStage (200)
Game.GetPlayer().AddItem(LvlQuestReward01Small)
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.ContractSet = DBScript.ContractSet +1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;pDBSideContract07.SetStage (200)
;Game.GetPlayer().AddItem(LvlQuestReward01Small)
;DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
;DBScript.ContractSet = DBScript.ContractSet +1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDBSideContract07  Auto  

MiscObject Property pGold  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

LeveledItem Property LvlQuestReward01Small  Auto  
