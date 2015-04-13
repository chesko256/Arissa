scriptName DefaultCastFromLinkOnActivateSCRIPT extends objectReference
{Configurable Custom Script.  Be default: when triggered, it will cast the spell from a linked ref at the triggering actor}

bool property playerOnly auto
{if true, only works on the player}
bool property doOnce auto
{fire multiple times?}
float property delayBetween auto
{seconds to wait between shots.  Only relevant if doOnce == false}
spell property mySpell auto
{spell to cast onTriggerEnter}


auto STATE active
	EVENT onActivate(ObjectReference actronaut)
		if playerOnly == true && actronaut == game.getPlayer() || playerOnly == false
; 			debug.trace("Casting: " + mySpell + " from " + getLinkedRef())
			mySpell.Cast(getLinkedRef())
			gotoState ("inactive")  ; don't cast subsequent spells until told to do so
			if doOnce == true
				; and don't come back!
			else
				utility.wait(delayBetween)
				gotoState("active")
; 				debug.trace("Casting from " + getLinkedRef() + " available again")
			endif
		endif
	endEVENT
endSTATE

STATE inactive
	; nothing happens here.
endSTATE