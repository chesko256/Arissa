scriptName dunDustmansCairnLever extends ObjectReference
{version of the lever script that can only be activated once}

message property cannotBeActivatedMessage auto
objectReference property myCollBox auto
objectReference property dunDustmansCairnTrapScenePrimMarker auto
objectReference property myCollBox2 auto
objectReference property dunDustmansCairnTrapScenePrim2Marker auto
objectReference property dunDustmansCairnLeverCollMarker auto
objectReference property C01CompanionTriggerBox auto
bool property secondLever auto
{if this is set, this is the second lever which should remove the collision primitive}


Scene Property AmbushScene auto
Quest Property C01 auto
ReferenceAlias Property Observer auto
Cell Property MyCell auto

Auto STATE pulledPosition
	EVENT onActivate (objectReference triggerRef)
		;C01CompanionMonitor myTriggerbox = companionTriggerBox as C01CompanionMonitor
; 		debug.Trace(self + ": my Trigger " + C01CompanionTriggerBox + " has this many companions " + C01CompanionTriggerBox.getTriggerObjectCount())
		if C01CompanionTriggerBox.getTriggerObjectCount() == 0
			
			if !secondLever
				game.DisablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = false, \
						abLooking = false, abSneaking = false, abMenu = false, abActivate = false, \
						abJournalTabs = false, aiDisablePOVType = 0)
; 				debug.Trace(self + " first lever: was activated at " + utility.getCurrentRealTime())
				;myCollBox.enableNoWait(self)
				myCollBox.SetMotionType(4)
				myCollBox.moveTo(dunDustmansCairnTrapScenePrimMarker)
				;myCollBox2.enableNoWait(self)
				myCollBox2.SetMotionType(4)
				myCollBox2.moveTo(dunDustmansCairnTrapScenePrim2Marker)
				; while myCollBox.isDisabled() && myCollBox2.isDisabled()
					; utility.wait(0.2)
				; endwhile
			else
				game.EnablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, \
						abLooking = true, abSneaking = true, abMenu = true, abActivate = true, \
						abJournalTabs = true, aiDisablePOVType = 0)
; 				debug.Trace(self + " second lever: was activated at " + utility.getCurrentRealTime())
				myCollBox.moveTo(dunDustmansCairnLeverCollMarker)
				myCollBox2.moveTo(dunDustmansCairnLeverCollMarker)
				myCollBox.disableNoWait(self)
				myCollBox2.disableNoWait(self)
				; while !myCollBox.isDisabled() && !myCollBox2.isDisabled()
					; utility.wait(0.2)
				; endwhile
; 				debug.Trace(self + " second lever: finished while loop at " + utility.getCurrentRealTime())
			endif
			BlockActivation(False)
			self.activate(self, true)
			BlockActivation()
			gotoState ("busy")
			playAnimationandWait("FullPush","FullPushedUp")
			gotoState("done")
		else
; 			debug.Trace(self + ": will not work because a companion is in the box")
		endIf
	endEVENT
endState

State done
	Event OnBeginState()
		BlockActivation()
		
		if !secondLever
			(C01 as C01QuestScript).AmbushLeverPulled = true
			if (!(C01 as C01QuestScript).ObserverCloseBy)
; 				Debug.Trace("C01: Observer having trouble following; compensating.")
				Observer.GetReference().MoveTo((C01 as C01QuestScript).ObserverCompensationPoint)
				if (Observer.GetReference().GetParentCell() != MyCell)
; 					Debug.Trace("C01: Something has gone horribly wrong. Skipping lever effect.")
					return
				endif
			endif

			AmbushScene.Start()
		endif
	EndEvent
	
	Event onActivate(objectReference akActivator)
		cannotBeActivatedMessage.show()
	endEvent
EndState

; STATE pushedPosition
	; EVENT onActivate (objectReference triggerRef)
		; gotoState ("busy")
		; playAnimationandWait("FullPull","FullPulledDown")
		; gotoState("pulledPosition")
	; endEVENT
; endState


STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing	
		endEVENT
endSTATE

event onCellLoad()
	BlockActivation()
	SetNoFavorAllowed()
endEvent

