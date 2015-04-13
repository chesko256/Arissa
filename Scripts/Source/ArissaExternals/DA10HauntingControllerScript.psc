ScriptName DA10HauntingControllerScript extends Quest conditional
;
;
;=========================================================

import utility
import game

int property LvlThreshold1 = 3 auto
int property LvlDamage1  = 30 auto
int property LvlThreshold2 = 6 auto
int property LvlDamage2 = 40 auto
int property LvlThreshold3 = 9 auto
int property LvlDamage3 = 50 auto
int property LvlThreshold4 = 12 auto
int property LvlDamage4 = 60 auto
int property LvlThreshold5 = 16 auto
int property LvlDamage5 = 70 auto
int property LvlDamage6 = 80 auto

referenceAlias property Item1 auto
referenceAlias property Item2 auto
referenceAlias property Item3 auto
referenceAlias property Item4 auto
referenceAlias property Item5 auto
referenceAlias property Item6 auto
referenceAlias property Item7 auto
referenceAlias property Item8 auto
referenceAlias property Item9 auto
referenceAlias property Item10 auto
referenceAlias property Item11 auto
referenceAlias property Item12 auto
referenceAlias property Item13 auto
referenceAlias property Item14 auto
referenceAlias property Item15 auto

referenceAlias property BasementItem01 auto
referenceAlias property BasementItem02 auto
referenceAlias property BasementItem03 auto
referenceAlias property BasementItem04 auto
referenceAlias property BasementItem05 auto

referenceAlias property BedroomItem auto

referenceAlias Property alias_witchHunter  Auto  

location property LogrolfsHouseLoc auto
sound property hauntedSound auto
int property hauntedSoundID auto
float ControllerShakeL
float ControllerShakeR
float ControllerShakeDuration
float property shakeTimer = 2.0 auto
float property ghostTimerMax = 1.0 auto
float property ghostTimerMin = 0.5 auto
float currentShakeTimer
float property currentSoundTimer = 0.0 auto hidden
float property ghostTimer01 = 0.0 auto hidden
float property ghostTimer02 = 0.0 auto hidden
float property ghostTimer03 = 0.0 auto hidden
int property hauntingStage = 0 auto hidden
int property randomPick auto hidden
int property randomSoundPick auto hidden

referenceAlias property DoorToSlam auto
referenceAlias property NormalLights auto
referenceAlias property PhaseOneLights auto
referenceAlias property PhaseTwoLights auto
referenceAlias property ChairEnableMarker auto

bool property TriggerSoundDone = False auto hidden
bool property DoorToSlamDone = False auto hidden
bool property NormalLightsON = True auto hidden
bool property PhaseOneLightsON = False auto hidden
bool property PhaseTwoLightsON = False auto hidden
bool property SingleRumbleDone = False auto hidden
bool property secondISMDDone = False auto Hidden
bool property ghostsStopped = false auto hidden
float property lightsBackOnTime = 3.0 auto hidden

quest property DA10 auto
imageSpaceModifier Property DA10HauntingISMDIn  Auto 
imageSpaceModifier Property DA10HauntingISMDLoop  Auto 
imageSpaceModifier Property DA10HauntingISMDOut  Auto 
sound property QSTDA10Rumble auto
sound property QSTDA10SpookyDistant auto
objectReference property DA10SpookySoundMarker01 auto
objectReference property DA10SpookySoundMarker02 auto
objectReference property DA10SpookySoundMarker03 auto
objectReference property DA10SpookySoundMarker04 auto
objectReference property DA10SpookySoundMarker05 auto
objectReference property DA10SpookySoundMarker06 auto
objectReference property DA10SpookySoundMarker07 auto
objectReference property DA10SpookySoundMarker08 auto
objectReference property DA10SpookySoundMarker09 auto
objectReference property DA10SpookySoundMarker10 auto

int property randomizerForStage3 auto hidden

bool property hauntActive = false auto hidden
float property loopTimer = 0.3 auto
{default = 0.3}
;===================================================================
;;CORE LOGIC BLOCK
;===================================================================

;When the haunting quest is running this update is going
;		the hauntingState is a fake state manager
auto state waiting
endState


state running
	event onBeginState()
		hauntActive = True
		while hauntActive
			;State 0 Running and waiting for stuff to happen
