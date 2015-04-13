Scriptname DA01GrislyGrimoireScript extends ObjectReference  

Spell Property SoulTrap Auto

auto State waiting
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			Game.GetPlayer().AddSpell(SoulTrap)
			GoToState("allDone")
		Endif
	EndEvent

	Event OnEquipped(Actor akActor)
		If akActor == Game.GetPlayer()
			Game.GetPlayer().AddSpell(SoulTrap)
			GoToState("allDone")
		Endif
	EndEvent
endState

State allDone
	;do nothing
endState
		

