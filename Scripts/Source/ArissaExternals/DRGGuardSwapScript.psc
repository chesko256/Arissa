Scriptname DRGGuardSwapScript extends ReferenceAlias  

Keyword Property CWOwner Auto
Location Property RiftenLocation Auto
int Property Allegience Auto
Quest Property CWSiege Auto
LocationAlias Property CWSiegeCity Auto

Event OnCellLoad()

	if RiftenLocation.GetKeywordData(CWOwner) != Allegience || (CWSiege.IsRunning() && CWSiegeCity.GetLocation() == RiftenLocation)
		GetRef().Disable()
	else
		GetRef().Enable()
	endif

endEvent