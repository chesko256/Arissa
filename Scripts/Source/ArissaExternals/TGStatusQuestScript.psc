Scriptname TGStatusQuestScript extends Quest  Conditional

GlobalVariable Property pTGRDone  Auto  Conditional
GlobalVariable Property pTGStatusCount  Auto  Conditional
ObjectReference Property pTGStageOneMarker  Auto  Conditional
ObjectReference Property pTGStageTwoMarker  Auto  Conditional
ObjectReference Property pTGStageThreeMarker  Auto  Conditional
ObjectReference Property pTGStageFourMarker  Auto  Conditional
ObjectReference Property pTGStageOneGuildMarker  Auto  Conditional
ObjectReference Property pTGStageTwoGuildMarker  Auto  Conditional
ObjectReference Property pTGStageThreeGuildMarker  Auto  Conditional
ObjectReference Property pTGStageFourGuildMarker  Auto  Conditional
GlobalVariable Property pTGFavorLarge Auto Conditional
GlobalVariable Property pFenceGoldStage01  Auto  
GlobalVariable Property pFenceGoldStage02  Auto  
GlobalVariable Property pFenceGoldStage03  Auto  
GlobalVariable Property pFenceGoldStage04  Auto  
LeveledItem Property pTGGoldStage01  Auto  
LeveledItem Property pTGGoldStage02  Auto  
LeveledItem Property pTGGoldStage03  Auto  
LeveledItem Property pTGGoldStage04  Auto  
ObjectReference Property pFenceChestTonilia  Auto
ObjectReference Property pFenceChestEndon Auto
ObjectReference Property pFenceChestEnthir Auto
ObjectReference Property pFenceChestGulumEi Auto
ObjectReference Property pFenceChestMallus Auto
ObjectReference Property pFenceChestNiranye Auto
ObjectReference Property pFenceChestCaravan01 Auto
ObjectReference Property pFenceChestCaravan02 Auto
ObjectReference Property pFenceChestCaravan03 Auto
Faction Property pJobMerchant Auto
Faction Property pJobApoth Auto
Faction Property pJobSmith Auto
ReferenceAlias Property pSyndus Auto
ReferenceAlias Property pHerluin Auto
ReferenceAlias Property pArnskar Auto
ReferenceAlias Property pVanryth Auto

Function SyndusGo()

	pSyndus.GetActorRef().AddToFaction(pJobMerchant)

endFunction

Function HerluinGo()

	pHerluin.GetActorRef().AddToFaction(pJobMerchant)
	pHerluin.GetActorRef().AddToFaction(pJobApoth)

endFunction

Function ArnskarGo()

	pArnskar.GetActorRef().AddToFaction(pJobMerchant)
	pArnskar.GetActorRef().AddToFaction(pJobSmith)

endFunction

Function VanrythGo()

	pVanryth.GetActorRef().AddToFaction(pJobMerchant)
	pVanryth.GetActorRef().AddToFaction(pJobSmith)

endFunction