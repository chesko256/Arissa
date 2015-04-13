Scriptname MG01QuestScript extends Quest  Conditional

int Property NiryaSkillVar  Auto  Conditional

int Property TolfdirResponseVar  Auto  Conditional

int Property WardGiven  Auto  Conditional

int Property NiryaSpellSuccess  Auto  Conditional


int Property PlayerHit  Auto  Conditional

int Property TimerCounter  Auto  Conditional

int Property TimerInit  Auto  Conditional

Function StartPointer()

	PointerQuest.Start()


EndFunction




Function StartPlayerHitTimer()

	While TimerInit==1
		Utility.Wait(1)
		TimerCounter += 1
		if TimerCounter == 10
			if PlayerHit == 0
				TimerInit=2
			endif
		endif
	endwhile		


EndFunction

Event OnUpdate()

	if WardSceneLoop == 1
		WardSceneLoop = 0
		WardScene.Start()
	endif


EndEvent




GlobalVariable Property FavorRewardSmall  Auto  

Quest Property PointerQuest  Auto  

int Property AncanoSceneDone  Auto  Conditional

int Property WardSceneLoop  Auto  

Scene Property WardScene  Auto
int Property NiryaRejection  Auto  Conditional

int Property NiryaSpellSold  Auto  Conditional

int Property NiryaInit  Auto  Conditional

int Property ComplainInfo  Auto  Conditional

int Property ShoutTrigger  Auto  Conditional

int Property WaitingForShout  Auto  Conditional

int Property FaraldaProgress  Auto  Conditional

int Property FaraldaComplainInfo  Auto  Conditional

int Property ApprenticeKilled  Auto  Conditional

Int Property TestRandomVar  Auto  Conditional
