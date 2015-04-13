;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0004BE8A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
TG02QuestScript pTG02Script = getowningquest() as TG02QuestScript
pTG02Script.pTG02Dia = 1
pTG02Script.RemoveBillofSale()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

miscobject property pSafeStuff auto
miscobject property pGold auto
