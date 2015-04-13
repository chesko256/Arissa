scriptName TG08RisingWaterScript extends objectReference
;
;This script controls the rising water and earthquakes at the
;		end of TG08b
;It issues commands to many other objects with scripts on them
;Other Associated Scripts
;		TG08BFloodPipeController
;		TG08EarthquakeDustEffects
;=======================================================


;==========================================================
;;PROPERTIES BLOCK
;==========================================================

objectReference property waterplaneRef auto
objectReference property waterplaneHeight00Ref auto
objectReference property waterplaneHeight01Ref auto
float property waterplaneHeight01 auto
objectReference property waterplaneHeight02Ref auto
objectReference property crumbleBalconyRef auto
objectReference property irkngthandExitEnableRef auto
float currentWaterHeight = 0.0
int stateSafety = 0

float property afX auto
float property afY auto
float property afZ auto
float property afXAngle auto
float property afYAngle auto
float property afZAngle auto
float property afTangentMagnitude = 1.0 auto
float property afSpeed1 = 0.5 auto
float property afSpeed2 = 15.0 auto
float property afMaxRotationSpeed = 0.0 auto

float property rumbleAmount1 = 1.0 Auto
float property rumbleDuration1 = 7.0 Auto
float property cameraShakeAmount1 = 0.8 Auto
objectReference property EffectLinker1 Auto

float property rumbleAmount2 = 1.0 Auto
float property rumbleDuration2 = 11.0 Auto
float property cameraShakeAmount2 = 1.0 Auto
objectReference property EffectLinker2 Auto

ObjectReference property StatueTorch Auto
ObjectReference property SideWallTorch Auto
ObjectReference property Sunlight Auto
ObjectReference property ExitRocks Auto
ObjectReference property TG08RockfallCollisionParent auto
objectReference property tg08NavcutParent Auto

ObjectReference property PipeControllerBig01 auto
ObjectReference property PipeControllerBig02 auto
ObjectReference property PipeControllerBig03 auto
ObjectReference property PipeControllerBig04 auto
ObjectReference property PipeControllerSmall01 auto
ObjectReference property PipeControllerSmall02 auto
ObjectReference property PipeControllerSmall03 auto
ObjectReference property PipeControllerSmall04 auto

objectReference property CurrentTranslateTarget Auto
float property currentTranslateSpeed auto

ObjectReference property TG08BActorBarrier auto
sound property earthQuakeSound Auto
float property waterplaneheight auto
bool property phase1 auto hidden

Actor property KarliahRef auto
Actor property BrynjolfRef auto
;==========================================================
;;STATES BLOCK
;==========================================================

auto state inactive
	event onActivate(objectReference akActivator)
		waterplaneRef.enable()
		;registerForUpdate(updateIncrement1)
		stateSafety = 1
		goToState("risingPhase1")
; 		debug.trace("TG08RisingWater - activate has fired")
		;waterplaneRef.enable()
	endEvent
endState

state risingPhase1
	event onBeginState()
		phase1 = true
		
; 		debug.trace("TG08RisingWaterPhase1")
		CauseEarthquake1()
		setUpWaterHeights()
		EffectLinker1.activate(self)
; 		debug.Trace(self + " has activated EffectLinker1")
		utility.wait(4.0)
		crumbleBalconyRef.activate(self)
		TG08BActorBarrier.enable()
; 		debug.Trace(self + " has activated CrumbleBalcony")
		afX = waterplaneRef.getPositionX()
		afY = waterplaneRef.getPositionY()
		waterplaneHeight01 = waterplaneHeight01Ref.getPositionZ()
		afZ = waterplaneHeight01
		afXAngle = waterplaneRef.getAngleX()
		afYAngle = waterplaneRef.getAngleY()
		afZAngle = waterplaneRef.getAngleZ()
		CurrentTranslateTarget = waterplaneHeight01Ref
		currentTranslateSpeed = afSpeed1
		
		; ChangePipeState(PipeControllerSmall01, "broken")
		; utility.wait(1.0)
		; ChangePipeState(PipeControllerSmall03, "broken")
		; utility.wait(0.5)
		; ChangePipeState(PipeControllerBig01, "broken")
		; utility.wait(1.0)
		; ChangePipeState(PipeControllerSmall02, "broken")


		utility.wait(0.1)
; 		debug.Trace(self + " is going to translate water")
		waterplaneRef.TranslateTo(afX, afY, afZ, afXAngle, afYAngle, afZAngle, afSpeed1)
