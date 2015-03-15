scriptname _Arissa_TownRoamStart extends Quest

_Arissa_iNPC_Behavior property iNPCSystem auto
Quest property _Arissa_TheftQuest auto
GlobalVariable property GameHour auto
ObjectReference property _Arissa_ArmorStorageRef auto

Event OnInit()
	if iNPCSystem.IsTownRoaming
		int iTimeToWait = 24 - GameHour.GetValueInt()
		;iNPCSystem.iNPC.GetActorRef().RemoveAllItems(_Arissa_ArmorStorageRef)
		RegisterForSingleUpdateGameTime(iTimeToWait)
		;debug.trace("[Arissa] Starting theft in " + iTimeToWait + " hours.")
	endif
endEvent

Event OnUpdateGameTime()
	;Randomly start theft scene based on conditions
	if iNPCSystem.IsTownRoaming
		if iNPCSystem.ArissaTalkedAbout_TownTheft == false
			iNPCSystem.ArissaHasStolen = true
			_Arissa_TheftQuest.Start()
		else
			iNPCSystem.ArissaHasStolen = true
		endif
	endif
endEvent