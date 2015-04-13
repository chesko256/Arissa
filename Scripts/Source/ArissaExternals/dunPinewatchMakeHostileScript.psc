scriptName dunPinewatchMakeHostileScript extends objectReference
{a script used to make the owner of pinewatch hostile once you open the secret door}

bool Property pBribed Auto Conditional

objectReference property myActor auto
faction property myFaction auto

string property sActorVariable = "Variable01"  auto hidden
{By default, this property is set to Variable01.}

float property fActorVariable = 1.0 auto hidden
{By default this property is set to 1.} 

float property fAggression = 2.0 auto hidden

auto state waiting
	event onActivate(objectReference triggerRef)
		if !pBribed
	 		if myActor && myFaction
				goToState("Complete")
				(myActor as actor).addtoFaction(myFaction)
				(myActor as actor).setAV(sActorVariable, fACtorVariable)
				(myActor as actor).setAV("Aggression", fAggression)
				(myActor as actor).evaluatePackage()
			else
; 				debug.Trace(myActor + " could not be added to faction " + myFaction)
			endif
		endif
	endEvent
endState

state Complete
endState
		