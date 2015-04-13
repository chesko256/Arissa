scriptName dunHillgrundsTombEndController extends objectReference
;
;script to control the activation of waves of draugr at the end of dustmans cairns
;===============================================================

import utility

int property draugrKilled = 0 auto
int property totalDraugr = 10 auto

;objectReference property doorToLock auto

;draugr objectReference actually point to linkers for ease of use
objectReference property ValsVeran auto
objectReference property bossDraugr auto
spell property invisibility auto
faction property warlockFaction auto
faction property draugrFaction auto
float property fAggression = 2.0 auto

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
;objectReference property draugr11 auto
;objectReference property draugr12 auto
;objectReference property draugr13 auto
;objectReference property draugr14 auto
;objectReference property draugr15 auto
;objectReference property draugr16 auto
;objectReference property draugr17 auto

bool phaseOne = True
bool phaseTwo  = True
bool phaseThree  = True
bool phaseFour = True
bool sequenceComplete = false

int phaseTwoReady = 3
int phaseThreeReady = 6
int phaseFourReady = 9


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
		;doorToLock.SetOpen(False)
		;doorToLock.Lock()
		;doorToLock.SetLockLevel(5)
		int lastDraugrKilled = 0
		(ValsVeran as actor).activate(self)
		(ValsVeran as actor).addToFaction(WarlockFaction)
		(ValsVeran as actor).addToFaction(DraugrFaction)
		(ValsVeran as actor).setAV("Aggression", fAggression)
			while (!(draugrKilled >= totalDraugr) || !sequenceComplete)
				wait(1.0)
				if lastDraugrKilled != draugrKilled
					lastDraugrKilled = draugrKilled
; 					debug.Trace(self + " draugrKilled = " + draugrKilled)
				endif
				if phaseOne
					;Activate phase one draugr
					phaseOne = False
					if !(valsVeran as actor).isdead()
						valsVeran.activate(self)
					endif
; 					debug.Trace(self + " starting phase one")
					
					draugr01.activate(self);med
					
					draugr02.activate(self);easy
					
					draugr03.activate(self);med
					
					draugr05.activate(self);med
					
				endif
				
				if( phaseTwo && draugrKilled >= phaseTwoReady)
					;Activate phase two draugr
					phaseTwo = False
					if !(valsVeran as actor).isdead()
						valsVeran.activate(self)
					endif
; 					debug.Trace(self + " starting phase two")
					
					draugr04.activate(self);easy
					
					draugr06.activate(self);med
					
					draugr07.activate(self);hard
					
					
				endif
				
				if( phaseThree && draugrKilled >= phaseThreeReady)
					;Activate phase two draugr
					phaseThree = False
					if !(valsVeran as actor).isdead()
						valsVeran.activate(self)
					endif
; 					debug.Trace(self + " starting phase three")
					
					draugr08.activate(self);med
					
					draugr09.activate(self);med
					
					draugr10.activate(self);med
					
					bossDraugr.activate(self);very hard
				endif
				if( phaseFour && draugrKilled >= phaseFourReady)
					phaseFour = False
					sequenceComplete = True
					if !(valsVeran as actor).isdead()
						(ValsVeran as dunHillgrundsTombBoss).goToState("mustFight")
						valsVeran.activate(self)
					endif
				endif
				
			endWhile
; 		debug.Trace(self + " triggerLastDraugr")
		;The last draugr is specifically the one with the hidden exit door
		;doorToLock.SetLockLevel(4)
		goToState("endSequenceComplete")
	endEvent
endState

;;Endstate do nothing ever again
state endSequenceComplete


endState

function incrementDeathCounter()
	draugrKilled += 1
endFunction
