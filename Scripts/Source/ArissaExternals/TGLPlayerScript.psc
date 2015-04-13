Scriptname TGLPlayerScript extends ReferenceAlias  Conditional

GlobalVariable Property pDayStored Auto
GlobalVariable Property pGameDaysPassed Auto
GlobalVariable Property pTick Auto
int Property pStart Auto
Quest Property pTGLucreQuest Auto
Location Property pFlagon Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	
	if pStart == 0
		pDayStored.SetValueInt(pGameDaysPassed.GetValueInt() + 3)
		pStart = 1
	elseif pStart == 1
		if akNewLoc != pFlagon
			if pGameDaysPassed.Value >= pDayStored.Value
				pTGLucreQuest.Stop()
				pTick.SetValueInt(1)
				pStart = 2
			endif
		endif
	endif

endEvent