; 		debug.Trace(self + " has started water translating")
; 		debug.Trace(self + " has reached end of risingPhase1 begin event")
		
		While Phase1
					;;;;;;;;;;;;;;;;;;;;;;;;;;;;First set of pipes;;;;;;;;;;;;;;;;;;;;	
			waterplaneheight = waterplaneRef.getPositionZ()
; 			;debug.Trace(self + ": is running phase 1 While loop")
; 			;debug.Trace(self + ": waterPlaneHeight = " + waterPlaneHeight)
			if !WaterSplashStartedB01 ;&& waterplaneheight >= WaterSplashHeightB01
				WaterSplashStartedB01 = True
; 				debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightB01: " + WaterSplashHeightB01)
				ChangePipeState(PipeControllerBig01, "broken")
				TriggerAftershock(2.0)
			endif
			
			if !WaterSplashStartedS01 && waterplaneheight >= WaterSplashHeightS01
				WaterSplashStartedS01 = True
; 				debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightS04: " + WaterSplashHeightS01)
				ChangePipeState(PipeControllerSmall01, "broken")
				TriggerAftershock(2.0)
			endif
			
			if !WaterSplashStartedS02 && waterplaneheight >= WaterSplashHeightS02
				WaterSplashStartedS02 = True
; 				debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightS02: " + WaterSplashHeightS02)
				ChangePipeState(PipeControllerSmall02, "broken")
				TriggerAftershock(2.0)
			endif
			
			if !WaterSplashStartedS03 && waterplaneheight >= WaterSplashHeightS03
				WaterSplashStartedS03 = True
; 				debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightS04: " + WaterSplashHeightS03)
				ChangePipeState(PipeControllerSmall03, "broken")
				TriggerAftershock(2.0)
			endif
			
			if WaterSplashStartedB01 ;&& WaterSplashStartedS01 && WaterSplashStartedS02 && WaterSplashStartedS03
				Phase1 = false
			elseif waterplaneheight >= (waterplaneHeight01 - 5.0)
				Phase1 = false
			endif
			
			if !WaterIsDone && waterSyncTimer < utility.getCurrentRealTime() && !WaterSyncCheck
				waterSyncCheck = True
		
				if WaterSplashStartedB01 && !PipeControllerBig01Done
					TriggerWaterRiseMatch(PipeControllerBig01)
				endif

				waterSyncTimer = (utility.getCurrentRealTime() + 5.0)
				waterSyncCheck = False
			endif
			utility.wait(0.3)
		endWhile
	endEvent
	
	event onActivate(objectReference akActivator)
		Phase1 = false
; 		debug.Trace(self + " has been activated in risingPhase1, now going to phase2")
		stateSafety = 2
		;waterplaneRef.stopTranslation()
		utility.wait(0.1)
		goToState("risingPhase2")
	endEvent
endState

state risingPhase2
	event onBeginState()
; 		debug.trace("TG08RisingWaterPhase2")
		CauseEarthquake2()
		tg08NavcutParent.disable()
		afZ = waterplaneHeight02Ref.getPositionZ()
		CurrentTranslateTarget = waterplaneHeight02Ref
		currentTranslateSpeed = afSpeed2
		TG08BActorBarrier.disable()
		
		utility.wait(6.0)
		waterplaneRef.TranslateTo(afX, afY, afZ, afXAngle, afYAngle, afZAngle, afSpeed2, afMaxRotationSpeed)
		
		startWaterRisePhase2()
		
			
		
; 		debug.Trace(self + " has reached end of risingPhase2 begin event")
	endEvent
	
	event onActivate(objectReference akActivator)
		stateSafety = 3
	endEvent
endState

;===================================================================
;;OnUpdate BLOCK
;===================================================================

;This block is responsible for checking things against the water height
;		and making changes accordingly.



bool property StatueTorchDisabled = false auto hidden
float property StatueTorchHeight auto hidden
ObjectReference Property TG08bSmokeR auto

bool property WaterHeightFinished = false auto hidden
float property WaterFinishedHeight auto hidden

bool property SidewallTorchDisabled = false auto hidden
float property SidewallTorchHeight auto hidden
ObjectReference Property TG08bSmokeL auto



