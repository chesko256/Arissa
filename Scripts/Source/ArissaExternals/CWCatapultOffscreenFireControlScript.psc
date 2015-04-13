Scriptname CWCatapultOffscreenFireControlScript extends ObjectReference  
{Controls the offscreen firing scripting. Set properties on the CWCatapultScript.}

;Constants
string OffScreenFireModeOff = "OffScreenFireModeOff"
string OffScreenFireModeWaitingToFire = "OffScreenFireModeWaitingToFire"
string OffScreenFireModeBusyFiring = "OffScreenFireModeBusyFiring"


auto state OffScreenFireModeOff
	Event OnUpdate()
; 		CWScript.Log("CWCatapultOffscreenFireControlScript", self + "OffScreenFireModeOff OnUpdate() doing nothing.")
	EndEvent
EndState 

state OffScreenFireModeBusyFiring
	Event OnUpdate()
; 		CWScript.Log("CWCatapultOffscreenFireControlScript", self + "OffScreenFireModeBusyFiring OnUpdate() doing nothing.")
	EndEvent
EndState

state OffScreenFireModeWaitingToFire
	Event OnUpdate()
		GoToState(OffScreenFireModeBusyFiring)
		UnregisterForUpdate()


		CWCatapultScript Cs = (self as ObjectReference) as CWCatapultScript
		
; 		CWScript.Log("CWCatapultOffscreenFireControlScript", self + "OffScreenFireModeWaitingToFire OnUpdate() going to state OffScreenFireModeBusyFiring and possibly firing strike if in correct phase ")
	
		if Cs.UseCWCatapultStrikeSpawners == True
			if Cs.UseCWCatapultStrikeSpawners == True	;in case we turned that off during the wait
				if Cs.CWBattlePhase.GetValue() == 0 && GetLinkedRef(Cs.CW1)
; 					CWScript.Log("CWCatapultOffscreenFireControlScript", self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(Cs.CW1))
					(GetLinkedRef(Cs.CW1) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
				elseif Cs.CWBattlePhase.GetValue() == 1 && GetLinkedRef(Cs.CW1)
; 					CWScript.Log("CWCatapultOffscreenFireControlScript", self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(Cs.CW1))
					(GetLinkedRef(Cs.CW1) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
				elseif Cs.CWBattlePhase.GetValue() == 2 && GetLinkedRef(Cs.CW2)
; 					CWScript.Log("CWCatapultOffscreenFireControlScript", self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(Cs.CW2))
					(GetLinkedRef(Cs.CW2) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
				elseif Cs.CWBattlePhase.GetValue() == 3 && GetLinkedRef(Cs.CW3)
; 					CWScript.Log("CWCatapultOffscreenFireControlScript", self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(Cs.CW3))
					(GetLinkedRef(Cs.CW3) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
				elseif Cs.CWBattlePhase.GetValue() == 4 && GetLinkedRef(Cs.CW4)
; 					CWScript.Log("CWCatapultOffscreenFireControlScript", self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(Cs.CW4))
					(GetLinkedRef(Cs.CW4) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
				elseif Cs.CWBattlePhase.GetValue() == 5 && GetLinkedRef(Cs.CW5)
; 					CWScript.Log("CWCatapultOffscreenFireControlScript", self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(Cs.CW5))
					(GetLinkedRef(Cs.CW5) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
				elseif GetLinkedRef(Cs.CWAllPhases)
; 					CWScript.Log("CWCatapultOffscreenFireControlScript", self + "startSpawningCatapultStrikes() Calling CallCatapultStrike() on " + GetLinkedRef(Cs.CWAllPhases))
					(GetLinkedRef(Cs.CWAllPhases) as CWCatapultStrikeSpawnerScript).CallCatapultStrike()
				
				Else
; 					CWScript.Log("CWCatapultOffscreenFireControlScript", self + "startSpawningCatapultStrikes() NOT calling CallCatapultStrike() because CWBattlePhase == x which doesn't match a GetLinkedRef CWx", 1)
				EndIf
				
				GoToState(OffScreenFireModeWaitingToFire)
				RegisterForUpdate(Cs.GetTimeToNextLaunch())
			
			EndIf
		
		EndIf

	EndEvent
	
EndState


function StopOffscreenFiring()
	GoToState(OffScreenFireModeOff)
; 	CWScript.Log("CWCatapultOffscreenFireControlScript", self + "StopOffscreenFiring() so went to state OffscreenFireModeOff, calling UnRegisterForUpdate()")
	UnregisterForUpdate()
EndFunction

function StartOffscreenFiring(float LaunchTime)
	GoToState(OffScreenFireModeWaitingToFire)
	RegisterForUpdate(LaunchTime)
; 	CWScript.Log("CWCatapultOffscreenFireControlScript", self + "StartOffscreenFiring() so went to state OffScreenFireModeWaitingToFire")
EndFunction
