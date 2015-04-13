scriptName TrapTriggerBASE extends objectReference hidden
;
;
;This is the base trap trigger script and handles what the trigger tells the trap
;Any trigger should be useable with any trap
;Activation params are on the trigger, toggle, number of times it can be triggered, etc.
;Trap params are on the trap (damage, timing, etc)
;Some triggers will be extended from this base to handle animation, etc.
;================================================================

import debug


int Count															;if Finite = 1, Determines how many times this trigger can be used
int property CountUsed auto hidden							;Used to compare times triggered to max triggers allowed
int property Type auto hidden 								;This is to determine trigger to send to the trap
		;The trap will handle its behavior based on this signal
		;0 = Single - fire the trap once do one time
		;1 = Hold - on entry turn on, on exit turn off
		;2 = Toggle - on entry or use toggle trap state
		;3 = Turn On - on entry or use turn on trap
		;4 = Turn Off - on entry or use turn off trap
sound property TriggerSound auto
objectReference property lastTriggerRef auto hidden
int property soundLevel = 10 auto

int objInTriggerVar 
int property objectsInTrigger hidden 
     function set(int value) 
          objInTriggerVar = value 
          ;TraceStack("Setting objectsInTrigger to " + value) 
     endFunction 
     int function get() 
          return objInTriggerVar 
     endFunction 
endProperty

faction property owningFaction Auto
actorBase property owningActorBase Auto
bool property doOnceBase = False auto hidden
bool property playerOnlyTrigger = false auto
bool property checkForLightFootPerk = false Auto
{Setting this will give a chance that the trap trigger will not Fire
	this does not work on triggers with the HOLD trigger type
	Set on by default on all pressure plates
	you should only mess with this locally for triggerboxes}
bool property checkForLightHandsPerk = false Auto
{Setting this will give a chance that the trap trigger will not Fire when lockpicked
	this is used specifically for hinge triggers or other things like that
	set to on by default on the hinge trigger}
perk property lightFootPerk Auto
globalVariable property LightFootGlobalVar auto
perk property lightHandsPerk Auto
globalVariable property LightHandsGlobalVar auto

bool property blockActivate = false Auto
{block activation of this by the player, only used for trapLinker
	default = False}

bool property FiniteUse auto
    {If true this has a finite number of uses as defined by the TriggerCount, and then will not fire}

bool property isTriggerVolume = False auto
{This property is used to tell the trap trigger if it is a trigger volume
	if true, on cell attach it will try to check if there are object in the trigger and go to state inactive if not
	This should be turned to TRUE for pressure plates & triggerboxes
	default = false}
	
int property TriggerCount
	{the number of times this Trigger can fire, only used if FiniteUse is True}
	int Function Get()
		return Count
	endFunction
	
	Function Set (int value)
		if (value >= 1 && value <= 100)
			Count = Value
		else
			Count = 1
		endif
	endFunction
endProperty

int property TriggerType
		{This property determines how the trigger will tell the trap to fire
		0 = Single Fire
		1 = Hold
		2 = Toggle
		3 = Turn On
		4 = Turn Off}
	int Function Get()
		return Type
	endFunction
	
	Function Set (int value)
		if (value >= 0 && value <= 4)
			Type = value
			StoredTriggerType = Value
		else
			Type = 0
			StoredTriggerType = 0
		endif
	endFunction
endProperty

int property StoredTriggerType auto Hidden
{this stores what the triggerType was set to on the Ref
	used for trapLinker in case of activation by non trapTriggerBase ref}

event onCellAttach()
	if self.GetFactionOwner()
		owningFaction = self.GetFactionOwner()
	ElseIf self.GetActorOwner()
		owningActorBase = (self.GetActorOwner() as actorBase)
	endif

	if blockActivate
		self.blockActivation(true)
	endif
	
	;/
	if !doOnceBase
		StoredTriggerType = TriggerType
		doOnceBase = True
	endif
	/;
endEvent

Event onCellLoad()
	objectsInTrigger = self.GetTriggerObjectCount()
	if isTriggerVolume && objectsInTrigger == 0
		goToState ("Inactive")
	endif
endEvent