;;;;;;;;;;Pipe variables for checking if it they are ready to start;;;;;;;;;;;;;;;;
;				The ***height float is set by the startWaterUpdateFunction
;				They get their height from the Z value of their Splash effect
;				This is to allow easier adjustment of the height in the editor
bool property WaterSplashStartedS01 auto hidden
ObjectReference property TG08WaterSplashS01 auto
float property WaterSplashHeightS01 auto hidden
bool property WaterSplashStartedS02 auto hidden
ObjectReference property TG08WaterSplashS02 auto
float property WaterSplashHeightS02 auto hidden
bool property WaterSplashStartedS03 auto hidden
ObjectReference property TG08WaterSplashS03 auto
float property WaterSplashHeightS03 auto hidden
bool property WaterSplashStartedS04 auto hidden
ObjectReference property TG08WaterSplashS04 auto
float property WaterSplashHeightS04 auto hidden

bool property WaterSplashStartedB01 auto hidden
ObjectReference property TG08WaterSplashB01 auto
float property WaterSplashHeightB01 auto hidden
bool property WaterSplashStartedB02 auto hidden
ObjectReference property TG08WaterSplashB02 auto
float property WaterSplashHeightB02 auto hidden
bool property WaterSplashStartedB03 auto hidden
ObjectReference property TG08WaterSplashB03 auto
float property WaterSplashHeightB03 auto hidden
bool property WaterSplashStartedB04 auto hidden
ObjectReference property TG08WaterSplashB04 auto
float property WaterSplashHeightB04 auto hidden

;;;;;;;;;;Pipe variables for checking if it they are done;;;;;;;;;;;;;;;;
;				The ***height float is set by the startWaterUpdateFunction
;				They get their height from the Z value of their pipe controller
;				This is to allow easier adjustment of the height in the editor
bool property PipeControllerSmall01Done = false auto hidden
float property PipeControllerSmall01Height auto hidden
bool property PipeControllerSmall02Done = false auto hidden
float property PipeControllerSmall02Height auto hidden
bool property PipeControllerSmall03Done = false auto hidden
float property PipeControllerSmall03Height auto hidden
bool property PipeControllerSmall04Done = false auto hidden
float property PipeControllerSmall04Height auto hidden

bool property PipeControllerBig01Done = false auto hidden
float property PipeControllerBig01Height auto hidden
bool property PipeControllerBig02Done = false auto hidden
float property PipeControllerBig02Height auto hidden
bool property PipeControllerBig03Done = false auto hidden
float property PipeControllerBig03Height auto hidden
bool property PipeControllerBig04Done = false auto hidden
float property PipeControllerBig04Height auto hidden

;;;;;;;;;;Pipe variables for checking if it is time to trigger the exit;;;;;;;;;;;;;;;;
;				If the water has reached the EscapeHeight and TG08B
;				has reached quest stage 50 (player has taken the skeleton key)
;				then it will be triggered.
objectReference property TG08BEscapeHeightRef auto
bool property ExitRocksFinished = false auto hidden
float property ExitRocksHeight auto hidden
quest property TG08B auto

bool property waterIsDone = false auto hidden
float property waterSyncTimer = 0.0 auto hidden
bool property waterSyncCheck = false auto hidden

Function WaterRise2()
	while !waterIsDone || !ExitRocksFinished
		waterplaneheight = waterplaneRef.getPositionZ()
; 		;debug.Trace("rising water height = " + waterplaneheight)
		
		;Turn off shadow casting light at Right side of room
		if !SidewallTorchDisabled && waterplaneheight > SidewallTorchHeight
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= sidewallTorchHeight: " + SidewallTorchHeight)
			SidewallTorchDisabled = True
			TG08bSmokeR.Enable()
			SidewallTorch.Disable()
			utility.wait(2.0)
			TG08bSmokeR.disable(abFadeout = True)
		endif
		
		;Turn off shadow casting light at Left side of room
		if !StatueTorchDisabled && waterplaneheight > StatueTorchHeight
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= statueTorchHeight: " + StatueTorchHeight)
			StatueTorchDisabled = True
			TG08bSmokeL.Enable()
			StatueTorch.Disable()
			utility.wait(2.0)
			TG08bSmokeL.disable(abFadeout = True)
		endif
		
		
		
		;Start end rocks falling
		if !ExitRocksFinished && (waterplaneheight >= ExitRocksHeight) && (TG08B.getStage() == 50)
