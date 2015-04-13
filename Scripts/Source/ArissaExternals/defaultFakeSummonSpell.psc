scriptName defaultFakeSummonSpell extends Actor
{A script to 'fake' summoning and banishing actors. By default, just 'summons' on activation, although optional Summon/Banish functions exist for more scripted use.}

Activator property summonFX Auto
Activator property banishFX Auto
bool property summoned = False Auto

auto State Waiting
	Event OnActivate(ObjectReference or)
		if (or != Game.GetPlayer())
			GoToState("Done")
			Summon()
		EndIf
	EndEvent
EndState

state Done
	Event OnActivate(ObjectReference or)
		;Do nothing.
	EndEvent
EndState


;Optional way to trigger the Summon FX in more scripted situations.
Event Summon()
	if (!Self.IsDead() && !summoned)
		Self.PlaceAtMe(SummonFX)
		Utility.Wait(1)
		Self.Enable(True)
		summoned = True
	EndIf
EndEvent

;Optional way to trigger the Banish FX in more scripted situations.
Event Banish()
	if (!Self.IsDead() && summoned)
		Self.PlaceAtMe(BanishFX)
		Self.Disable(True)
		summoned = False
	EndIf
EndEvent