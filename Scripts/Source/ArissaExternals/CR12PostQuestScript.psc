Scriptname CR12PostQuestScript extends Quest  

Quest Property CentralQuest auto

ReferenceAlias Property KneelMarker auto
ObjectReference Property KneelMarker1 auto
ObjectReference Property KneelMarker2 auto
ObjectReference Property KneelMarker3 auto

Event OnUpdateGameTime()
	Stop()
EndEvent

Function Setup()
	int totemIndex = (CentralQuest as CompanionsHousekeepingScript).TotemsFound

	if     (totemIndex == 1)
		KneelMarker.ForceRefTo(KneelMarker1)
	elseif (totemIndex == 2)
		KneelMarker.ForceRefTo(KneelMarker2)
	else
		KneelMarker.ForceRefTo(KneelMarker3)
	endif

	RegisterForUpdateGameTime(2)
EndFunction
