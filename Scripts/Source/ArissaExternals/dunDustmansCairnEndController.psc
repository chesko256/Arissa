scriptName dunDustmansCairnEndController extends objectReference
;
;script to control the activation of waves of draugr at the end of dustmans cairns
;===============================================================

import utility

int property draugrKilled = 0 auto
int property totalDraugr = 16 auto

objectReference property OpenDoor auto
objectReference property LockedDoor auto

;draugr objectReference actually point to linkers for ease of use
objectReference property lastDraugr auto
objectReference property bossDraugr auto
quest property C01 auto
C01QuestScript property C01Script auto

objectReference property draugr01 auto
objectReference property draugr02 auto
objectReference property draugr03 auto
objectReference property draugr04 auto
objectReference property draugr05 auto
objectReference property draugr06 auto
objectReference property draugr07 auto
objectReference property draugr08 auto
objectReference property draugr09 auto
objectReference property draugr10 auto
objectReference property draugr11 auto
objectReference property draugr12 auto
objectReference property draugr13 auto
objectReference property draugr14 auto
objectReference property draugr15 auto
objectReference property draugr16 auto
objectReference property draugr17 auto

bool phaseOne = True
bool phaseTwo  = True
bool phaseThree  = True
bool phaseFour = True

int phaseTwoReady = 2
int phaseThreeReady = 7
int phaseFourReady = 12

bool property isLoaded auto hidden

;;When the blade fragment is taken this object is activated, which kicks off the sequence
auto state waiting
	event onActivate(objectReference TriggerRef)
		goToState("endSequenceActive")
	endEvent
endState

;;Active state on begin start a while loop and lock the door
;;Draugr will have a script on them that points to this object with a special linkedReference
;;when killed this will increment "draugrKilled"
;;waves of draugr are broken into phases to not overwhelm the player
;;wait periods may be added to give a brief breather

state endSequenceActive
	event onBeginState()
		C01Script = C01 as C01QuestScript
		OpenDoor.SetOpen(False)
		OpenDoor.Lock()
		OpenDoor.SetLockLevel(5)
		LockedDoor.Enable()
		OpenDoor.Disable()
		int lastDraugrKilled = 0
		
		while !(draugrKilled >= totalDraugr) && isLoaded
			wait(1.0)
			if lastDraugrKilled != draugrKilled
				lastDraugrKilled = draugrKilled
; 				debug.Trace(self + " draugrKilled = " + draugrKilled)
			endif
			if phaseOne
				;Activate phase one draugr
				phaseOne = False
; 				debug.Trace(self + " starting phase one")
				
				;if the player is very hurt, give a brief pause
				if (game.getPlayer().GetActorValuePercentage("health") < 0.25)
					wait(7.0)
				;if the player's companion is very hurt, give a brief pause
				elseif ((C01Script.Observer.GetReference() as actor).GetActorValuePercentage("health") < 0.25)
					wait(7.0)
				endif
				
				draugr05.activate(self);med
				wait(2.0)
				draugr12.activate(self);easy
				wait(1.0)
				draugr16.activate(self);med
				
			endif
			
			if( phaseTwo && draugrKilled >= phaseTwoReady)
				;Activate phase two draugr
				phaseTwo = False
; 				debug.Trace(self + " starting phase two")
				
				;if the player is very hurt, give a brief pause
				if (game.getPlayer().GetActorValuePercentage("health") < 0.25)
					wait(5.0)
				;if the player's companion is very hurt, give a brief pause
				elseif ((C01Script.Observer.GetReference() as actor).GetActorValuePercentage("health") < 0.25)
					wait(5.0)
				endif
				
				draugr03.activate(self);easy
				wait(2.0)
				draugr07.activate(self);med
				wait(1.0)
				draugr10.activate(self);hard
				wait(3.0)
				draugr13.activate(self);med
				wait(5.0)
				draugr15.activate(self);easy
				
			endif
			
			if( phaseThree && draugrKilled >= phaseThreeReady)
				;Activate phase two draugr
				phaseThree = False
; 				debug.Trace(self + " starting phase three")
				
				;if the player is very hurt, give a brief pause
				if (game.getPlayer().GetActorValuePercentage("health") < 0.25)
					wait(7.0)
				;if the player's companion is very hurt, give a brief pause
				elseif ((C01Script.Observer.GetReference() as actor).GetActorValuePercentage("health") < 0.25)
					wait(7.0)
				endif
				
				draugr01.activate(self);med
				wait(1.0)
				draugr06.activate(self);med
				wait(2.0)
				draugr09.activate(self);med
				wait(3.0)
				draugr02.activate(self);med
				wait(3.0)
				draugr14.activate(self);hard
				
			endif
			
			if( phaseFour && draugrKilled >= phaseFourReady)
				;Activate phase two draugr
				phaseFour = False
; 				debug.Trace(self + " starting phase four")
				
				;if the player is very hurt, give a brief pause
				if (game.getPlayer().GetActorValuePercentage("health") < 0.25)
					wait(7.0)
				;if the player's companion is very hurt, give a brief pause
				elseif ((C01Script.Observer.GetReference() as actor).GetActorValuePercentage("health") < 0.25)
					wait(7.0)
				endif
				
				draugr04.activate(self);hard
				wait(1.0)
				draugr08.activate(self);med
				wait(5.0)
				draugr11.activate(self);hard
				wait(1.0)
				draugr17.activate(self);med
				wait(1.0)
				bossDraugr.activate(self);very hard
			endif
		endWhile
		
; 		debug.Trace(self + " triggerLastDraugr")
		;The last draugr is specifically the one with the hidden exit door
		lastDraugr.activate(self)
		;OpenDoor.SetLockLevel(4)
		goToState("endSequenceComplete")
		
		OpenDoor.Enable()
		LockedDoor.Disable()
	endEvent
endState

function incrementDeathCounter()
	draugrKilled += 1
endFunction

;;Endstate do nothing ever again
state endSequenceComplete


endState

Event onCellAttach()
	isLoaded = True
endEvent

Event onCellDetach()
	isLoaded = False
EndEvent
