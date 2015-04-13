Scriptname TGRHCWealthItemScript02 extends ReferenceAlias  Conditional

Quest Property pTGRHCQuest Auto
TGRHCQuestScript Property pTGRHCQS Auto
ReferenceAlias Property pUrn Auto
ReferenceAlias Property pGoblet Auto
ReferenceAlias Property pWeathItem Auto
ReferenceAlias Property pWealthItemMarker Auto

Event OnActivate(ObjectReference akActionRef)

	pWealthItemMarker.GetRef().GetLinkedRef().SendStealAlarm(Game.GetPlayer())

	if akActionRef == Game.GetPlayer()

		pWeathItem.GetRef().Disable()
		
		if pTGRHCQS.pTGRLoot02 == 1
			Game.GetPlayer().AddItem(pUrn.GetRef())
		elseif pTGRHCQS.pTGRLoot02 == 2
			Game.GetPlayer().AddItem(pGoblet.GetRef())
		endif

	pTGRHCQS.Vcount()

	pTGRHCQS.pTGRLooted02 = 1

	endif

EndEvent