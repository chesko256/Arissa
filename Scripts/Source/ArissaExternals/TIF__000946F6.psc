;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000946F6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Game.GetPlayer().RemoveItem(pJarlSword,1)
Game.GetPlayer().AddItem(pGold,20)
;pProventusAlias.GetActorRef().AddItem(pJarlSword,1)
pProventusAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt() )
pAdrianneAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt() )
WhiterunSwordQuest.SetStage (200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weapon Property PJarlSword  Auto  

MiscObject Property pGold  Auto  

Quest Property WhiterunSwordQuest  Auto  

ReferenceAlias Property pProventusAlias  Auto  
ReferenceAlias Property pAdrianneAlias  Auto 
GlobalVariable Property pFavorReward  Auto  
