scriptname defaultAOEpushOnActivateDoOnce extends objectReference

explosion property fakeForceBallNudge auto
{select the appropriate strength explosion for your reference}
bool property enablePush auto
{check only if you want to do the nudge when activated}

EVENT onLoad()

	if enablePush == TRUE
		blockActivation()
	endif

endEVENT

auto STATE active
	EVENT onActivate(objectREference actronaut)
	
		if enablePush == TRUE
			setOpen()
			placeatme(fakeForceBallNudge)
			blockActivation(FALSE)
		endif
		gotoState("inactive")

	endEVENT
endSTATE

STATE inactive
endSTATE	

