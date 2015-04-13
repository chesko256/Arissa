Scriptname ChangeFactionsOnActivate extends ObjectReference  

objectReference property RefToGovern auto
faction property factionToLeave auto
faction property factionToJoin auto
bool property FrenzyOnActivate = FALSE auto
bool property beenActivated auto hidden

EVENT onActivate(objectReference akActivatingRef)
	if !beenActivated
		beenActivated = TRUE
		if factionToLeave
			(refToGovern as actor).removeFromFaction(factionToLeave)
		endif
		if factionToJoin
			(refToGovern as actor).addToFaction(factionToJoin)
		endif
		if FrenzyOnActivate
			(refToGovern as actor).setAV("aggression",3)
		endif
	endif
endEVENT
