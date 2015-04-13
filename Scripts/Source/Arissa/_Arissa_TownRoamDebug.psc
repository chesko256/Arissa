Scriptname _Arissa_TownRoamDebug extends Quest  

ReferenceAlias property Arissa auto
LocationAlias property Shop1 auto
LocationAlias property Shop2 auto
LocationAlias property Tavern auto

Event OnInit()
	if Arissa.GetActorReference()
		debug.trace("[Arissa] Arissa: " + Arissa.GetActorReference())
	endif
	if Shop1
		debug.trace("[Arissa] Shop1: " + Shop1.GetLocation())
	endif
	if Shop2
		debug.trace("[Arissa] Shop2: " + Shop2.GetLocation())
	endif
	if Tavern
		debug.trace("[Arissa] Tavern: " + Tavern.GetLocation())
	endif
endEvent