; 			debug.Trace(self + ": is running the finish Rocks stuff")
; 			debug.Trace(self + ": ExitRocksFinished = " + ExitRocksFinished)
; 			debug.Trace(self + ": quest stage = " + TG08B.getStage())
			ExitRocksFinished = True
			TG08RockfallCollisionParent.disable()
			ExitRocks.Activate(self)
			Sunlight.Enable()
			KarliahRef.EvaluatePackage()
			BrynjolfRef.EvaluatePackage()
		endif
		
		;Water height is near top, unregister for update
		if !WaterHeightFinished && waterplaneheight >= WaterFinishedHeight
			WaterHeightFinished = True
			waterIsDone = True
		endif
		
		
		
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PIPES ON;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		if !WaterSplashStartedB02 && waterplaneheight >= WaterSplashHeightB02
			WaterSplashStartedB02 = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightB02: " + WaterSplashHeightB02)
			ChangePipeState(PipeControllerBig02, "broken")
			TriggerAftershock(2.0)
		endif
		
		if !WaterSplashStartedB03 && waterplaneheight >= WaterSplashHeightB03
			WaterSplashStartedB03 = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightB03: " + WaterSplashHeightB03)
			ChangePipeState(PipeControllerBig03, "broken")
			TriggerAftershock(2.0)
		endif
		
		if !WaterSplashStartedS04 && waterplaneheight >= WaterSplashHeightS04
			WaterSplashStartedS04 = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightS04: " + WaterSplashHeightS04)
			ChangePipeState(PipeControllerSmall04, "broken")
			TriggerAftershock(2.0)
		endif
		
		if !WaterSplashStartedB04 && waterplaneheight >= WaterSplashHeightB04
			WaterSplashStartedB04 = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightB04: " + WaterSplashHeightB04)
			ChangePipeState(PipeControllerBig04, "broken")
			TriggerAftershock(2.0)
		endif
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;First set of pipes;;;;;;;;;;;;;;;;;;;;
		
		if !WaterSplashStartedB01 && waterplaneheight >= WaterSplashHeightB01
			WaterSplashStartedB01 = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightB01: " + WaterSplashHeightB01)
			ChangePipeState(PipeControllerBig01, "broken")
			TriggerAftershock(2.0)
		endif
		
		if !WaterSplashStartedS01 && waterplaneheight >= WaterSplashHeightS01
			WaterSplashStartedS01 = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightS04: " + WaterSplashHeightS01)
			ChangePipeState(PipeControllerSmall01, "broken")
			TriggerAftershock(2.0)
		endif
		
		if !WaterSplashStartedS02 && waterplaneheight >= WaterSplashHeightS02
			WaterSplashStartedS02 = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightS02: " + WaterSplashHeightS02)
			ChangePipeState(PipeControllerSmall02, "broken")
			TriggerAftershock(2.0)
		endif
		
		if !WaterSplashStartedS03 && waterplaneheight >= WaterSplashHeightS03
			WaterSplashStartedS03 = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= WaterSplashHeightS04: " + WaterSplashHeightS03)
			ChangePipeState(PipeControllerSmall03, "broken")
			TriggerAftershock(2.0)
		endif
		
		
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PIPES OFF;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;big pipe reached turn off water and turn on fx
		if !PipeControllerBig01Done && waterplaneheight >= PipeControllerBig01Height
			PipeControllerBig01Done = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= PipeControllerBig01: " + PipeControllerBig01Height)
			ChangePipeState(PipeControllerBig01, "submerged")
			endif
		
		;big pipe reached turn off water and turn on fx
		if !PipeControllerBig02Done && waterplaneheight >= PipeControllerBig02Height
			PipeControllerBig02Done = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= PipeControllerBig02: " + PipeControllerBig02Height)
			ChangePipeState(PipeControllerBig02, "submerged")
		endif
		
		;big pipe reached turn off water and turn on fx
		if !PipeControllerBig03Done && waterplaneheight >= PipeControllerBig03Height
			PipeControllerBig03Done = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= PipeControllerBig03: " + PipeControllerBig03Height)
			ChangePipeState(PipeControllerBig03, "submerged")
		endif
		
		;big pipe reached turn off water and turn on fx
		if !PipeControllerBig04Done && waterplaneheight >= PipeControllerBig04Height
			PipeControllerBig04Done = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= PipeControllerBig04: " + PipeControllerBig04Height)
			ChangePipeState(PipeControllerBig04, "submerged")
		endif
		
		;;;;;;;;;;;;;;;;;;
		;small pipe reached turn off water and turn on fx
		if !PipeControllerSmall01Done && waterplaneheight >= PipeControllerSmall01Height
			PipeControllerSmall01Done = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= PipeControllerSmall01: " + PipeControllerSmall01Height)
			ChangePipeState(PipeControllerSmall01, "submerged")
		endif
		
		;small pipe reached turn off water and turn on fx
		if !PipeControllerSmall02Done && waterplaneheight >= PipeControllerSmall02Height
			PipeControllerSmall02Done = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= PipeControllerSmall02: " + PipeControllerSmall02Height)
			ChangePipeState(PipeControllerSmall02, "submerged")
		endif
		
		;small pipe reached turn off water and turn on fx
		if !PipeControllerSmall03Done && waterplaneheight >= PipeControllerSmall03Height
			PipeControllerSmall03Done = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= PipeControllerSmall03: " + PipeControllerSmall03Height)
			ChangePipeState(PipeControllerSmall03, "submerged")
		endif
		
		;small pipe reached turn off water and turn on fx
		if !PipeControllerSmall04Done && waterplaneheight >= PipeControllerSmall04Height
			PipeControllerSmall04Done = True
