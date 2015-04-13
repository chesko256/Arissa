scriptname DA13GooActivatorScript extends objectReference
{Script for activator that triggers DA13 vision w/Peryite}

;=================================================================================;
import game

quest property DA13 auto
imagespacemodifier property DA13PeryiteVisionImod auto
imagespacemodifier property whiteOut auto
form property DA13hallucinatedSkeever auto
objectReference property DA13VisionObjectsParent auto

objectReference player
objectReference Peryite
QF_DA13_0008998D DA13script

int triggerStage
;=================================================================================;

EVENT onLoad()
	setUpVars()
	gotoState("VisionOne")
endEVENT

;=================================================================================;

STATE VisionOne

	EVENT onActivate(objectReference actronaut)
		
		setUpVars()
		
		if actronaut == game.getPlayer() 
			; Handling for the initial quest-giving hallucination 
			if DA13.getStage() == 21
				DA13.setStage(30)
				triggerStage = 45
				BeginVision()
			endif

			; handle re-activation while still "under" influence but has exited dialogue to look around?
			if DA13.getStage() > 21 &&  DA13.getStage() < 45
				Peryite.activate(getPlayer())
			endif
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			; handle after Orchendor is dead
			if DA13.getStage() >= 75 && DA13.getStage() < 100
				DA13.setStage(80)
				triggerStage = 100
				BeginVision()				
			endif
			; handle re-activation for second hallucination/vision
			if DA13.getStage() > 75 && DA13.getStageDone(100) == FALSE
				Peryite.activate(player)
			endif
		endif		
	
	endEVENT

	EVENT onUpdate()
	
		bool continueUpdating = TRUE
	
; 		DEBUG.TRACE("DA13: isInMenuMode() == "+utility.isInMenuMode())

		if DA13.getStageDone(triggerStage) == FALSE
				
; 			debug.trace("DA13 Debug: is the Player is looking away?")
; 			debug.trace("Heading Angle is " +player.getHeadingAngle(Peryite))
			if !Peryite.isInDialogueWithPlayer() && (player.getHeadingAngle(Peryite) > 50 || player.getHeadingAngle(Peryite) < -50)
; 				debug.trace("Heading angle check pass, so re-greet by forcing an activate")
				Peryite.activate(player)
			endif
		else
			; this takes us out of the vision
			endVision()
			continueUpdating = FALSE
			;unRegisterForUpdate()
			; clean up if this is the last bit
			if triggerStage == 100
				self.disable()
				self.delete()
			endif
		endif
		
		if continueUpdating
			registerForSingleUpdate(1.0)
		endif
		
	endEVENT
	
endSTATE

;=================================================================================;

FUNCTION setUpVars()
	; go ahead and define this as a function just as a safety/convenience to call it each time
	if DA13script == NONE
		DA13script = DA13 as QF_DA13_0008998D
	endif
	
	if Peryite == NONE
		Peryite = (DA13script.Alias_Peryite).getReference()
	endif
	
	if player == NONE
		player = game.getPlayer()
	endif
	
endFUNCTION

FUNCTION BeginVision()
			; debug.messageBox("Trigger Vision w/Peryite")
			game.disablePlayerControls(true, true, false, false, true, true, false, false)
			
			whiteOut.apply()
			utility.wait(3.0)
			DA13PeryiteVisionImod.applyCrossFade(2.0)
			DA13VisionObjectsParent.enable()
			
			; set up a "forcegreet" by Peryite
			Peryite.activate(getPlayer())
			
			; register for update so we can monitor the player during this
			registerForSingleUpdate(1.0)
endFUNCTION

FUNCTION EndVision()
	;unregisterForUpdate()
	DA13VisionObjectsParent.disable()
	whiteout.apply()
	utility.wait(3)
	DA13PeryiteVisionImod.Remove()

	game.enablePlayerControls()
endFUNCTION

; bool exterminating = TRUE
		; while exterminating == TRUE
		;	search for any of the ghostly rats nearby
			; objectReference nextRef = FindClosestReferenceOfTypeFromRef(DA13hallucinatedSkeever, self, 4096)
			; if nextRef != NONE
				; nextRef.disable()
				; nextRef.delete()
			; else
				; exterminating = FALSE
			; endif
		; endWhile
		
		; STATE VisionTwo
	; EVENT onActivate(objectReference actronaut)
	
		; setUpVars()
		
		; if actronaut == player
			; if DA13.getStage() == 75
				; DA13.setStage(80)
				; BeginVision()
			; elseif DA13.getStage() > 75 && DA13.getStageDone(100) == FALSE
				; Peryite.activate(player)
			; endif
		; endif
	; endEVENT
	
	; EVENT onUpdate()
	; if DA13.getStageDone(100) == FALSE
				
			; if player.getHeadingAngle(Peryite) > 50 || player.getHeadingAngle(Peryite) < -50
				; Peryite.activate(player)
			; endif
		; else
			;this takes us out of the vision
			; endVision()
			; self.disable()
			; self.delete()
		; endif
	; endEVENT
; endSTATE
;=================================================================================;