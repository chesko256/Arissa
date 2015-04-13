Scriptname TGRHCQuestScript extends Quest  Conditional

int Property pTGRHCFail Auto Conditional
int Property pTGRHCTold Auto Conditional
Quest Property pTGRShellQuest Auto Conditional
Quest Property pTGRHCQuest Auto Conditional
GlobalVariable Property pTGRHCValuablesStolen Auto Conditional
GlobalVariable Property pTGRHCValuablesTotal Auto Conditional
TGRQueueQuestScript Property pTGRQueueQuestScript Auto
int Property pTGRLoot01 Auto Conditional
int Property pTGRLoot02 Auto Conditional
int Property pTGRLoot03 Auto Conditional
int Property pTGRLooted01 Auto Conditional
int Property pTGRLooted02 Auto Conditional
int Property pTGRLooted03 Auto Conditional
Activator Property pHorn Auto Conditional
Activator Property pFlagon Auto Conditional
Activator Property pUrn Auto Conditional
Activator Property pGoblet Auto Conditional
Activator Property pPitcher Auto Conditional
Activator Property pModel Auto Conditional
Activator Property pCandle Auto Conditional
ReferenceAlias Property pWeathMarker01 Auto Conditional
ReferenceAlias Property pWeathMarker02 Auto Conditional
ReferenceAlias Property pWeathMarker03 Auto Conditional
ReferenceAlias Property pWeathItem01 Auto Conditional
ReferenceAlias Property pWeathItem02 Auto Conditional
ReferenceAlias Property pWeathItem03 Auto Conditional
ReferenceAlias Property Boss Auto Conditional
ReferenceAlias Property pHornM Auto Conditional
ReferenceAlias Property pFlagonM Auto Conditional
ReferenceAlias Property pUrnM Auto Conditional
ReferenceAlias Property pGobletM Auto Conditional
ReferenceAlias Property pPitcherM Auto Conditional
ReferenceAlias Property pModelM Auto Conditional
ReferenceAlias Property pCandleM Auto Conditional


Function VCount()

	if ModObjectiveGlobal(1, pTGRHCValuablesStolen, 10, pTGRHCValuablesTotal.value)
		SetStage(50)
	endif

EndFunction

Function Generate()

	pTGRLoot01 = Utility.RandomInt(1,2)
	pTGRLoot02 = Utility.RandomInt(1,2)		
	pTGRLoot03 = Utility.RandomInt(1,3)

	if pTGRLoot01 == 1
		 pWeathItem01.ForceRefTo( pWeathMarker01.GetRef().PlaceAtMe(pHorn))
		 pWeathItem01.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot01 == 2
		 pWeathItem01.ForceRefTo(pWeathMarker01.GetRef().PlaceAtMe(pFlagon))
		 pWeathItem01.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	endif

	if pTGRLoot02 == 1
		 pWeathItem02.ForceRefTo( pWeathMarker02.GetRef().PlaceAtMe(pUrn))
		 pWeathItem02.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot02 == 2
		 pWeathItem02.ForceRefTo( pWeathMarker02.GetRef().PlaceAtMe(pGoblet))
		 pWeathItem02.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	endif

	if pTGRLoot03 == 1
		 pWeathItem03.ForceRefTo( pWeathMarker03.GetRef().PlaceAtMe(pPitcher))
		 pWeathItem03.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot03 == 2
		pWeathItem03.ForceRefTo( pWeathMarker03.GetRef().PlaceAtMe(pModel))
		pWeathItem03.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot03 == 3
		pWeathItem03.ForceRefTo( pWeathMarker03.GetRef().PlaceAtMe(pCandle))
		pWeathItem03.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	endif

	pTGRHCQuest.SetStage(10)

endFunction

Function CleanUp()

; 	Debug.Trace(self+"StartClean")

	if Game.GetPlayer().GetItemCount(pHornM.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pHornM.GetRef())
	endif

	if Game.GetPlayer().GetItemCount(pFlagonM.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pFlagonM.GetRef())
	endif

	if Game.GetPlayer().GetItemCount(pUrnM.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pUrnM.GetRef())
	endif

	if Game.GetPlayer().GetItemCount(pGobletM.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pGobletM.GetRef())
	endif

	if Game.GetPlayer().GetItemCount(pPitcherM.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pPitcherM.GetRef())
	endif

	if Game.GetPlayer().GetItemCount(pModelM.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pModelM.GetRef())
	endif

	if Game.GetPlayer().GetItemCount(pCandleM.GetRef()) == 1
		Game.GetPlayer().RemoveItem(pCandleM.GetRef())
	endif

	pTGRHCValuablesStolen.Value = 0

; 	Debug.Trace(self+"EndClean")

endFunction