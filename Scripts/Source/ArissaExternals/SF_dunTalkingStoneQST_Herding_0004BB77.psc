;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 79
Scriptname SF_dunTalkingStoneQST_Herding_0004BB77 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
If (GetOwningQuest().GetStage() < 100 && GetOwningQuest().GetStage() != 5)
  Werewolf01.GetActorReference().Enable()
  ;Werewolf01.forcerefto(OrotheimRaidersSpawnPoint.PlaceActorAtMe(WerewolfBase, 1))
  ;Werewolf02.forcerefto(OrotheimRaidersSpawnPoint2.PlaceActorAtMe(WerewolfBase, 0))
  ;Werewolf03.forcerefto(OrotheimRaidersSpawnPoint3.PlaceActorAtMe(WerewolfBase, 0))
  ;Werewolf04.forcerefto(OrotheimRaidersSpawnPoint4.PlaceActorAtMe(WerewolfBase, 0))
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property RaidLeader Auto

Actor Property Werewolf  Auto  

ObjectReference Property OrotheimRaidersSpawnPoint  Auto  

ReferenceAlias Property Werewolf01  Auto  
ReferenceAlias Property Werewolf02  Auto  
ReferenceAlias Property Werewolf03  Auto  
ReferenceAlias Property Werewolf04  Auto  

ActorBase Property WerewolfBase  Auto  

ObjectReference Property OrotheimRaidersSpawnPoint2  Auto  

ObjectReference Property OrotheimRaidersSpawnPoint3  Auto  

ObjectReference Property OrotheimRaidersSpawnPoint4  Auto  
