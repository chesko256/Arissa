ScriptName defaultCounterIncrementOnDeath extends Actor
{On death, casts the linkedref to a defaultCounter and increments it.}

import game
import debug

Keyword property counterLinkedRefName Auto
{The name of the LinkedRef to the Counter. Defaults to the unnamed linkedref.}

Function onDeath(Actor akKiller)
; 	;Debug.Trace("onDeath() Event Received")
	(Self.GetLinkedRef(counterLinkedRefName) As defaultCounter).Increment()
EndFunction
	