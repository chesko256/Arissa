Scriptname TGCrownActivatorScript extends ObjectReference  Conditional

int Property pDoOnce Auto
ObjectReference Property pGemToAdd Auto
TGCrownQuestScript Property pTGCQS Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()

		Self.GetLinkedRef().SendStealAlarm(Game.GetPlayer())

		if pDoOnce == 0
			Game.GetPlayer().AddItem(pGemToAdd,1)
			pTGCQS.GemCheck()
			Disable()
			pDoOnce = 1
		endif
	endif		

EndEvent