; 			debug.Trace("waterplaneheight: " + waterplaneheight + " >= PipeControllerSmall04: " + PipeControllerSmall04Height)
			ChangePipeState(PipeControllerSmall04, "submerged")
		endif
		
		
		if !WaterIsDone && waterSyncTimer < utility.getCurrentRealTime() && !WaterSyncCheck
			waterSyncCheck = True
			
			if WaterSplashStartedS01 && !PipeControllerSmall01Done
				TriggerWaterRiseMatch(PipeControllerSmall01)
			endif
			if WaterSplashStartedS02 && !PipeControllerSmall02Done
				TriggerWaterRiseMatch(PipeControllerSmall02)
			endif
			if WaterSplashStartedS03 && !PipeControllerSmall03Done
				TriggerWaterRiseMatch(PipeControllerSmall03)
			endif
			if WaterSplashStartedS04 && !PipeControllerSmall04Done
				TriggerWaterRiseMatch(PipeControllerSmall04)
			endif
			
			if WaterSplashStartedB01 && !PipeControllerBig01Done
				TriggerWaterRiseMatch(PipeControllerBig01)
			endif
			if WaterSplashStartedB02 && !PipeControllerBig02Done
				TriggerWaterRiseMatch(PipeControllerBig02)
			endif
			if WaterSplashStartedB03 && !PipeControllerBig03Done
				TriggerWaterRiseMatch(PipeControllerBig03)
			endif
			if WaterSplashStartedB04 && !PipeControllerBig04Done
				TriggerWaterRiseMatch(PipeControllerBig04)
			endif
			waterSyncTimer = (utility.getCurrentRealTime() + 5.0)
			waterSyncCheck = False
		endif
		
		
		utility.Wait(0.3)
	endWhile ;this ends if!waterIsDone && !ExitRocksFinished
; 	debug.Trace(self + ": has reached the end of waterRising")
; 	debug.Trace(self + ": WaterIsDone = " + waterIsDone)
; 	debug.Trace(self + ": ExitRocksFinished = " + ExitRocksFinished)
	KarliahRef.EvaluatePackage()
	BrynjolfRef.EvaluatePackage()
	
endFunction



function setUpWaterHeights()
	waterplaneheight = waterplaneRef.getPositionZ()
	SidewallTorchHeight = SidewallTorch.getPositionZ()
	StatueTorchHeight = StatueTorch.getPositionZ()
	WaterFinishedHeight = (waterplaneHeight02Ref.getPositionZ() - 5.0)
	ExitRocksHeight = TG08BEscapeHeightRef.getPositionZ()
	WaterSplashHeightB01 = TG08WaterSplashB01.getPositionZ()
	WaterSplashHeightS01 = TG08WaterSplashS01.getPositionZ()
	WaterSplashHeightS02 = TG08WaterSplashS02.getPositionZ()
	WaterSplashHeightS03 = TG08WaterSplashS03.getPositionZ()
	WaterSplashHeightB02 = TG08WaterSplashB02.getPositionZ()
	WaterSplashHeightB03 = TG08WaterSplashB03.getPositionZ()
	WaterSplashHeightS04 = TG08WaterSplashS04.getPositionZ()
	WaterSplashHeightB04 = TG08WaterSplashB04.getPositionZ()
	PipeControllerBig01Height = PipeControllerBig01.getPositionZ()
	PipeControllerBig02Height = PipeControllerBig02.getPositionZ()
	PipeControllerBig03Height = PipeControllerBig03.getPositionZ()
	PipeControllerBig04Height = PipeControllerBig04.getPositionZ()
	PipeControllerSmall01Height = PipeControllerSmall01.getPositionZ()
	PipeControllerSmall02Height = PipeControllerSmall02.getPositionZ()
	PipeControllerSmall03Height = PipeControllerSmall03.getPositionZ()
	PipeControllerSmall04Height = PipeControllerSmall04.getPositionZ()