;THIS SECTION IS USED FOR TRAP LINKERS
event onActivate(objectReference akActivator)
; 	debug.Trace(self + " has been activated by + " + akActivator)
; 	debug.Trace(self + ": Type = " + Type + ", StoredTriggerType = " + StoredTriggerType)
	if blockActivate && akActivator != (self as objectReference)
		if (akActivator as trapTriggerBase)
; 			debug.Trace(akActivator + " was able to be cast as trapTriggerBase")
; 			debug.Trace(self + " triggerType was " + triggerType)
			TriggerType = (akActivator as trapTriggerBase).TriggerType
; 			debug.Trace(self + " triggerType is now " + triggerType)
		
		
		else	
; 			debug.Trace(akActivator + " was NOT able to be cast as trapTriggerBase")
			triggerType = StoredTriggerType
		endif
		
		if blockActivate
			self.blockActivation(false)
			utility.wait(0.0)
			localActivateFunction()
			self.Activate(self)
			self.blockActivation(true)
		endif
		
	endif
endEvent

;================================================================

auto State Inactive

	event onBeginState()
; 		debug.Trace(self + ": is calling onBeginState Inactive")
; 		debug.Trace(self + ": StoredTriggerType = " + StoredTriggerType + ", objectsInTrigger = " + objectsInTrigger)
		if (StoredTriggerType == 1 && objectsInTrigger == 0)                                                                                                                  ;type 1 = hold, so deprecate here if necessary
			if (FiniteUse == TRUE && CountUsed < Count);if finite use and count > count used
				CountUsed += 1                                                                                               ;increase count for hold type triggers
			endif
			Type = 4
			utility.wait(0.1)
			activate(self as objectReference)
			utility.wait(0.1)
			;Type = 1
		else
; 			debug.Trace(self + "StoredTriggerType = " + StoredTriggerType + ", ObjectsInTrigger = " + objectsInTrigger)
		endif
	endEvent
	
	event OnTriggerEnter (objectReference triggerRef)
		if acceptableTrigger(triggerRef)
; 			debug.Trace(self + " has been entered by " + triggerRef)
			lastTriggerRef = triggerRef
			objectsInTrigger = self.GetTriggerObjectCount()
			if (FiniteUse == TRUE     && CountUsed < Count)               ;if finite use and count > count used
				;TRACE("Finite Use")
				if (Type != 1)                                                                                                      ;type 1 = hold so only increase on leave
					CountUsed += 1                                                                                               ;increase count used
					;TRACE("Increasing Count on enter")
				endif
				goToState( "Active" )
			endif
			
			if (FiniteUse == FALSE)
				;TRACE("Infinite Use")
				goToState( "Active" )
			endif     
		endif
	endevent

	event OnTriggerLeave (objectReference triggerRef)
		if acceptableTrigger(triggerRef)
; 			debug.Trace(self + " has been exited by " + triggerRef)
			lastTriggerRef = triggerRef
			objectsInTrigger = self.GetTriggerObjectCount()
; 			debug.Trace(self + ": StoredTriggerType = " + StoredTriggerType + ", objectsInTrigger = " + objectsInTrigger)
			if (StoredTriggerType == 1 && objectsInTrigger == 0)                                                                                                                  ;type 1 = hold, so deprecate here if necessary
				if (FiniteUse == TRUE && CountUsed < Count);if finite use and count > count used
					CountUsed += 1                                                                                               ;increase count for hold type triggers
				endif
				Type = 4
				utility.wait(0.1)
				activate(self as objectReference)
				utility.wait(0.1)
				;Type = 1
			endif
		endif
	endevent
	
endstate


State Active
	Event onBeginState()
; 		debug.Trace(self + ": is calling onBeginState Active")
; 		debug.Trace(self + ": StoredTriggerType = " + StoredTriggerType + ", objectsInTrigger = " + objectsInTrigger)
		if (StoredTriggerType == 1)
			Type = 3
			utility.wait(0.1)
			activate(self as objectReference)
			utility.wait(0.1)
			;Type = 1
		else
			activate(self as objectReference)
		endif
		
		if objectsInTrigger == 0
			goToState( "Inactive" )
		endif
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )
		if acceptableTrigger(triggerRef)
