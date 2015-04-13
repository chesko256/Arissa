Scriptname TGRBEItemToGetScript extends ReferenceAlias  

Quest Property pTGRBEQuest Auto
TGRBEQuestScript Property pTGRBEQS Auto
ReferenceAlias Property pHorn Auto
ReferenceAlias Property pFlagon Auto
ReferenceAlias Property pUrn Auto
ReferenceAlias Property pGoblet Auto
ReferenceAlias Property pPitcher Auto
ReferenceAlias Property pShipModel Auto
ReferenceAlias Property pCandlestick Auto
ReferenceAlias Property pItemToGet Auto
ReferenceAlias Property pItemMarker Auto

Event OnActivate(ObjectReference akActionRef)

	pItemMarker.GetRef().GetLinkedRef().SendStealAlarm(Game.GetPlayer())

	if akActionRef == Game.GetPlayer()

		pItemToGet.GetRef().Disable()
		
		if pTGRBEQS.pTGRLoot01 == 1
			Game.GetPlayer().AddItem(pHorn.GetRef())
		elseif pTGRBEQS.pTGRLoot01 == 2
			Game.GetPlayer().AddItem(pFlagon.GetRef())
		elseif pTGRBEQS.pTGRLoot01 == 3
			Game.GetPlayer().AddItem(pUrn.GetRef())
		elseif pTGRBEQS.pTGRLoot01 == 4
			Game.GetPlayer().AddItem(pGoblet.GetRef())
		elseif pTGRBEQS.pTGRLoot01 == 5
			Game.GetPlayer().AddItem(pPitcher.GetRef())
		elseif pTGRBEQS.pTGRLoot01 == 6
			Game.GetPlayer().AddItem(pShipModel.GetRef())
		elseif pTGRBEQS.pTGRLoot01 == 7
			Game.GetPlayer().AddItem(pCandlestick.GetRef())
		endif

		if pTGRBEQuest.GetStage() < 50
			pTGRBEQuest.SetStage(50)
		endif
	endif

EndEvent