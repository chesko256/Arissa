scriptName trapMagicLoot extends objectReference
;
;
;===============================================

message property DisarmTrapMessage auto
message property RearmTrapMessage auto

magicTrap trapSelf

event onInit()
	trapSelf = ((self  as objectReference) as magicTrap)
endEvent

auto state waiting
	event onActivate (objectReference TriggerRef)
		if TriggerRef == game.getPlayer()
			int iButton = DisarmTrapMessage.Show()
			if iButton == 1
				;trapSelf = ((self  as objectReference) as magicTrap)
				trapSelf.GoToState("Disarmed")
				;game.GetPlayer().AddItem(SoulGem.GetRef())
				;self.AddItem(SoulGem.GetRef())
				GoToState ("disarmed")
			endif
		endif
	endevent
endState



state disarmed
	event onActivate (objectReference TriggerRef)
		if TriggerRef == game.getPlayer()
			int iButton = RearmTrapMessage.Show()
			if iButton == 1
				;trapSelf = ((self  as objectReference) as magicTrap)
				trapSelf.GoToState("Idle")
				;game.GetPlayer().RemoveItem(WhiteSoulGem.GetRef())
				;self.AddItem(WhiteSoulGem.GetRef())
				GoToState ("waiting")
			endif
		endif
	endevent
endState

