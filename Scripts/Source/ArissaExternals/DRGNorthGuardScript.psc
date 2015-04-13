Scriptname DRGNorthGuardScript extends ReferenceAlias  Conditional

Quest Property pDRGQuest Auto Conditional
TG00QuestScript Property pTG00QS  Auto  Conditional

Event OnDeath(Actor akKiller)

	pDRGQuest.SetStage(20)
	pTG00QS.pTG00GateGuardKilled = 1

endEvent

