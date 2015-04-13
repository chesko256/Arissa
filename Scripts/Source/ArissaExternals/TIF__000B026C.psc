;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__000B026C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If akSpeaker.ShowGiftMenu(True, pAlcoholicDrinksList, abShowStolenItems = true) > 0
 If (akspeaker.GetRelationshipRank(Game.GetPlayer()) == 0)
   akspeaker.SetRelationshipRank(Game.GetPlayer(), 1)
 EndIf
 ;akspeaker.AddToFaction(pFavorCompletedFaction)
 pFavorSimpleDrunksSceneKeyword.SendStoryEvent(akRef1=akspeaker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Formlist Property pAlcoholicDrinksList  Auto  

GlobalVariable Property pFavorReward  Auto  

Keyword Property pFavorSimpleDrunksSceneKeyword  Auto  

Faction Property pFavorCompletedFaction  Auto  