; 			debug.Trace(self + ": haunting Controller stage = " + hauntingStage)
			if hauntingStage == 0	
			
			;State 1 trigger sound
			elseif hauntingStage == 1	
				if !TriggerSoundDone
					TriggerSoundDone = True
					ghostActivate(BedroomItem)
					QSTDA10SpookyDistant.play(DA10SpookySoundMarker01)
				endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
			;State 2 slam door
			elseif hauntingStage == 2
			
				if !DoortoSlamDone
					DA10HauntingISMDIn.applyCrossFade(10.0)
					
					;DA10HauntingISMDLoop.applyCrossFade(15.0)
					;DoorToSlam.getReference().activate(DoorToSlam.getReference())
					;DoortoSlamDone = True
				endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
			;State 3 drop lights
			elseif hauntingStage == 3
				if NormalLightsON
					NormalLightsON = False
					QSTDA10SpookyDistant.play(DA10SpookySoundMarker01)
					;handleISMD()
					;DA10HauntingISMDLoop.applyCrossFade(15.0)
					NormalLights.getReference().disable(NormalLights.getReference())
				endif
			
			if currentSoundTimer <= utility.getCurrentRealTime()
				;ghostSoundPicker()
				randomizerForStage3 = randomInt(0,1)
				if randomizerForStage3 == 0
					QSTDA10SpookyDistant.play(DA10SpookySoundMarker06)
				else
					QSTDA10SpookyDistant.play(DA10SpookySoundMarker07)
				endif
				currentSoundTimer = utility.getCurrentRealTime() + randomfloat(1.5, 3.0)
			endif
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
			;State 4 haunt basement
			elseif hauntingStage == 4
			
				if !secondISMDDone
; 					debug.Trace(self + ": should be applying ISMD: " + DA10HauntingISMDLoop)
					secondISMDDone = true
					DA10HauntingISMDLoop.applyCrossFade(15.0)
				endif
				;Fling stuff in the basement
				if ghostTimer01 <= utility.getCurrentRealTime()
					ghostActivateBasementPicker()
					ghostTimer01 = utility.getCurrentRealTime() + randomfloat(ghostTimerMin, ghostTimerMax)
				endif
				
				; if !ChairEnableMarker.getReference().isEnabled()
					; ChairEnableMarker.getReference().Enable(ChairEnableMarker.getReference())
				; endif
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;State 5 flicker a few lights IS NOT USED ANYMORE: IT IS NOW PART OF STATE 4
			;elseif hauntingStage == 5
				;Turn on first set of flickering lights - xmarker as enable parent
				if !PhaseOneLightsON
					PhaseOneLightsON = True
					PhaseOneLights.getReference().enable(PhaseOneLights.getReference())
					ChairEnableMarker.getReference().Enable(ChairEnableMarker.getReference())
				endif
				
				;hauntBasement
; 				debug.Trace(self + " ghostTimer01 = " + ghostTimer01 + ", current Time = " + utility.getCurrentRealTime())
				if ghostTimer01 <= utility.getCurrentRealTime()
					ghostActivateBasementPicker()
					ghostTimer01 = utility.getCurrentRealTime() + randomfloat(ghostTimerMin, ghostTimerMax)
				endif
				
				if currentSoundTimer <= utility.getCurrentRealTime()
					ghostSoundPicker()
					currentSoundTimer = utility.getCurrentRealTime() + randomfloat(0, 0.2)
				endif
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;State 6 Single Rumble & flicker all lights
			elseif hauntingStage == 6
				;Shake the house one time
				if !SingleRumbleDone
					SingleRumbleDone = TRUE
					ControllerShakeL = randomFloat(0.3, 0.7)
					ControllerShakeR = randomFloat(0.3, 0.7)
					ControllerShakeDuration = 1.5
					QSTDA10Rumble.play(game.getPlayer())
					game.ShakeCamera(afStrength = 1.0)
					game.ShakeController(ControllerShakeL, ControllerShakeR, ControllerShakeDuration)	
				endif
				;Turn on second set of flickering lights - xmarker as enable parent
				if !PhaseTwoLightsON
					PhaseTwoLightsON = True
					PhaseTwoLights.getReference().enable(PhaseTwoLights.getReference())
				endif
			
				if currentSoundTimer <= utility.getCurrentRealTime()
					ghostSoundPicker()
					currentSoundTimer = utility.getCurrentRealTime() + randomfloat(0, 0.1)
				endif
				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;State 7 Everything goes crazy
			elseif hauntingStage == 7
