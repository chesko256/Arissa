;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000212D2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.ModFavorPoints(pFavorReward.GetValueInt() )
pDB03.SetStage (50)
pDB03.SetObjectiveCompleted (30)
Game.GetPlayer().AddItem(pRing,1)
;Game.GetPlayer().AddItem(pGold,100)
Game.GetPlayer().AddItem(LvlQuestReward02Medium)
DeadTovaMarker.Enable()
TovaRef.Disable()
DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.TovaDead = 1
;TovaAlias.GetReference().Kill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB03  Auto  
MiscObject Property pGold  Auto  

GlobalVariable Property pFavorReward  Auto  

Armor Property pRing  Auto  

ObjectReference Property DeadTovaMarker  Auto  

ReferenceAlias Property TovaAlias  Auto  

ObjectReference Property TovaRef  Auto  

Quest Property DarkBrotherhoodQuest  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  