endFunction

function startWaterRisePhase2()
; 	debug.Trace(self + ": startWaterUpdate")
	if WaterSplashStartedB01
		TriggerWaterRiseMatch(PipeControllerBig01)
	endif
	if WaterSplashStartedB02
		TriggerWaterRiseMatch(PipeControllerBig02)
	endif
	if WaterSplashStartedB03
		TriggerWaterRiseMatch(PipeControllerBig03)
	endif
	if WaterSplashStartedB04
		TriggerWaterRiseMatch(PipeControllerBig04)
	endif
	
	if WaterSplashStartedS01
		TriggerWaterRiseMatch(PipeControllerSmall01)
	endif
	if WaterSplashStartedS02
		TriggerWaterRiseMatch(PipeControllerSmall02)
	endif
	if WaterSplashStartedS03
		TriggerWaterRiseMatch(PipeControllerSmall03)
	endif
	if WaterSplashStartedS04
		TriggerWaterRiseMatch(PipeControllerSmall04)
	endif
	WaterRise2()
endFunction


;===================================================================
;;FUNCTION BLOCK
;===================================================================

Function ChangePipeState(objectReference myPipe, string myStateString)
; 	debug.Trace(self + " is changing pipe " + myPipe + " to " + myStateString)
	TG08BFloodPipeController PipeController
	PipeController = (myPipe as TG08BFloodPipeController)
	PipeController.waterPlane = waterPlaneRef
	PipeController.heightTarget = currentTranslateTarget
	PipeController.afSpeed = currentTranslateSpeed
	PipeController.stateString = myStateString
	myPipe.activate(self)

EndFunction

Function CauseEarthquake1()
	earthQuakeSound.play(game.getPlayer())
	game.ShakeController(rumbleAmount1, rumbleAmount1, rumbleDuration1)
	game.ShakeCamera(none, cameraShakeAmount1, rumbleDuration1)
	
	
	
EndFunction

Function CauseEarthquake2()
	earthQuakeSound.play(game.getPlayer())
	game.ShakeController(rumbleAmount2, rumbleAmount2, rumbleDuration2)
	game.ShakeCamera(none, cameraShakeAmount2, rumbleDuration2)
	EffectLinker2.activate(self)
	irkngthandExitEnableRef.enable()
EndFunction

Function TriggerWaterRiseMatch(objectReference myPipe)
	TG08BFloodPipeController PipeController
	PipeController = (myPipe as TG08BFloodPipeController)
	PipeController.waterPlane = waterPlaneRef
	PipeController.heightTarget = currentTranslateTarget
	PipeController.afSpeed = currentTranslateSpeed
	PipeController.stateString = "SyncTranslate"
	myPipe.activate(self)
endFunction

Function MatchWaterRiseAll()
	TriggerWaterRiseMatch(PipeControllerBig01)
	TriggerWaterRiseMatch(PipeControllerBig02)
	TriggerWaterRiseMatch(PipeControllerBig03)
	TriggerWaterRiseMatch(PipeControllerBig04)
	TriggerWaterRiseMatch(PipeControllerSmall01)
	TriggerWaterRiseMatch(PipeControllerSmall02)
	TriggerWaterRiseMatch(PipeControllerSmall03)
	TriggerWaterRiseMatch(PipeControllerSmall04)

EndFunction

Function TriggerAftershock(float rumbleDuration)
	earthQuakeSound.play(game.getPlayer())
	game.ShakeController(rumbleAmount1, rumbleAmount1, rumbleDuration)
	game.ShakeCamera(none, cameraShakeAmount1, rumbleDuration)
	EffectLinker2.activate(self)
	;irkngthandExitEnableRef.enable()
EndFunction



