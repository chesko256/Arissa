Scriptname ResourceObjectScript extends ObjectReference  conditional
{This script controls all types of resource objects... "BASE OBJECT property" denotes a property that should be set on the BaseObject, "REFERENCE property" a property that should be set on each individual reference.}

;Description:
;This script lives on the base object of each resource type activator. It has "Base Object" properties which should be defined on the baseobject activator, and "Reference Properties" which should be set on the reference object in the render window.
;This script will control all of the resource types, with animation scripting handled by extended (child) scripts for each type of resource.

;Note to Designers:
;This script requires an additional "sybling" activator with the SabotageResourceActivatorScript.psc attached to prompt the player to sabotage it (it calls the TryToSabotage() function in this script.)
;You can use the ResourceState property in conditions to set up packages where you need an actor to do something in the different states (it's possible as we implement more types of resources we will need to expand the list of states)


;Note to Artists and Animators:
;It is unlikely you will need to edit this script. You will likely be working with a child script that extends this one to control the animation. See ResourceObjectSawMillScript.psc for an example.

;Request:
;*** !!!! PLEASE DO NOT EDIT THIS SCRIPT WITHOUT SPEAKING TO ME FIRST. THANK YOU! --jduvall !!!! ***


;<PROPERTIES>
;Properties to set on the base object:
CWScript Property CWS Auto
{BASE OBJECT property: Pointer to CWScript attached to the CW quest}

Keyword Property WISabotageStart Auto
{BASE OBJECT property: Pointer to the WISabotageStart keyword, which is used to start a radiant quest WISabotage}

Message property SabotageMessage Auto
{BASE OBJECT property: The message to display when prompting the player to sabotage this object.}

Message property SabotageReadyMessage Auto
{BASE OBJECT property: The message to display when the object is ready to be sabotaged.}

Message property RepairMessage Auto
{BASE OBJECT property: The message to display when prompting the player to repair this object.}

Int Property ResourceType Auto	;1 = Wheat Mill(Farm), 2 = Saw Mill, 3 = Smelter(Mine)
{BASE OBJECT property: Which type of Resource Object am I? 1 = Wheat Mill(FARM), 2 = Saw Mill, 3 = Smelter(MINE)}

Message property BusyMessage Auto
{BASE OBJECT property: The message to display when the player activates while in BUSY state}

Message property ReadyMessage Auto
{BASE OBJECT property: The message to display when the player activates while in READY state}

;Properties to be set on the reference object:
ObjectReference Property Worker  Auto  
{REFERENCE property: (Optional) If included, this actor will be EVPed each time the resource object changes state}

;Hidden Properties
int Property ResourceState  Auto Hidden Conditional 	;values determined by needs of children scripts - usually used as variables on Actor's packages to get them to interact with various levers, etc.

;</PROPERTIES>


;<INTERNAL VARIABLES>
bool property sabotaged Auto Hidden
bool property readyForSabotage Auto Hidden

;State Constant INTs -- used for things like conditions on packages
int property destroyed = -1 Auto Hidden
int property waiting = 0 Auto Hidden
int property busy = 1 Auto Hidden
int property ready = 2 Auto Hidden

;State Constant STRINGs -- used for script states and console command SV readability
string property strDestroyed = "destroyed" Auto Hidden
string property strWaiting = "waiting" Auto Hidden
string property strBusy = "busy" Auto Hidden
string property strReady = "ready" Auto Hidden

;</INTERNAL VARIABLES>


;<STATE CONTROL>
;Generic States
Auto State waiting
EndState

State ready
EndState

State destroyed
EndState

State busy
EndState

;call this function to change state
;the ResourceState property lives in the parent script
;the ResourceState property is used to condition worker's packages to pull lever, etc.
function ChangeState(int newState)
	if newState == destroyed
		gotoState(strDestroyed)
		ResourceState = destroyed
		
	elseif newState == waiting
		gotoState(strWaiting)
		ResourceState = waiting

	elseif newState == busy
		gotoState(strBusy)
		ResourceState = busy
		
	elseif newState == ready
		gotoState(strReady)
		ResourceState = ready
		
	Else
; 		debug.trace(self + "WARNING: ChangeState() recieved unexpected newState parameter of '" + newState + "'", 2)
	endif
	
	Actor workerActor = (Worker as Actor)
	if workerActor
		workerActor.EvaluatePackage()
	endif
endFunction

;</STATE CONTROL>

;<ACTIVATION EVENTS> -----------
Event onActivate ( objectReference triggerRef )
; 	debug.trace(self + " activated by " + triggerRef)
endEvent

State ready
; log is loaded into tray, waiting to be cut
	Event onActivate ( objectReference triggerRef )
		; if activated by an actor, do nothing special. If activated by non-actor, assume trying to saw
		Actor triggerActor = triggerRef as Actor
		if triggerActor == None
; 			debug.trace(self + "activated by something other than player")
			; saw the log:
			if readyForSabotage
				ChangeState(busy)
				sabotage()
				ChangeState(destroyed)
			else
				ChangeState(busy)
				work()
				ChangeState(waiting)
			endif
		elseif triggerActor == Game.GetPlayer()
			; show READY message
			ReadyMessage.Show()
		endif
	EndEvent

EndState

State busy
	Event onActivate ( objectReference triggerRef )
		; if activated by an actor, do nothing special. If activated by non-actor, assume trying to saw
		if triggerRef == Game.GetPlayer()
			; show BUSY message
			BusyMessage.Show()
		endif
	EndEvent

endState
;</ACTIVATION EVENTS> -----------


;This intercepts all the animation events for all the types of resources, and then calls a function that needs to be defined in each of the children scripts who's parameter is the string name of the activation event
Event OnAnimationEvent(ObjectReference akSource, string asEventName)

; 	debug.trace(self + "OnAnimationEvent() recieved " + asEventName)

	if asEventName == "DestructionComplete"

; 		debug.trace(self + "Sabotage() setting sabotaged to true")
		sabotaged = True
	
; 		debug.trace(self + "Sabotage() calling WISabotageStart.SendStoryEvent([" + GetEditorLocation() +", [" + Self + "]])")
		CWs.modObjectiveBySabotage(self)
		WISabotageStart.SendStoryEvent(GetEditorLocation(), Self)
		
		DamageObject(9999)	;the purpose of this is to set the destroyed flag in the destruction data so that guards no longer guard it, and civil war missions no longer fill with it in aliases.
	
	Else
		ProcessAnimationEvent(asEventName)		;THIS IS WHAT THE CHILD SCRIPT USES TO PLAY PROPER ANIMATIONS

	EndIf
EndEvent


;<GAME PLAY FUNCTIONS> -----------
; this function is called by the sabotage activator script
Function TryToSabotage(objectReference triggerRef)
	if sabotaged
		; if already sabotaged, prompt for repair
		; TEMP -- repair will most likely happen off-screen
		if (triggerRef == Game.GetPlayer() && PromptPlayerRepair())
			; repair the mill
			ChangeState(busy)
			repair()
			ChangeState(waiting)
		Else
			;do nothing, player said "NO."			
		endif
	else
		; if ready for sabotage, just give message
		if readyForSabotage
			if triggerRef == Game.GetPlayer()
				SabotageReadyMessage.Show()
			endif
		else
			; otherwise, prompt player for choice
			if triggerRef != Game.GetPlayer() || PromptPlayerSabotage()
				; get mill ready for Sabotage
				readyForSabotage = true
			Else
				;do nothing, player said "NO."			
			endif
		endif
	endif
endFunction

int Function GetResourceType()
	return ResourceType
EndFunction

bool Function IsSabotaged()
; 	debug.trace(self + "IsSabotaged() returning " + sabotaged)
	return sabotaged
EndFunction

bool Function PromptPlayerSabotage()
; 	debug.trace(self + "PromptPlayerSabotage() asking player if he wants to sabotage")
	if SabotageMessage.Show() == 1
; 		debug.trace(self + "PromptPlayerSabotage() returning True")
		return True
	Else
; 		debug.trace(self + "PromptPlayerSabotage() returning False")
		return False
	EndIf
EndFunction

bool Function PromptPlayerRepair()
; 	debug.trace(self + "PromptPlayerRepair() asking player if he wants to Repair")
	if RepairMessage.Show() == 1
; 		debug.trace(self + "PromptPlayerRepair() returning True")
		return True
	Else
; 		debug.trace(self + "PromptPlayerRepair() returning False")
		return False
	EndIf
EndFunction


Function Sabotage()
; 	debug.trace(self + "Sabotage() calling animation control functions")
	DestroyResource() ;***animation control function defined in child script
	
EndFunction

Function Repair()
; 	debug.trace(self + "Repair() calling animation control functions")
	
	RepairResource() ;***animation control function defined in child script
	
	ClearDestruction()	;the purpose of this is to clear the destroyed flag in the destruction data so that guards guard it, and civil war missions fill with it in aliases.
		
; 	debug.trace(self + "Repair() setting sabotaged to false")
	readyForSabotage = false
	sabotaged = False
	
EndFunction

Function Work()
; 	debug.trace(self + "Work() calling animation control functions")
	WorkResource() ;***animation control function defined in child script
	
EndFunction

;</GAME PLAY FUNCTIONS> -----------


;<ANIMATION CONTROL FUNCTIONS> -- ***Child scripts will extend these***
;***Child scripts will extend these***

function ProcessAnimationEvent(string asEventName)
; 	debug.trace(self + "WARNING: ProcessAnimationEvent() is not defined by child script.", 2)
EndFunction 

function DestroyResource()
; 	debug.trace(self + "WARNING: DestroyResource() is not defined by child script.", 2)
 endFunction

function RepairResource()
; 	debug.trace(self + "WARNING: RepairResource() is not defined by child script.", 2)
endFunction
 
function WorkResource()
; 	debug.trace(self + "WARNING: WorkResource() is not defined by child script.", 2)
EndFunction

;</ANIMATION CONTROL FUNCTIONS> -- ***Child scripts will extend these***
