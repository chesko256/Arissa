scriptName defaultFakeRezSpell extends defaultFakeSummonSpell
{A script to 'fake' resurrecting and re-killing actors. Derived from defaultFakeSummonSpell, but more useful with undead.}

Spell property dunReanimateSelf Auto

;Optional way to trigger the Summon FX in more scripted situations.
Event Summon()
; 	;Debug.Trace("Resurrecting")
	if (Self.IsDead())
		dunReanimateSelf.Cast(Self, Self)
	EndIf
EndEvent

Event Banish()
	Self.Kill()
EndEvent