; 				debug.Trace(self + " ghostTimer01 = " + ghostTimer01 + ", current Time = " + utility.getCurrentRealTime())
; 				debug.Trace(self + " ghostTimer02 = " + ghostTimer02 + ", current Time = " + utility.getCurrentRealTime())
; 				debug.Trace(self + " ghostTimer03 = " + ghostTimer03 + ", current Time = " + utility.getCurrentRealTime())
				;Fling stuff in the basement
				if ghostTimer01 <= utility.getCurrentRealTime()
					ghostActivateBasementPicker()
					ghostTimer01 = utility.getCurrentRealTime() + randomfloat(ghostTimerMin, ghostTimerMax)
				endif
				
				;Fling stuff in the house
				if ghostTimer02 <= utility.getCurrentRealTime()
					ghostActivatePicker()
					ghostTimer02 = utility.getCurrentRealTime() + randomfloat(ghostTimerMin, ghostTimerMax)
				endif
				
				;Fling stuff in the house
				if ghostTimer03 <= utility.getCurrentRealTime()
					ghostActivatePicker()
					ghostTimer03 = utility.getCurrentRealTime() + randomfloat(ghostTimerMin, ghostTimerMax)
				endif
				
				;Shake the house
				if currentShakeTimer <= utility.getCurrentRealTime()
					ControllerShakeL = randomFloat(0.0, 1.0)
					ControllerShakeR = randomFloat(0.0, 1.0)
					ControllerShakeDuration = randomFloat(1.0, 2.0)
					game.ShakeCamera(afStrength = 1.0)
					game.ShakeController(ControllerShakeL, ControllerShakeR, ControllerShakeDuration)
					QSTDA10Rumble.play(game.getPlayer())
					currentShakeTimer = utility.getCurrentRealTime() + randomfloat(0, shakeTimer)
				endif
				
				if currentSoundTimer <= utility.getCurrentRealTime()
					ghostSoundPicker()
					currentSoundTimer = utility.getCurrentRealTime() + randomfloat(0, 0.1)
				endif
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;State 8 Drop everything
			elseif hauntingStage == 8
				;unRegisterforUpdate()
				
				;Drop lights
				if PhaseTwoLightsON
					PhaseTwoLightsON = False
					PhaseTwoLights.getReference().disable(PhaseTwoLights.getReference())	
				endif
				
				;Drop lights
				if PhaseOneLightsON
					PhaseOneLightsON = False
					PhaseOneLights.getReference().disable(PhaseOneLights.getReference())
				endif
				
				utility.wait(lightsBackOnTime)
				
				;Set lights back to normal
				if !NormalLightsON
					NormalLightsON = True
					NormalLights.getReference().enable()
				endif
				
				;GOT RID OF THIS, IT IS BADNESS
				;DA10HauntingISMDOut.apply(3.0)
				;utility.Wait(3.0)
				;imageSpaceModifier.removeCrossFade(3.0)
				
				if !ghostsStopped
					ghostsStopped = true
					dropAllGhosts()
				endif
				
				if currentSoundTimer <= utility.getCurrentRealTime()
					ghostSoundPicker()
					currentSoundTimer = utility.getCurrentRealTime() + randomfloat(0, 0.5)
				endif
				
				;setStage(100)
				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			elseif hauntingStage == 9	
				hauntActive = False
				imageSpaceModifier.removeCrossFade(3.0)
				setStage(100)
			Else
; 				debug.Trace(self + " is in a bad state!")
			endif
			utility.Wait(loopTimer)
		endWhile
	endEvent
endState

;===================================================================
;;FUNCTION BLOCK
;===================================================================

;Pick for upstairs items to fling
function ghostActivatePicker()
	randomPick = randomInt(1, 15)
	if randomPick == 1
		ghostActivate(Item1)
	elseif randomPick == 2
		ghostActivate(Item2)
	elseif randomPick == 3
		ghostActivate(Item3)
	elseif randomPick == 4
		ghostActivate(Item4)
	elseif randomPick == 5
		ghostActivate(Item5)
	elseif randomPick == 6
		ghostActivate(Item6)
	elseif randomPick == 7
		ghostActivate(Item7)
	elseif randomPick == 8
		ghostActivate(Item8)
	elseif randomPick == 9
		ghostActivate(Item9)
	elseif randomPick == 10
		ghostActivate(Item10)
	elseif randomPick == 11
		ghostActivate(Item11)
	elseif randomPick == 12
		ghostActivate(Item12)
	elseif randomPick == 13
		ghostActivate(Item13)
	elseif randomPick == 14
		ghostActivate(Item14)
	elseif randomPick == 15
		ghostActivate(Item15)
	endif
endfunction