; 			debug.Trace(self + " has been entered by " + triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
		endif
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )      
		if acceptableTrigger(triggerRef)
; 			debug.Trace(self + " has been exited by " + triggerRef)
			objectsInTrigger = self.GetTriggerObjectCount()
			if objectsInTrigger == 0
				goToState ("Inactive")
			endif
		endif
	endEvent
	
	event OnMagicEffectApply(objectReference akCaster, MagicEffect akEffect)
		Trace("MagicEffectHit")
		activate(self as objectReference)
		goToState( "Inactive" )
	endEvent
endState

;The following function is used to filter for acceptable objects to trigger this
;if it is player only, then ONLY the player will trigger it and nothing else, including projectiles
;if there is an owning faction and it is not player only then everything BUT actors
                ;that are part of that owning faction will trigger it
bool function acceptableTrigger(objectReference triggerRef)

; 	debug.Trace(self + " is checking if " + triggerRef + " is an acceptable trigger")
	if playerOnlyTrigger
		if triggerRef == game.getPlayer()
; 			debug.Trace(self + " has found that " + triggerRef + " is an acceptable trigger")
			if checkPerks(triggerRef)
				Return True
			Else
				Return False
			endif
		Else
; 			debug.Trace(self + " has found that " + triggerRef + " is not an acceptable trigger")
			return False
		endif
	Else
		if !(triggerRef as actor)	;if this is not a player only trigger and this is not an actor
			return True
		elseif owningFaction
			if (triggerRef as actor).IsInFaction(owningFaction)
; 				debug.Trace(self + " has found that " + triggerRef + " is not an acceptable trigger")
				return False
			else
; 				debug.Trace(self + " has found that " + triggerRef + " is an acceptable trigger")
				if checkPerks(triggerRef)
					Return True
				Else
					Return False
				endif
			endif
		else
			if owningActorBase
				if (triggerRef as actor).getActorBase() == owningActorBase
; 					debug.Trace(self + " has found that " + triggerRef + " is not an acceptable trigger")
					return False
				Else
; 					debug.Trace(self + " has found that " + triggerRef + " is an acceptable trigger")
					if checkPerks(triggerRef)
						Return True
					Else
						Return False
					endif
				endif
			else
; 				debug.Trace(self + " has found that " + triggerRef + " is an acceptable trigger")
				if checkPerks(triggerRef)
					Return True
				Else
					Return False
				endif
			endif
		endif
	endif
endFunction

Bool function checkPerks(objectReference triggerRef)
	if checkForLightFootPerk
; 		debug.Trace(self + " is checking if " + triggerRef + " has LightFoot Perk")
		if  (triggerRef as actor).hasPerk(lightFootPerk)
; 			debug.Trace(self + " has found that " + triggerRef + " has LightFoot Perk")
			if utility.randomFloat(0.0,100.00) <= LightFootGlobalVar.getValue()
; 				debug.Trace(self + " is returning false due to failed lightfoot roll")
				return False
			else
; 				debug.Trace(self + " is returning true due to successful lightfoot roll")
				return True
			endif
		Else
; 			debug.Trace(self + " has found that " + triggerRef + " doesn't have the LightFoot Perk")
			Return True
		EndIf
	elseif checkForLightHandsPerk
; 		debug.Trace(self + " is checking if " + triggerRef + " has LightHands Perk")
		if  (triggerRef as actor).hasPerk(lightHandsPerk)
; 			debug.Trace(self + " has found that " + triggerRef + " has LightFoot Perk")
			if utility.randomFloat(0.0,100.00) <= LightHandsGlobalVar.getValue()
; 				debug.Trace(self + " is returning false due to failed lightHands roll")
				return False
			else
; 				debug.Trace(self + " is returning true due to successful lightHands roll")
				return True
			endif
		Else
; 			debug.Trace(self + " has found that " + triggerRef + " doesn't have the LightFoot Perk")
			Return True
		EndIf
	Else
; 		debug.Trace(self + " has found that " + triggerRef + " doesn't have applicable perks")
		return True
	EndIf
endFunction

function localActivateFunction() ;placeholder function for anything that may need to be on the child activate event
endFunction


















	
	
	
		
