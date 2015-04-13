Scriptname TGRNTQuestScript extends Quest  Conditional

int Property pTGRNTFail Auto Conditional
int Property pTGRNTTold Auto Conditional
int Property pTotalStolen Auto Conditional
int Property pCurrentItemValue Auto Conditional
Quest Property pTGRShellQuest Auto Conditional
Quest Property pTGRNTQuest Auto Conditional
LocationAlias Property pTGRNCityAlias Auto Conditional
GlobalVariable Property pTGRNGold Auto Conditional
GlobalVariable Property pTGRNStoredMarkarth Auto Conditional
GlobalVariable Property pTGRNStoredSolitude Auto Conditional
GlobalVariable Property pTGRNStoredRiften Auto Conditional
GlobalVariable Property pTGRNStoredWindhelm Auto Conditional
GlobalVariable Property pTGRNStoredWhiterun Auto Conditional
GlobalVariable Property pTGRNWin Auto Conditional
Location Property pMarkarthLocation Auto Conditional
Location Property pRiftenLocation Auto Conditional
Location Property pSolitudeLocation Auto Conditional
Location Property pWindhelmLocation Auto Conditional
Location Property pWhiterunLocation Auto Conditional
Faction Property pCrimeMarkarth Auto Conditional
Faction Property pCrimeRiften Auto Conditional
Faction Property pCrimeSolitude Auto Conditional
Faction Property pCrimeWindhelm Auto Conditional
Faction Property pCrimeWhiterun Auto Conditional


Function SetupGlobals()

	if pTGRNCityAlias.GetLocation() == pMarkarthLocation
		 pTGRNStoredMarkarth.Value = pCrimeMarkarth.GetStolenItemValueNoCrime()

	elseif pTGRNCityAlias.GetLocation() == pRiftenLocation
		 pTGRNStoredRiften.Value = pCrimeRiften.GetStolenItemValueNoCrime()

	elseif pTGRNCityAlias.GetLocation() == pSolitudeLocation
		 pTGRNStoredSolitude.Value = pCrimeSolitude.GetStolenItemValueNoCrime()

	elseif pTGRNCityAlias.GetLocation() == pWindhelmLocation
		 pTGRNStoredWindhelm.Value = pCrimeWindhelm.GetStolenItemValueNoCrime()

	elseif pTGRNCityAlias.GetLocation() == pWhiterunLocation
		 pTGRNStoredWhiterun.Value = pCrimeWhiterun.GetStolenItemValueNoCrime()

	endif

EndFunction


Function SCount()
	
; 	debug.trace (self + "SCount")

	if pTGRNCityAlias.GetLocation() == pMarkarthLocation
		 checkTotals(pMarkarthLocation, pCrimeMarkarth, pTGRNStoredMarkarth)

	elseif pTGRNCityAlias.GetLocation() == pRiftenLocation
		 checkTotals(pRiftenLocation, pCrimeRiften, pTGRNStoredRiften)

	elseif pTGRNCityAlias.GetLocation() == pSolitudeLocation
		checkTotals(pSolitudeLocation, pCrimeSolitude, pTGRNStoredSolitude)

	elseif pTGRNCityAlias.GetLocation() == pWindhelmLocation
		checkTotals(pWindhelmLocation, pCrimeWindhelm, pTGRNStoredWindhelm)

	elseif pTGRNCityAlias.GetLocation() == pWhiterunLocation
		checkTotals(pWhiterunLocation, pCrimeWhiterun, pTGRNStoredWhiterun)

	endif

	if pTGRNTQuest.GetStage() < 50 && pTotalStolen >= pTGRNGold.GetValueInt()
		pTGRNTQuest.SetStage(50)
	endif

EndFunction


function checkTotals(location CityLocation, Faction CrimeFaction, GlobalVariable StoredGlobal)

; 	debug.trace(self + "checkTotals(" + CityLocation + ", " + CrimeFaction  )

	int StolenItemValueNoCrime = CrimeFaction.GetStolenItemValueNoCrime() 

	int StoredGlobalValue =  StoredGlobal.GetValueInt()

; 	debug.trace(self + "checkTotals(): pCurrentItemValue[" +pCurrentItemValue + "] = StolenItemValueNoCrime [" + StolenItemValueNoCrime  + "'] StoredGlobalValue [" + StoredGlobalValue  + "]" )
	
	pCurrentItemValue = StolenItemValueNoCrime - StoredGlobalValue 

	StoredGlobal.Value = StolenItemValueNoCrime

	pTotalStolen += pCurrentItemValue 

endfunction
