;THIS SCRIPT IS NOW OBSOLETE!!!!

Scriptname CWResetScript extends Quest  
{Watches for negative CWOwner keyword data on locations, and fires events to story manager to start CWResetGarrison quest.}
;This script checks to see if any locations have negative CWOwner keywords (set by CWScript.SetOwner() function) and fires off CWResetGarrison radiant quests to reset the location and it's guards

Quest Property CWQuest  Auto  
{Pointer to CW quest}

Keyword Property CWOwner auto
{Pointer to CWOwner keyword}

Keyword Property CWResetGarrisonStart Auto
{Pointer to CWResetGarrisonStart keyword}

Quest Property CWResetGarrison  Auto  
{pointer to CWResetGarrison quest}

CWScript Property CW auto hidden
{Pointer to CW quest}


FormArray Property LocArray auto Hidden
location Property LocToReset auto hidden


;Event OnInit()
;
; ;	debug.trace("CWResetScript OnInit()")
;
;	CW = CWQuest as CWScript
;	RegisterForUpdate(5)
;	
;	LocArray = (Self as Form) as FormArray
;	
;EndEvent


;auto State WatchingArray
;	event OnUpdate()
;		while LocArray.size() > 0
;			GoToState("ProcessingArray") ;we have something in the array, so stop processing OnUpdate() events while we loop through the array and reset locations in it
; ; ;			debug.traceConditional("CWResetScript: LocArray.size() > 0, we in while loop to process locations. State of script set to 'ProcessingArray' which does nothing.", debugOn.value)
;			
;			while CWResetGarrison.IsRunning() == 1		;do nothing until CWResetGarrison is no longer running
;					;do nothing...
;			EndWhile
;			
;			LocToReset = LocArray.Pop() as location	;pop of the last item in the array as LocToReset
; ; ;			debug.traceConditional("CWResetScript: CWResetGarrison.IsRunning() == 0, popping off location from array (" + LocToReset + ")", debugOn.value)
;
;;### *** !!!! *** !!! TO DO: Change the below to a LocToReset.IsLoaded() when we get that functionality... it will be safer			
;			While LocToReset == Game.GetPlayer().GetCurrentLocation()	;do nothing until the player isn't in same location as the LocToReset
;				;do nothing
; ; ;				debug.traceConditional("CWResetScript: WatchingArray, Player is in Location we want to reset:" + LocToReset, debugOn.value)
;			EndWhile
;			
; ; ;			debug.traceConditional("CWResetScript: starting reset garrison quest, CWResetGarrisson.SendStoryEvent(" + LocToReset + ")", debugOn.value)
;			CWResetGarrisonStart.SendStoryEvent(LocToReset)
;			
;		EndWhile
;		
;		;we are done looping through the array, change state back to WatchingArray so we catch onUpdate events so we can check the array size again
; ; ;		debug.traceConditional("CWResetScript: LocArray.size() == 0, setting state of script to 'WatchingArray' to catch LocArray.size() > 0.", debugOn.value)
;		GoToState("WatchingArray")
;		
;	EndEvent
;EndState

;state ProcessingArray
;	Event onUpdate()
;		;do nothing... we are in the middle of processing the locArray to reset locations in it, so we don't want to do anything else if an OnUpdate event comes from the game
;	EndEvent
;
;EndState

