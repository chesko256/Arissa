Scriptname C03PostQuestScript extends Quest conditional

CompanionsHousekeepingScript Property trackingScript auto
bool Property CompanionsKnowAboutSkjor = false auto conditional


int totalMinutesOfMourning = 5
int currentMinutesOfMourning = 0

Function OnUpdate()
	currentMinutesOfMourning += 1
	if (currentMinutesOfMourning >= totalMinutesOfMourning)
		SetStage(20)
		UnregisterForUpdate()
	endif
EndFunction
