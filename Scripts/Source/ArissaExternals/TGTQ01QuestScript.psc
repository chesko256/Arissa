Scriptname TGTQ01QuestScript extends Quest  Conditional

int Property pTGTQ01RhorlakDone  Auto  Conditional
int Property pTGTQ01RhorlakSolved Auto Conditional
ObjectReference Property pTGTQ01Mold Auto Conditional
ObjectReference Property pTGTQ01PWDoor  Auto  Conditional
Cell Property pTGTQ01Pinewatch Auto Conditional
Quest Property pTGRShellQuest Auto Conditional
ObjectReference Property pTGTQ01Enabler  Auto  Conditional

event OnUpdate()
; 	debug.trace(self + "TGTQ01 updating. Checking to see if Player is in Pinewatch")
	if getstage() == 20
		if Game.GetPlayer().GetParentCell() == pTGTQ01Pinewatch
; 			debug.trace(self + "TGTQ01 updating. Player is in Pinewatch")
			setstage(30)
		else
; 			debug.trace(self + "TGTQ01 updating. Player is NOT in Pinewatch. Continuing Update loop")
			RegisterforSingleUpdate(5)
		endif
	endif

endEvent


ObjectReference Property pTGTQ01DoorHostilityObject  Auto  
