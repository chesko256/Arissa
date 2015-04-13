scriptName dunFrostmereCryptFakeSummon extends Actor
{Variant on defaultFakeSummonSpell that takes an explosion instead of an activator.}

Explosion property summonFX Auto
Explosion property banishFX Auto
bool property summoned = False Auto
bool property shouldFadeOut = False Auto

auto State Waiting
	Event OnActivate(ObjectReference or)
		GoToState("Done")
		Summon()
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
		Self.EnableNoWait(True)
		summoned = True
	EndIf
EndEvent

;Optional way to trigger the Banish FX in more scripted situations.
Event Banish()
	if (!Self.IsDead() && summoned)
		Self.PlaceAtMe(BanishFX)
		Self.DisableNoWait(shouldFadeOut)
		summoned = False
	EndIf
EndEvent