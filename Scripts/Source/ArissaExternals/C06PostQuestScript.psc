Scriptname C06PostQuestScript extends Quest conditional

CompanionsHousekeepingScript Property trackingScript auto
bool Property AelaShouldFG auto conditional


int totalMinutesOfHangingOut = 10
int currentMinutesOfHangingOut = 0

Function OnUpdate()
	currentMinutesOfHangingOut += 1
	if (currentMinutesOfHangingOut >= totalMinutesOfHangingOut)
		SetStage(20)
		UnregisterForUpdate()
	endif
EndFunction
