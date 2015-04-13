scriptName TG08BFloodPipeController extends ObjectReference
;
;This script is to control the breaking and effects of a
;	pipe during the flooding sequence of TG08b
;TG08RisingWaterScript sends commands to this
;==========================================================


;==========================================================
;;PROPERTIES BLOCK
;==========================================================

;Object to manage, may be the first of a linkedRef chain
objectReference property WaterStream auto
objectReference property SourcePipe auto
objectReference property IntactPipe auto
objectReference property Splash auto
objectReference property Leaks auto
objectReference property SubmergedEffect auto

;Used to determine which objects/effects are ```active
bool property WaterStreamON = FALSE auto hidden
bool property SourcePipeON  = FALSE auto hidden
bool property IntactPipeON  = TRUE auto hidden
bool property SplashON = FALSE auto hidden
bool property LeaksON = False auto hidden
bool property SubmergedEffectON = False auto hidden
explosion property TG08PipeExplosion auto

;Used to communicate from TG08RisingWaterScript
string property stateString = "leaky" auto hidden

;Properties for the splash Translation
ObjectReference property waterPlane auto hidden
ObjectReference property heightTarget auto hidden

float property afSpeed = 0.5 auto hidden
float property afMaxRotationSpeed = 0.0 auto hidden

bool property pipeBig = true auto
{used for setting offsets off water
	default == true}
float property waterStreamZOffset = 0.0 auto ;= 1000.0 auto
float property waterStreamZOffsetBig = 0.0 auto ;= 1450.0 auto
float property SplashZOffset = 0.0 auto
float property SplashZOffsetBig = 0.0 auto
float property waterStreamStartingHeightOffset = 0.0 auto
float property waterFallSpeed = 1000.0 auto hidden
;==========================================================
;;STATES BLOCK
;==========================================================

auto state intact

	event onBeginState()
; 		debug.Trace(self + " has entered state intact")
		; if LeaksON
			; LeaksON = FALSE
			; TG08DisableLinkChain(Leaks)
		; endif
		
		if SourcePipeON
			SourcePipeON = FALSE
			TG08DisableLinkChain(SourcePipe)
		endif
		
		if !IntactPipeON
			IntactPipeON = TRUE
			TG08EnableLinkChain(IntactPipe)
		endif
		
		if WaterStreamON
			WaterStreamON = FALSE
			TG08DisableLinkChain(WaterStream)
		endif
		
		if SplashON
			SplashON = FALSE
			TG08DisableLinkChain(Splash)
		endif
		
		; if SubmergedEffectON
			; SubmergedEffectON = FALSE
			; TG08DisableLinkChain(SubmergedEffect)
		; endif
		
	endEvent
endstate


state leaky
	
	event onBeginState()
; 		debug.Trace(self + " has entered state leaky")
		; if !LeaksON
			; LeaksON = True
			; TG08EnableLinkChain(Leaks)
		; endif
	endEvent
endState


state broken
	
	event onBeginState()
; 		debug.Trace(self + " has entered state broken")
		; if !LeaksON
			; LeaksON = True
			; TG08EnableLinkChain(Leaks)
		; endif
	

		if !SourcePipeON
			SourcePipeON = TRUE
			TG08EnableLinkChain(SourcePipe)
		endif
		
		if IntactPipeON
			IntactPipeON = FALSE
			IntactPipe.placeatMe(TG08PipeExplosion)
			utility.wait(0.2)
			TG08DisableLinkChain(IntactPipe)
		endif
		
		if !WaterStreamON
			WaterStreamON = TRUE
			TG08EnableWaterStream(WaterStream)
		endif
		
		utility.wait(0.1)
		if !SplashON
			SplashON = TRUE
			TG08EnableLinkChain(Splash)
			utility.wait(0.1)
		endif
	endEvent
endState


state submerged
	
	event onBeginState()
; 		debug.Trace(self + " has entered state submerged")
		; if LeaksON
			; LeaksON = FALSE
			; TG08DisableLinkChain(Leaks)
		; endif
		
		if WaterStreamON
			WaterStreamON = FALSE
			TG08DisableLinkChain(WaterStream)
		endif
		
		if SplashON
			SplashON = FALSE
			TG08DisableLinkChain(Splash)
		endif
		
		if !SubmergedEffectON
			SubmergedEffectON = True
			TG08EnableLinkChain(SubmergedEffect)
		endif
	endEvent
endState

bool property initialTranslationComplete = False auto hidden
;;;;;;;;;;;;;;;;ACTIVATE:::::::::::::::::
event onActivate(objectReference akActivator)
	if stateString != "SyncTranslate"
		LocalGoToState(stateString)
	Elseif initialTranslationComplete
		TG08MatchTranslateLinkChain(Splash)
		TG08MatchWaterStream(WaterStream)
	endif
endEvent
;===================================================================
;;FUNCTION BLOCK
;===================================================================

; Handles activation from Rising water controller
Function LocalGoToState (string myState)
	self.goToState(myState)
endFunction

float property TG08EnableLinkChainTimer auto hidden
; Enables all of the references that are linked, in a chain, to this one.
Function TG08EnableLinkChain(ObjectReference CurrentLink)
	objectReference TopLink
	objectReference LastLink
	TopLink = CurrentLink
; 	debug.trace(self + " is running enable link chain on " + CurrentLink)
	While CurrentLink
; 		debug.trace(self + ": Current enable link is " + CurrentLink)
		CurrentLink.Enable()
		LastLink = CurrentLink
		CurrentLink = CurrentLink.GetLinkedRef()
	endWhile
	
	TG08EnableLinkChainTimer = (utility.getCurrentRealTime() + 5.0)
	While (LastLink.isEnabled() == False) && (TG08EnableLinkChainTimer >= utility.getCurrentRealTime())
		utility.wait(0.3)
	endWhile
	
	if TopLink == Splash
		initialTranslationComplete = True
		TG08MatchTranslateLinkChain(TopLink)
	endif
endFunction


; Disables all of the references that are linked, in a chain, to this one.
Function TG08DisableLinkChain(ObjectReference CurrentLink)
; 	debug.trace(self + " is running disable link chain on " + CurrentLink)
	While CurrentLink
; 		debug.trace(self + ": Current disable link is " + CurrentLink)
		CurrentLink.Disable()
		CurrentLink = CurrentLink.GetLinkedRef()
	endWhile
endFunction

float property TG08MatchTranslateLinkChainTimer auto hidden

; Handles matching the translation of splashes to the rising water
Function TG08MatchTranslateLinkChain(objectReference CurrentLink)
; 	debug.trace(self + " is running match translate on " + CurrentLink)
	While CurrentLink
		float afX
		float afY
		float afZ
		float afXAngle
		float afYAngle
		float afZAngle
		float afTangentMagnitude = 1.0 
		
		afX = CurrentLink.getPositionX()
		afY = CurrentLink.getPositionY()
		afZ = waterPlane.GetPositionZ()
		CurrentLink.stopTranslation()
		utility.wait(0.2)
		CurrentLink.TranslateTo(afX, afY, afZ, afXAngle, afYAngle, afZAngle, 5000, afMaxRotationSpeed)
		TG08MatchTranslateLinkChainTimer = (utility.getCurrentRealTime() + 3.0)
		while (math.abs(afz - CurrentLink.getPositionZ()) >= 80) && (TG08MatchTranslateLinkChainTimer >= utility.getCurrentRealTime())
			utility.wait(0.0)
		endWhile
		CurrentLink.stopTranslation()
		utility.wait(0.2)
		;if pipeBig
		;	afZ = (HeightTarget.getPositionZ() + waterStreamZOffsetBig)
		;else
		;	afZ = (HeightTarget.getPositionZ() + waterStreamZOffset)
		;endif
		afZ = HeightTarget.getPositionZ()
		afXAngle = CurrentLink.getAngleX()
		afYAngle = CurrentLink.getAngleY()
		afZAngle = CurrentLink.getAngleZ()
		
		CurrentLink.TranslateTo(afX, afY, afZ, afXAngle, afYAngle, afZAngle, afSpeed, afMaxRotationSpeed)
		;get next link
		CurrentLink = CurrentLink.GetLinkedRef()
	endWhile
endFunction
	
float property TG08MatchWaterStreamTimer auto hidden
	
Function TG08MatchWaterStream(objectReference CurrentLink)	
; 	debug.Trace(self + ": is running MatchWaterStream")
	float afX
	float afY
	float afZ
	float afXAngle
	float afYAngle
	float afZAngle
	float afTangentMagnitude = 1.0 
	float waterplaneHeight = waterPlane.GetPositionZ()
	
	afX = CurrentLink.getPositionX()
	afY = CurrentLink.getPositionY()
	afZ = waterplaneHeight
	;if pipeBig
	;	afZ = (waterplaneHeight + waterStreamZOffsetBig)
	;else
	;	afZ = (waterplaneHeight + waterStreamZOffset)
	;endif
	CurrentLink.stopTranslation()
	utility.wait(0.2)
	CurrentLink.TranslateTo(afX, afY, afZ, afXAngle, afYAngle, afZAngle, 5000, afMaxRotationSpeed)
	TG08EnableWaterStreamTimer = (utility.getCurrentRealTime() + 3.0)
	while (math.abs(afz - CurrentLink.getPositionZ()) >= 30) && (TG08MatchWaterStreamTimer >= utility.getCurrentRealTime())
		utility.wait(0.0)
	endWhile
	CurrentLink.stopTranslation()
	utility.wait(0.2)
	;if pipeBig
	;	afZ = (HeightTarget.getPositionZ() + waterStreamZOffsetBig)
	;else
	;	afZ = (HeightTarget.getPositionZ() + waterStreamZOffset)
	;endif
	utility.wait(0.2)
	afXAngle = CurrentLink.getAngleX()
	afYAngle = CurrentLink.getAngleY()
	afZAngle = HeightTarget.getPositionZ()
	
	CurrentLink.TranslateTo(afX, afY, afZ, afXAngle, afYAngle, afZAngle, afSpeed, afMaxRotationSpeed)

endFunction

float property TG08EnableWaterStreamTimer auto hidden

Function TG08EnableWaterStream(objectReference CurrentLink)
	;CurrentLink.enable()
	;utility.wait(0.3)
; 	debug.Trace(self + ": is running EnableWaterStream")
	float afX
	float afY
	float afZ
	float afXAngle
	float afYAngle
	float afZAngle
	float afTangentMagnitude = 1.0 
	float waterplaneHeight = waterPlane.GetPositionZ()

	afX = CurrentLink.getPositionX()
	afY = CurrentLink.getPositionY()
	afZ = waterplaneHeight
	; afZ = (waterPlane.GetPositionZ() + waterStreamStartingHeightOffset)
	
	; CurrentLink.setPosition(afX, afY, afZ)
	
	
	;if pipeBig
	;	afZ = (waterplaneHeight + waterStreamZOffsetBig)
	;else
	;	afZ = (waterplaneHeight + waterStreamZOffset)
	;endif
	afXAngle = CurrentLink.getAngleX()
	afYAngle = CurrentLink.getAngleY()
	afZAngle = CurrentLink.getAngleZ()
	
	CurrentLink.TranslateTo(afX, afY, afZ, afXAngle, afYAngle, afZAngle, waterFallSpeed, afMaxRotationSpeed)
	TG08EnableWaterStreamTimer = (utility.getCurrentRealTime() + 8.0)
	while (math.abs(afz - CurrentLink.getPositionZ()) >= 30) && (TG08EnableWaterStreamTimer >= utility.getCurrentRealTime())
		utility.wait(0.0)
	endWhile
	TG08MatchWaterStream(WaterStream)
endFunction

