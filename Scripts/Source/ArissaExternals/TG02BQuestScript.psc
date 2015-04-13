Scriptname TG02BQuestScript extends Quest  Conditional

Quest Property pTGRShellQuest Auto Conditional
Quest Property pTGLarcenyQuest Auto Conditional
Quest Property pTG02Quest Auto Conditional
int Property pTG02BAllClear Auto Conditional
int Property pTG02BUnlock Auto Conditional
int Property pTG02BDiaVex Auto Conditional
int Property pTG02BDiaDelvin Auto Conditional
int Property pTG02BArmor Auto Conditional
int Property pTG02BArmorChoice Auto Conditional
Armor Property pTG02BBoots Auto Conditional
Armor Property pTG02BCuirass Auto Conditional
Armor Property pTG02BGauntlets Auto Conditional
Armor Property pTG02BHelmet Auto Conditional
GlobalVariable Property pTGRadiantGoVex  Auto  Conditional
GlobalVariable Property pTGRadiantGoDelvin  Auto  Conditional
Faction Property pTGFaction  Auto  Conditional
ObjectReference Property pTGDoor  Auto  Conditional
Quest Property pTG00Quest  Auto  Conditional
Quest Property pTG01Quest  Auto  Conditional

event OnUpdate()

	if pTG02BUnlock >= 2
		if pTG02BArmor == 1
			setstage(200)
		endif
	endif

endEvent
