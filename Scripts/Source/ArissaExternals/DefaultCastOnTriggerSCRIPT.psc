scriptName DefaultCastOnTriggerSCRIPT extends objectReference
{Configurable Script.  By default: when triggered, it will cast the spell from a linked ref at the triggering actor}

bool property playerOnly auto
{if true, only works on the player}
bool property doOnce auto
{fire multiple times?}
float property delayBetween auto
{seconds to wait between shots.  Only relevant if doOnce == false}
spell property mySpell auto
{spell to cast onTriggerEnter}


auto STATE active
	EVENT onTriggerEnter(ObjectReference actronaut)
		if playerOnly == true && actronaut == game.getPlayer() || playerOnly == false
			mySpell.Cast(getLinkedRef(), actronaut)
			gotoState ("inactive")  ; don't cast subsequent spells until told to do so
			if doOnce == true
				; and don't come back!
			else
				utility.wait(delayBetween)
				gotoState("active")
			endif
		endif
	endEVENT
endSTATE

STATE inactive
	; nothing happens here.
endSTATE