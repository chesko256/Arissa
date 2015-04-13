;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_dunTalkingStoneQST_Attack_000B5F85 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Utility.Wait(5)
dunTalkingStoneFaction.SetAlly(WerewolfFaction)
TalkingStoneHerderGiant.GetActorRef().StopCombat()
Mammoth01.GetActorRef().StopCombat()
Mammoth02.GetActorRef().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
dunTalkingStoneFaction.SetEnemy(WerewolfFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property TalkingStoneHerderGiant  Auto  

ReferenceAlias Property Mammoth01  Auto  

Faction Property dunTalkingStoneFaction  Auto  

ReferenceAlias Property Mammoth02  Auto   

Faction Property WerewolfFaction  Auto  
