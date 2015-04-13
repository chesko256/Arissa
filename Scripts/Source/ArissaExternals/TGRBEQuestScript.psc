Scriptname TGRBEQuestScript extends Quest  Conditional

int Property pTGRBEFail Auto Conditional
int Property pTGRBETold Auto Conditional
Quest Property pTGRShellQuest Auto Conditional
Quest Property pTGRBEQuest Auto Conditional
TGRQueueQuestScript Property pTGRQueueQuestScript Auto
int Property pTGRLoot01 Auto Conditional
Activator Property pHorn Auto Conditional
Activator Property pFlagon Auto Conditional
Activator Property pUrn Auto Conditional
Activator Property pGoblet Auto Conditional
Activator Property pPitcher Auto Conditional
Activator Property pModel Auto Conditional
Activator Property pCandle Auto Conditional
ReferenceAlias Property Alias_ItemToGet Auto Conditional
ReferenceAlias Property Alias_ItemMarker Auto Conditional
ReferenceAlias Property Boss Auto Conditional
ReferenceAlias Property pHornM Auto Conditional
ReferenceAlias Property pFlagonM Auto Conditional
ReferenceAlias Property pUrnM Auto Conditional
ReferenceAlias Property pGobletM Auto Conditional
ReferenceAlias Property pPitcherM Auto Conditional
ReferenceAlias Property pModelM Auto Conditional
ReferenceAlias Property pCandleM Auto Conditional
GlobalVariable Property pTGRQuitVex Auto Conditional

Function Generate()

	pTGRLoot01 = Utility.RandomInt(1,7)

	if pTGRLoot01 == 1
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetRef().PlaceAtMe(pHorn))
		Alias_ItemToGet.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot01 == 2
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetRef().PlaceAtMe(pFlagon))
		Alias_ItemToGet.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot01 == 3
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetRef().PlaceAtMe(pUrn))
		Alias_ItemToGet.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot01 == 4
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetRef().PlaceAtMe(pGoblet))
		Alias_ItemToGet.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot01 == 5
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetRef().PlaceAtMe(pPitcher))
		Alias_ItemToGet.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot01 == 6
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetRef().PlaceAtMe(pModel))
		Alias_ItemToGet.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	elseif pTGRLoot01 == 7
		Alias_ItemToGet.ForceRefTo(Alias_ItemMarker.GetRef().PlaceAtMe(pCandle))
		Alias_ItemToGet.GetRef().SetActorOwner(Boss.GetActorRef().GetActorBase())
	endif

	pTGRBEQuest.SetStage(10)

endFunction

Function CleanUp()

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

endFunction