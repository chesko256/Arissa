Scriptname TG08AQuestScript extends Quest  Conditional

int Property pTG08AKarliahMoved Auto Conditional
int Property pTG08ABrynjolfMoved Auto Conditional
int Property pTG08AKarliahFG01 Auto Conditional
int Property pTG08AKarliahFG02 Auto Conditional
int Property pTG08ABrynjolfFG01 Auto Conditional
int Property pTG08ASeq Auto Conditional
int Property pTG08AHeadEquip Auto Conditional
int Property pTG08ABodyEquip Auto Conditional
int Property pTG08AHandEquip Auto Conditional
int Property pTG08AFeetEquip Auto Conditional
int Property pTG08AMasterEquip Auto Conditional
int Property pTG08AKarliahFG03 Auto Conditional
int Property pTG08ADLG01 Auto Conditional
int Property pTG08AReady Auto Conditional
int Property pTG08ADoneMoving Auto Conditional
int Property pTG08AInPlace Auto Conditional
int Property pTG08ANPCCircle Auto Conditional
int Property pTG08ADia Auto Conditional
int Property pTG08AStoneDone Auto Conditional
Quest Property pTG08AQuest Auto Conditional
Quest Property pTG08BQuest Auto Conditional
ObjectReference Property pTG08AKarliahMeetMarker Auto Conditional
ObjectReference Property pTG08ABrynjolfMeetMarker Auto Conditional
ReferenceAlias Property pTG08AKarliahAlias Auto Conditional
ReferenceAlias Property pTG08ABrynjolfAlias Auto Conditional
Scene Property pTG08AGuildScene Auto Conditional
Scene Property pTG08AHallScene Auto Conditional
Scene Property pTG08AOathScene Auto Conditional
ReferenceAlias Property pTG08ADoorAlias Auto Conditional
Faction Property pTG08ATGFaction  Auto  Conditional
Outfit Property pTG08ANGaleOutfit  Auto  Conditional

;This block moves Brynjolf and Karliah to the waiting locations outside of Nightingale Hall

Event OnUpdate()

	if pTG08AQuest.GetStage() == 20
		if pTG08AKarliahMoved == 0
			if Game.GetPlayer().GetParentCell() != pTG08AKarliahAlias.GetRef().GetParentCell()
				pTG08AKarliahAlias.GetRef().MoveTo(pTG08AKarliahMeetMarker)
				pTG08ADoneMoving += 1
				pTG08AKarliahMoved = 1
			endif
		endif
	endif

	if pTG08AQuest.GetStage() == 20
		if pTG08ABrynjolfMoved == 0
			if Game.GetPlayer().GetParentCell() != pTG08ABrynjolfAlias.GetRef().GetParentCell()
				pTG08ABrynjolfAlias.GetRef().MoveTo(pTG08ABrynjolfMeetMarker)
				pTG08ADoneMoving += 1
				pTG08ABrynjolfMoved = 1
			endif
		endif
	endif

	if pTG08AQuest.GetStage() == 20
		if pTG08ADoneMoving >= 2
			setstage(25)
		endif
	endif

	if pTG08AQuest.GetStage() <= 30
		RegisterForSingleUpdate(1)
	endif
	
endEvent

Function TG08AArmor()

	if pTG08AMasterEquip == 0
		if pTG08AHeadEquip == 1 && pTG08ABodyEquip == 1 && pTG08AHandEquip == 1 && pTG08AFeetEquip == 1
			pTG08AMasterEquip = 1
			TG08AArmoredReady()
		endif
	endif

EndFunction

Function TG08AArmoredReady()

	if pTG08AMasterEquip == 1
		if pTG08AQuest.GetStageDone(42) == 1
			if pTG08AQuest.GetStage() < 45	
				pTG08AQuest.SetStage(45)
			endif
		endif
	endif

endFunction

Function TG08ASuitUp()

	pTG08AInPlace += 1

	if pTG08AInPlace >= 2
		if GetStageDone(42) == 0
			SetStage(42)
		endif
	endif

EndFunction