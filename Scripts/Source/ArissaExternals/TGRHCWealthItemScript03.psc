Scriptname TGRHCWealthItemScript03 extends ReferenceAlias  Conditional

Quest Property pTGRHCQuest Auto
TGRHCQuestScript Property pTGRHCQS Auto
ReferenceAlias Property pPitcher Auto
ReferenceAlias Property pShipModel Auto
ReferenceAlias Property pCandlestick Auto
ReferenceAlias Property pWeathItem Auto
ReferenceAlias Property pWealthItemMarker Auto

Event OnActivate(ObjectReference akActionRef)

	pWealthItemMarker.GetRef().GetLinkedRef().SendStealAlarm(Game.GetPlayer())

	if akActionRef == Game.GetPlayer()

		pWeathItem.GetRef().Disable()
		
		if pTGRHCQS.pTGRLoot03 == 1
			Game.GetPlayer().AddItem(pPitcher.GetRef())
		elseif pTGRHCQS.pTGRLoot03 == 2
			Game.GetPlayer().AddItem(pShipModel.GetRef())
		elseif pTGRHCQS.pTGRLoot03 == 3
			Game.GetPlayer().AddItem(pCandlestick.GetRef())
		endif

	pTGRHCQS.Vcount()

	pTGRHCQS.pTGRLooted03 = 1

	endif

EndEvent