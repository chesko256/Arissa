Scriptname TGRShellScript extends Quest  Conditional

GlobalVariable Property pTGStatusCount  Auto  Conditional
int Property pTGRGFRun Auto Conditional												;1= "Gone Fishing" Radiant has been taken
int Property pTGRBERun Auto Conditional													;1= "Breaking and Entering" Radiant has been taken
int Property pTGRFORun Auto Conditional												;1= "Forgery" Radiant has been taken
int Property pTGRHCRun Auto Conditional												;1= "Housecleaning" Radiant has been taken
int Property pTGRNTRun Auto Conditional												;1= "Night on the Town" Radiant has been taken
int Property pTGRDURun Auto Conditional												;1= "Duplicity" Radiant has been taken
int Property pTGRSLRun Auto Conditional													;1= "Shoplifter" Radiant has been taken
int Property pTGRDelvinDone Auto Conditional											;1= Delvin's Radiant has been completed, but not turned in
int Property pTGRVexDone Auto Conditional												;1= Vex's Radiant has been has been completed, but not turned in
int Property pTGRDelvinRunning Auto Conditional											;1= Delvin Mallory has given the Player a Radiant Quest
int Property pTGRVexRunning Auto Conditional											;1= Vex has given the Player a Radiant Quest
int Property pTGRWhiterunCount Auto Conditional
int Property pTGRWindhelmCount Auto Conditional
int Property pTGRRiftenCount Auto Conditional
int Property pTGRMarkarthCount Auto Conditional
int Property pTGRSolitudeCount Auto Conditional
int Property pTGRFirstCap Auto Conditional
int Property pTGRCapCount  Auto  Conditional
int Property pTGRWRSaid Auto Conditional
int Property pTGRSLSaid Auto Conditional
int Property pTGRWHSaid Auto Conditional
int Property pTGRMKSaid Auto Conditional
Location Property pTGRWhiterun Auto Conditional
Location Property pTGRWindhelm Auto Conditional
Location Property pTGRRiften Auto Conditional
Location Property pTGRMarkarth Auto Conditional
Location Property pTGRSolitude Auto Conditional
Keyword Property pTGRadiantStartBE Auto Conditional
Keyword Property pTGRadiantStartDU Auto Conditional
Keyword Property pTGRadiantStartFO Auto Conditional
Keyword Property pTGRadiantStartGF Auto Conditional
Keyword Property pTGRadiantStartHC Auto Conditional
Keyword Property pTGRadiantStartNT Auto Conditional
Keyword Property pTGRadiantStartSL Auto Conditional
Quest Property pTGRBEQuest Auto Conditional
Quest Property pTGRDUQuest Auto Conditional
Quest Property pTGRFOQuest Auto Conditional
Quest Property pTGRGFQuest Auto Conditional
Quest Property pTGRHCQuest Auto Conditional
Quest Property pTGRNTQuest Auto Conditional
Quest Property pTGRSLQuest Auto Conditional
Quest Property pTGTQ01Quest Auto Conditional
Quest Property pTGTQ02Quest Auto Conditional
Quest Property pTGTQ03Quest Auto Conditional
Quest Property pTGTQ04Quest Auto Conditional
Quest Property pTGStatusQuest Auto Conditional
Quest Property pTG09Quest Auto Conditional
Quest Property pTGLead Auto Conditional
TGRShellScript Property pTGRShellScript  Auto  Conditional
GlobalVariable Property pWhiterun  Auto  
GlobalVariable Property pWindhelm  Auto  
GlobalVariable Property pSolitude  Auto  
GlobalVariable Property pMarkarth  Auto
GlobalVariable Property pTGRArrestDelvin Auto
GlobalVariable Property pTGRArrestVex Auto
GlobalVariable Property pTGRQuitVex Auto Conditional
GlobalVariable Property pTGRQuitDelvin Auto Conditional

function TGRadiantCount(Location TGRadiantCity)

	if TGRadiantCity == pTGRWhiterun
		pTGRWhiterunCount += 1
	elseif TGRadiantCity == pTGRWindhelm
		pTGRWindhelmCount += 1
	elseif TGRadiantCity == pTGRRiften
		pTGRRiftenCount += 1
	elseif TGRadiantCity == pTGRMarkarth
		pTGRMarkarthCount += 1
	elseif TGRadiantCity == pTGRSolitude
		pTGRSolitudeCount += 1
	endif

	if pTGRWhiterunCount >= 5
		if GetStageDone(160) == 0
			SetStage(160)
		endif
	endif

	if pTGRWindhelmCount >= 5
		if GetStageDone(180) == 0
			SetStage(180)
		endif
	endif

	if pTGRMarkarthCount >= 5
		if GetStageDone(190) == 0
			SetStage(190)
		endif
	endif

	if pTGRSolitudeCount >= 5
		if GetStageDone(170) == 0
			SetStage(170)
		endif
	endif

endFunction

function BEQuit()

endFunction

function TGStatusCheck()

	pTGStatusCount.Value += 1

	if pTGStatusCount.Value == 1
		pTGStatusQuest.SetStage(10)
	elseif  pTGStatusCount.Value == 2
		pTGStatusQuest.SetStage(20)
	elseif  pTGStatusCount.Value == 3
		pTGStatusQuest.SetStage(30)
	elseif  pTGStatusCount.Value >= 4
		pTGStatusQuest.SetStage(40)
	endif

endFunction

function TGLeaderCheck()

	if pTGLead.GetStageDone(200) == 0
		if pTGStatusCount.Value >= 4
			if (pTG09Quest.IsCompleted())
				SetStage(197)
			endif
		endif
	endif

endFunction

function TGArrestedCheck()

	if pTGRVexRunning == 1
		pTGRArrestVex.Value = 1
	elseif pTGRDelvinRunning == 1
		pTGRArrestDelvin.Value = 1
	endif

endFunction