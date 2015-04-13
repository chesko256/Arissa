Scriptname DialogueShorsStoneQuestScript extends Quest  Conditional

int Property pSSDDungeonReward = 100 Auto Conditional
int Property pSSDPickAxeReward = 100 Auto Conditional
int Property pSSDDeliveryReward = 50 Auto Conditional
int Property pSSDDungeonDone Auto Conditional
int Property pSSDPickaxeDone Auto Conditional
int Property pSSDDeliveryDone Auto Conditional
int Property pSSDSpidersDead Auto Conditional
MiscObject Property pSSDGold Auto Conditional
Weapon Property pSSDRocksplinter  Auto  Conditional
MiscObject Property pSSDPackageToDarkwater  Auto  Conditional
MiscObject Property pSSDPackageFromDarkwater  Auto  Conditional
Quest Property pSSDQuest Auto Conditional
GlobalVariable Property pSSDMineClear Auto Conditional

function SpiderCheck()

	pSSDSpidersDead += 1

	if pSSDSpidersDead >= 6
		pSSDDungeonDone = 1
		if pSSDQuest.GetStageDone(20) == 1
			pSSDQuest.SetStage(30)
		endif
		pSSDMineClear.Value = 1
	endif

endFunction
