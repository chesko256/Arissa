;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0008B5E1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
TG00QuestScript pTG00Script = getowningquest() as TG00QuestScript
pTG00Script.pTG00Dialogue01 = 1
game.getplayer().additem(pTG00Script.pTG00Gold,pTG00Script.pTG00Reward)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
