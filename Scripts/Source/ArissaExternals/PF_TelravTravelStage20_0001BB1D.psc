;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_TelravTravelStage20_0001BB1D Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
nilheimQuest.setStage(30)
nilheimQuest.setObjectiveDisplayed(30,1)

telravRef.getActorReference().setFactionRank(Bandit, 3)

;have the bandits attack
aliasBanditA.forceRefTo(BanditA)
aliasBanditB.forceRefTo(BanditB)
aliasBanditC.forceRefTo(BanditC)
aliasBanditD.forceRefTo(BanditD)
aliasBanditE.forceRefTo(BanditE)

;have the "guards" go aggro
(BanditA as Actor).setFactionRank(bandit, 3)
(BanditB as Actor).setFactionRank(bandit, 3)
(BanditC as Actor).setFactionRank(bandit, 3)
(BanditD as Actor).setFactionRank(bandit, 3)
(BanditE as Actor).setFactionRank(bandit, 3)
	
(BanditA as Actor).removeFromFaction(oldFaction)
(BanditB as Actor).removeFromFaction(oldFaction)
(BanditC as Actor).removeFromFaction(oldFaction)
(BanditD as Actor).removeFromFaction(oldFaction)
(BanditE as Actor).removeFromFaction(oldFaction)
telravRef.getActorReference().removeFromFaction(oldFaction)

(BanditA as Actor).startCombat(game.getPlayer())
(BanditB as Actor).startCombat(game.getPlayer())
(BanditC as Actor).startCombat(game.getPlayer())
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
