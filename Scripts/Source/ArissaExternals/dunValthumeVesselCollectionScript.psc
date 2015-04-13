Scriptname dunValthumeVesselCollectionScript extends objectReference
import Debug

GlobalVariable Property dunValthumeVesselCollectedCount Auto
Quest Property dunValthumeQST auto


Event OnActivate(ObjectReference akActionRef)
	dunValthumeQST.ModObjectiveGlobal( 1, dunValthumeVesselCollectedCount, 5, 3, true, true )
	if (dunValthumeVesselCollectedCount.value >= 3)
		dunValthumeQST.setstage(10)
	endif
	
EndEvent