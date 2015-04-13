Scriptname FXunsommonSCRIPT extends ObjectReference  
{Plays an fx when something is unsummoned}

EffectShader Property AtronachUnsummonDeathFXS Auto

	EVENT onDying(actor myKiller)
				AtronachUnsummonDeathFXS.Play(self)
	ENDEVENT
	