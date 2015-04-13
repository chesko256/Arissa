Scriptname TG00QuestScript extends Quest  Conditional
{Main Quest Script for TG00}

ReferenceAlias Property pTG00BrynjolfAlias  Auto  Conditional
Potion Property pTG00Blood Auto Conditional
MiscObject Property pTG00Gold Auto Conditional
Armor Property pTG00MdesiRing Auto Conditional
int Property pTG00Mover  Auto  Conditional
int Property pTG00SceneBoot  Auto  Conditional
int Property pTG00Help Auto Conditional
int Property pTG00FGDone01 Auto Conditional
int Property pTG00HaveRing	Auto Conditional
int Property pTG00Reward = 100 Auto  Conditional
int Property pTG00Dialogue01 Auto Conditional
int Property pTG00Killer Auto Conditional
int Property pTG00GateGuardKilled Auto Conditional
int Property pTG00BrynPass Auto Conditional
int Property pTG00ArrestStopper Auto Conditional
float Property pTG00TooMuchTime Auto Conditional
Quest Property pTG01  Auto
Quest Property pTG00SP  Auto
Quest Property pTG00SPArrest Auto
Quest Property pTG00 Auto
GlobalVariable Property pTGFailure  Auto  Conditional
GlobalVariable Property GameDaysPassed Auto
Keyword Property pTG00CWOwner Auto Conditional
ObjectReference Property pTG00GuardImperial Auto Conditional
ObjectReference Property pTG00GuardStormcloak Auto Conditional
Quest Property pTG00MiscHandler  Auto  Conditional


Event OnUpdate()

	if pTG00.GetStage() >= 10 && pTG00.GetStage() < 30
		if GameDaysPassed.Value > pTG00TooMuchTime
			SetStage(40)
		endif
	endif

endEvent


Function SetupTimer()

	pTG00TooMuchTime = GameDaysPassed.Value + 0.5

endFunction
