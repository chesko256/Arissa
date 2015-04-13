Scriptname TG01QuestScript extends Quest  Conditional

GlobalVariable Property pTG01Failure Auto Conditional
int Property pTG01IntroGiven  Auto  Conditional
int Property pTG01GotCash  Auto  Conditional
int Property pTG01SmashUrn  Auto  Conditional
int Property pTG01GotStatue  Auto  Conditional
int Property pTG01LoverFound	Auto Conditional
int Property pTG01BrynjolfMove Auto Conditional
int Property pTG01QuestFail Auto Conditional
int Property pTG01Reward = 100 Auto  Conditional
int Property pTG01KeeravaGold = 100 Auto  Conditional
int Property pTG01BersiGold = 100 Auto  Conditional
int Property pTG01HaelgaGold = 100 Auto  Conditional
int Property pTG01Dialogue01 Auto Conditional
int Property pTG01KFirst Auto Conditional
int Property pTG01BersiWarned Auto Conditional
int Property pTG01DrifaWarned Auto Conditional
int Property pTG01KeeravaWarned Auto Conditional
int Property pTG01HaelgaWarned Auto Conditional
int Property pTG01DrifaDone Auto Conditional
int Property pTG01BersiPaid Auto Conditional
int Property pTG01KeeravaPaid Auto Conditional
int Property pTG01HaelgaPaid Auto Conditional
int Property pTG01Dia01 Auto Conditional
int Property pTG01BrynMoved Auto Conditional
int Property pTG01BrynFG01 Auto Conditional
int Property pTG01BersiHandled Auto Conditional
Quest Property pTG02  Auto  Conditional
MiscObject Property pTG01HaelgaStatue  Auto  Conditional
MiscObject Property pTG01Gold  Auto
ObjectReference Property pTG01BrynjolfStartMarker  Auto  Conditional
ObjectReference Property pTG01DoorBeforeOutside Auto Conditional
ObjectReference Property pTG01DoorBeforeInside Auto Conditional
ObjectReference Property pTG01DoorAfterOutside Auto Conditional
ObjectReference Property pTG01DoorAfterInside Auto Conditional
DialogueRiftenQuestScript Property pDRQS  Auto  Conditional

Function CheckJobs()

;When the Player has recieved all 3 payments, set the final stage to return to Brynjolf

	if getstage() < 50
		if pTG01GotCash >= 3
			setstage(50)
		endif
	endif

endFunction

