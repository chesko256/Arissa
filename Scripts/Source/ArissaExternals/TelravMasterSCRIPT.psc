Scriptname TelravMasterSCRIPT extends Actor  

QUEST PROPERTY nilheimQuest AUTO

OBJECTREFERENCE PROPERTY banditA AUTO
OBJECTREFERENCE PROPERTY banditB AUTO
OBJECTREFERENCE PROPERTY banditC AUTO
OBJECTREFERENCE PROPERTY banditD AUTO
OBJECTREFERENCE PROPERTY banditE AUTO
OBJECTREFERENCE PROPERTY banditF AUTO

REFERENCEALIAS PROPERTY aliasBanditA AUTO
REFERENCEALIAS PROPERTY aliasBanditB AUTO
REFERENCEALIAS PROPERTY aliasBanditC AUTO
REFERENCEALIAS PROPERTY aliasBanditD AUTO
REFERENCEALIAS PROPERTY aliasBanditE AUTO
REFERENCEALIAS PROPERTY aliasBanditF AUTO

FACTION PROPERTY oldFaction AUTO
FACTION PROPERTY banditFaction AUTO

EVENT ONDEATH(ACTOR akKiller)

	;have the "guards" go aggro
	(BanditA as Actor).setFactionRank(banditFaction, 3)
	(BanditB as Actor).setFactionRank(banditFaction, 3)
	(BanditC as Actor).setFactionRank(banditFaction, 3)
	(BanditD as Actor).setFactionRank(banditFaction, 3)
	(BanditE as Actor).setFactionRank(banditFaction, 3)
	(BanditF as Actor).removeFromFaction(oldFaction)
	
	(BanditA as Actor).removeFromFaction(oldFaction)
	(BanditB as Actor).removeFromFaction(oldFaction)
	(BanditC as Actor).removeFromFaction(oldFaction)
	(BanditD as Actor).removeFromFaction(oldFaction)
	(BanditE as Actor).removeFromFaction(oldFaction)
	(BanditF as Actor).removeFromFaction(oldFaction)
	
	aliasBanditA.forceRefTo(banditA)
	aliasBanditB.forceRefTo(banditB)
	aliasBanditC.forceRefTo(banditC)
	aliasBanditD.forceRefTo(banditD)
	aliasBanditE.forceRefTo(banditE)
		
	(BanditA as Actor).evaluatePackage()
	(BanditB as Actor).evaluatePackage()
	(BanditC as Actor).evaluatePackage()
	(BanditD as Actor).evaluatePackage()
	(BanditE as Actor).evaluatePackage()
	(BanditF as Actor).evaluatePackage()
	
	IF(nilheimQuest.getStage() == 30)
		nilheimQuest.SetObjectiveCompleted(30, 1)
		nilheimQuest.setStage(100)
		nilheimQuest.completeQuest()
		
	ELSEIF(nilheimQuest.getStage() > 0 && nilheimQuest.getStage() < 30)
		
		; //fail the quest
		nilheimQuest.SetObjectiveCompleted(30, 1)
		nilheimQuest.setStage(150)
	
	ENDIF

ENDEVENT