function ghostSoundPicker()
	randomSoundPick = randomInt(1, 10)
	if randomSoundPick == 1
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker01)
	elseif randomSoundPick == 2
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker02)
	elseif randomSoundPick == 3
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker03)
	elseif randomSoundPick == 4
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker04)
	elseif randomSoundPick == 5
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker05)
	elseif randomSoundPick == 6
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker06)
	elseif randomSoundPick == 7
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker07)
	elseif randomSoundPick == 8
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker08)
	elseif randomSoundPick == 9
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker09)
	elseif randomSoundPick == 10
		QSTDA10SpookyDistant.play(DA10SpookySoundMarker10)
	endif
endfunction

;Pick for basementItems to fling
function ghostActivateBasementPicker()
	randomPick = randomInt(1, 5)
	if randomPick == 1
		ghostActivate(BasementItem01)
	elseif randomPick == 2
		ghostActivate(BasementItem02)
	elseif randomPick == 3
		ghostActivate(BasementItem03)
	elseif randomPick == 4
		ghostActivate(BasementItem04)
	elseif randomPick == 5
		ghostActivate(BasementItem05)
	Else
; 		debug.Trace(self + " is trying to pick something invalid")
	endif
endfunction

;trigger ghost - they have scripts added to them on the quest
function ghostActivate(referenceAlias myAlias)
; 	debug.trace (myAlias + " has been picked by the ghost")
	myAlias.getReference().activate(myAlias.getReference())
; 	debug.trace(self + "has activated " + myAlias)
endFunction

;handle the application of imagespace modifier fade in
;/
function handleISMD()
	DA10HauntingISMDIn.applyCrossFade(5.0)
	utility.Wait(3.0)
	DA10HauntingISMDLoop.applyCrossFade(15.0)
endFunction
/;

function dropAllGhosts()
	(Item1 as DA10GhostTrap).goToState("Idle")
	(Item1 as DA10GhostTrap).hauntingOver = TRUE
	(Item2 as DA10GhostTrap).goToState("Idle")
	(Item2 as DA10GhostTrap).hauntingOver = TRUE
	(Item3 as DA10GhostTrap).goToState("Idle")
	(Item3 as DA10GhostTrap).hauntingOver = TRUE
	(Item4 as DA10GhostTrap).goToState("Idle")
	(Item4 as DA10GhostTrap).hauntingOver = TRUE
	(Item5 as DA10GhostTrap).goToState("Idle")
	(Item5 as DA10GhostTrap).hauntingOver = TRUE
	(Item6 as DA10GhostTrap).goToState("Idle")
	(Item6 as DA10GhostTrap).hauntingOver = TRUE
	(Item7 as DA10GhostTrap).goToState("Idle")
	(Item7 as DA10GhostTrap).hauntingOver = TRUE
	(Item8 as DA10GhostTrap).goToState("Idle")
	(Item8 as DA10GhostTrap).hauntingOver = TRUE
	(Item9 as DA10GhostTrap).goToState("Idle")
	(Item9 as DA10GhostTrap).hauntingOver = TRUE
	(Item10 as DA10GhostTrap).goToState("Idle")
	(Item10 as DA10GhostTrap).hauntingOver = TRUE
	(Item11 as DA10GhostTrap).goToState("Idle")
	(Item11 as DA10GhostTrap).hauntingOver = TRUE
	(Item12 as DA10GhostTrap).goToState("Idle")
	(Item12 as DA10GhostTrap).hauntingOver = TRUE
	(Item13 as DA10GhostTrap).goToState("Idle")
	(Item13 as DA10GhostTrap).hauntingOver = TRUE
	(Item14 as DA10GhostTrap).goToState("Idle")
	(Item14 as DA10GhostTrap).hauntingOver = TRUE
	(Item15 as DA10GhostTrap).goToState("Idle")
	(Item15 as DA10GhostTrap).hauntingOver = TRUE
	
	(BasementItem01 as DA10GhostTrap).goToState("Idle")
	(BasementItem01 as DA10GhostTrap).hauntingOver = TRUE
	(BasementItem02 as DA10GhostTrap).goToState("Idle")
	(BasementItem02 as DA10GhostTrap).hauntingOver = TRUE
	(BasementItem03 as DA10GhostTrap).goToState("Idle")
	(BasementItem03 as DA10GhostTrap).hauntingOver = TRUE
	(BasementItem04 as DA10GhostTrap).goToState("Idle")
	(BasementItem04 as DA10GhostTrap).hauntingOver = TRUE
	(BasementItem05 as DA10GhostTrap).goToState("Idle")
	(BasementItem05 as DA10GhostTrap).hauntingOver = TRUE



endFunction


function startRunningHaunt()
	goToState("running")
endFunction
