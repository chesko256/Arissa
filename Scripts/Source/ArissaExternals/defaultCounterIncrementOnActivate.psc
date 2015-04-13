ScriptName defaultCounterIncrementOnActivate extends ObjectReference
{On activation, casts the linkedref to a defaultCounter and increments it.}

import game
import debug

Keyword property counterLinkedRefName Auto
{The name of the LinkedRef to the Counter. Defaults to the unnamed linkedref.}

bool property toggle =  True Auto
{Defaults to true. If true, each activation of this particular object will alternate between incrementing and decremeting the counter. If false, just increments it.}

bool lastActivationIncremented = False

Function onActivate(Objectreference activator)
	if (toggle)
		if (lastActivationIncremented)
			(Self.GetLinkedRef(counterLinkedRefName) As defaultCounter).Decrement()
			lastActivationIncremented = False
		Else
			(Self.GetLinkedRef(counterLinkedRefName) As defaultCounter).Increment()
			lastActivationIncremented = True
		EndIf
	Else
		(Self.GetLinkedRef(counterLinkedRefName) As defaultCounter).Increment()
	EndIf
EndFunction