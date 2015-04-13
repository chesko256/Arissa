;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_TelravTravelStage20Dead_00072A92 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
nilheimQuest.setStage(30)
nilheimQuest.setObjectiveDisplayed(30,1)

telravRef.getActorReference().setFactionRank(Bandit, 3)
telravRef.getActorReference().removeFromFaction(oldFaction)
telravRef.getActorReference().startCombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

OBJECTREFERENCE Property BanditA  Auto  

ObjectReference Property BanditB  Auto  

ObjectReference Property BanditC  Auto  

ObjectReference Property BanditD  Auto  

Faction Property Bandit  Auto  

Faction Property OldFaction  Auto  

QUEST Property nilheimQuest  Auto  

ReferenceAlias Property TelravRef  Auto  

referenceAlias Property aliasBanditA  Auto  

referenceAlias Property aliasBanditB  Auto  

referenceAlias Property aliasBanditC  Auto  

referenceAlias Property aliasBanditD  Auto  

referenceAlias Property aliasBanditE  Auto  

referenceAlias Property aliasBanditF  Auto  

objectreference Property banditE  Auto  

objectreference Property BanditF  Auto  
