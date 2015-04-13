scriptName MQ105QuestScript extends Quest Conditional

Location property HighHrothgarLocation auto
ReferenceAlias property Alias_Arngeir auto
ReferenceAlias property Alias_Borri auto

Quest property MQ106 auto
Scene property EinarthTeachScene auto
Scene property PushTrialScene auto
Scene property SprintTrialScene auto


int property MQ105Test auto

int Property targetsHit  Auto  Conditional

int Property sceneCount  Auto  Conditional
{how long did it take player to finish push trial?}


int Property iSprintWordToUnlock = 1 Auto Conditional ; set to which word to unlock (set in quest stage): 1-3

bool bPushTrialWaiting Conditional
bool bPushTrialWeakHit Conditional
bool bPushTrialGoodHit Conditional

bool Property pushTrialWaiting
{set to true when phantom form is summoned, set to false when it goes away}
	bool function get()
   		return bPushTrialWaiting
	endFunction
	function set(bool value)
		bPushTrialWaiting = value
	endFunction
endProperty

bool Property pushTrialWeakHit 
{set to true when player hits form with only the first word of the push, so Arngeir can comment}
	bool function get()
   		return bPushTrialWeakHit 
	endFunction
	function set(bool value)
		bPushTrialWeakHit = value
	endFunction
endProperty

bool Property pushTrialGoodHit
{set to true when player hits form with Fus-Ro, so Arngeir can comment}
	bool function get()
   		return bPushTrialGoodHit
	endFunction
	function set(bool value)
		bPushTrialGoodHit = value
	endFunction
endProperty


bool Property sprintTrialPlayerReady auto Conditional

import Game
import utility

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
	; watch for player to have LOS on note and not be in combat
	if getStageDone(180) == true && getStageDone(190) == false && TombTrigger.bAllTargetsInTrigger
		if Game.GetPlayer().IsInCombat() == 0
			setstage(190)
		endif
	endif
endEvent

GlobalVariable Property MQ105TargetsHit  Auto  
{how many targets have been hit?}

GlobalVariable Property MQ105TargetsTotal Auto  
{how many targets are there total}

function SetWaiting(bool newVal)
	pushTrialWaiting= newVal
endFunction



function IncrementPushTargetCount(Actor target)
; 	debug.trace(self + "IncrementPushTargetCount " + MQ105TargetsHit.value)
	if MQ105TargetsHit.value < MQ105TargetsTotal.value
		if ModObjectiveGlobal(1.0, MQ105TargetsHit, 40, MQ105TargetsTotal.value)
			SetStage(90)
		endif
	endif
endFunction

; call this function before the next target is summoned
function StartNewTarget()
; 	debug.trace(self + " START NEW TARGET")
	; set waiting variable
	PushTrialWaiting = true
	; clear hit variables
	PushTrialGoodHit = false
	PushTrialWeakHit = false
	; reset shout timer
	Game.GetPlayer().SetVoiceRecoveryTime( 0 )
endFunction

; call this function when the player exits the sprint start trigger
function SprintStartTriggerChangeState(bool bOnEnter)
; 	debug.trace(self + " SprintStartTriggerChangeState bOnEnter=" + bOnEnter)
	if bOnEnter
; 		debug.trace(self + " SprintStartTriggerChangeState - setting sprintTrialPlayerReady to TRUE")
		sprintTrialPlayerReady = true
		; if scene already running, do nothing, otherwise start scene
		if GetStageDone(140) == 0 && SprintTrialScene.IsPlaying() == false
			SprintTrialScene.Start()
		endif
	else
; 		debug.trace(self + " SprintStartTriggerChangeState - setting sprintTrialPlayerReady to FALSE")
		; if exiting, check state of trial gate
		; immediately close the gate and restart the scene if the gate isn't open yet
		if SprintTrialSuccessTrigger.IsEnabled() == 0 
			OpenSprintTrialGate(false)
			if sprintTrialPlayerReady
; 				debug.trace(self + " ExitSprintStartTrigger before gate is open - STOP TRYING TO CHEAT!")
				sprintTrialPlayerReady = false
; 				debug.trace(self + " SprintStartTriggerChangeState - setting sprintTrialPlayerReady to FALSE - DONE 1")

				SprintTrialScene.Stop()
				while SprintTrialScene.IsPlaying()
					utility.wait(1)
				endWhile
				SprintTrialScene.Start()
			endif
		endif
		sprintTrialPlayerReady = false
; 		debug.trace(self + " SprintStartTriggerChangeState - setting sprintTrialPlayerReady to FALSE - DONE 2")
	endif

endFunction

function OpenSprintTrialGate(bool bDoOpen = true)
	if bDoOpen
		; open gate & enable success trigger
		SprintTrialGate.SetOpen(true)
		SprintTrialSuccessTrigger.Enable()
	else
		; open gate & enable success trigger
		SprintTrialGate.SetOpen(false)
		SprintTrialSuccessTrigger.Disable()
	endif
endFunction

function GreybeardSpeakingEffect(float fTotalTime = 2.0)
	AMBRumbleShakeGreybeards.Play(Game.GetPlayer())
	GreybeardOutroIMOD.Apply()
	OutroDust1.Activate(Game.GetPlayer())
	OutroTrigger.knockAreaEffect(0.25,250)
;	Game.GetPlayer().PlayIdle(BracedPainIdle)
	game.shakeController(0.5, 0.5, fTotalTime)
	game.shakeCamera(NONE, 0.1 * fTotalTime)
	utility.wait(0.4 * fTotalTime)
	OutroDust2.Activate(Game.GetPlayer())
	utility.wait(0.2 * fTotalTime)
	OutroDust3.Activate(Game.GetPlayer())
	utility.wait(0.1 * fTotalTime)
	OutroTrigger.knockAreaEffect(0.2,250)
	OutroDust4.Activate(Game.GetPlayer())
	utility.wait(0.3 * fTotalTime)
	OutroTrigger.knockAreaEffect(0.2,250)
;	Game.GetPlayer().PlayIdle(BracedPainIdle)
	game.shakeCamera(NONE, 0.01 * fTotalTime)
;	game.shakeController(0.1, 0.1, 1.0)
	OutroDust1.Activate(Game.GetPlayer())
endFunction
ObjectReference Property OutroTrigger  Auto  
{used to for Greybeard speaking effects}

ImageSpaceModifier Property GreybeardOutroIMOD  Auto  
{imagespace modifier for Greybeard speaking outro}

Quest Property MQ00  Auto  

ObjectReference Property OutroDust1  Auto  
ObjectReference Property OutroDust2  Auto  
ObjectReference Property OutroDust3  Auto  
ObjectReference Property OutroDust4  Auto  

Idle Property StaggerIdle  Auto  

WordOfPower Property SprintWord  Auto  
{the word that Borri teaches player (set by quest stage)
}

DefaultOnEnter Property TombTrigger  Auto  
{trigger to tell when player is close to tomb}

ObjectReference Property Tomb  Auto  
{tomb, for LOS check}

Idle Property BracedPainIdle  Auto  

ObjectReference Property SprintTrialGate  Auto  

ObjectReference Property SprintTrialSuccessTrigger  Auto  

Sound Property AMBRumbleShakeGreybeards  Auto  
