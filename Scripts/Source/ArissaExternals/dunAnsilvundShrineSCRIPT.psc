scriptName dunAnsilvundShrineSCRIPT extends objectReference hidden
;
;
;==========================================================

quest property myQuest auto
referenceAlias property WhiteSoulGem auto
message property ShrineMessage1 auto
message property ShrineMessage2 auto

auto state NotActivated
	event onActivate (objectReference TriggerRef)
		if TriggerRef == game.getPlayer()
			int iButton = ShrineMessage1.Show()
			if iButton == 1
				game.GetPlayer().RemoveItem(WhiteSoulGem.GetRef())
				self.AddItem(WhiteSoulGem.GetRef())
				GoToState ("Activated")
			endif
		endif
	endevent

endstate

state Activated
	event onBeginState()
		myQuest.setStage(60)
	endevent

	Event onActivate (objectReference TriggerRef)
		if TriggerRef == game.getPlayer()
			ShrineMessage2.Show()
		endif
	endEvent
	
endstate

state Disabled
endstate
