Scriptname TGRHCWealthItemScript extends ReferenceAlias  Conditional

Quest Property pTGRHCQuest Auto
TGRHCQuestScript Property pTGRHCQS Auto
ReferenceAlias Property pHorn Auto
ReferenceAlias Property pFlagon Auto
ReferenceAlias Property pWeathItem Auto
ReferenceAlias Property pWealthMarker Auto

Event OnActivate(ObjectReference akActionRef)

	pWealthMarker.GetRef().GetLinkedRef().SendStealAlarm(Game.GetPlayer())

	if akActionRef == Game.GetPlayer()

		pWeathItem.GetRef().Disable()
		
		if pTGRHCQS.pTGRLoot01 == 1
			Game.GetPlayer().AddItem(pHorn.GetRef())
		elseif pTGRHCQS.pTGRLoot01 == 2
			Game.GetPlayer().AddItem(pFlagon.GetRef())
		endif

	pTGRHCQS.Vcount()

	pTGRHCQS.pTGRLooted01 = 1

	endif

EndEvent