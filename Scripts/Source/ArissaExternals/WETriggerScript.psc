Scriptname WETriggerScript extends ObjectReference 
{Extends ObjectReference, used to trigger a Wilderness Encounter radiant quest/scene.}

;This trigger script sends a story manager event to start a wilderness enounter. This script figures out which of 4 different xmarkers to pass into the event as a kind of message.
;The xmarkers communicate: which faction controls the hold the trigger box is in, and if it is currently contested in the civil war.
;This is for use with any encounters that need to be Civil War flavored.

;HOW TO SET UP THE TRIGGER:
;Properties:
;	There are properties described as "BASEOBJECT property." These should only be set on the baseobject, and should already be set. Leave this alone.
;	There is a myHoldLocation property described as "REFERENCE property." This should be set on each instance of the trigger in the world. It is the location the trigger is in (example: WhiterunHoldLocation)
;	It's imperative that 
;Markers, LocationRefTypes and links:
;	There are different types of LocationRefTypes associated with the Wilderness Ecounters:
;		WEScene -- denotes an XHeadingMarker that is used in a scene, that is placed surrounding a central marker
;		WESceneCenter -- denotes an xHeadingMarker that is used in a scene, that is placed in a (more or less) central position flanked by "WEScene" markers *there should only be one "WESceneCenter" marker for any given trigger
;			Combined these types of markers are used to stage where actors and references that make up a scene will go. (A group of bandits placed at WEScene markers fighting over an object placed at the WESceneCenterMarker
;		WETravel -- denotes one of a pair of xmarkers to spawn a moving actor to cross paths with the player. WETravel markers should come in pairs and be arranged such that the likely path the player is taking as he hits the trigger box will be such that a creatire spawned at one of the markers traveling to the other will intercept the PlayerPayCrimeGold
; 
;	Place the trigger, and link ref it to any number of markers as appropriate. Place two WETravel markers, and/or a WESceneCenter marker surrounded by three or four WEScene markers. All linked markers must be placed such that they are in the loaded area when the trigger is in the center.
;
;For an example, see the setup in TestWEWorld: TestWEOrigin
;
; NOTE: Going forward, we may need to implement other types of markers, such as Dragon landing zones, etc.


;HOW TO SET UP QUEST:
;Basically a quest fills aliases for travel and/or scene markers using conditions
;There is a "Trigger" Ref Alias filled with Ref1 from the event (the trigger box)
;	Then you fill marker aliases like:
;		IsLinkedTo (Alias:Trigger) && HasRefType "WETravel" 
;	And then using CreateReferenceToObject to spawns things at the appropriate marker aliases.
;	Not all triggers will have links to all marker types, but by making the aliases looking for the marker type non-optional, you will ensure a quest will find all the markers it needs/




;Base Object Properties

Keyword Property WERoadStart auto
{BASEOBJECT property.}

Keyword Property WEStart auto
{BASEOBJECT property.}

ObjectReference Property WEHoldImperialRef Auto		;this is a marker we pass into the SendStoryEvent as a way of saying which Civil War faction controls the hold this trigger is in
{BASEOBJECT property.}

ObjectReference Property WEHoldSonsRef Auto		;this is a marker we pass into the SendStoryEvent as a way saying which Civil War faction controls the hold this trigger is in
{BASEOBJECT property.}


ObjectReference Property WEHoldImperialContestedRef Auto		;this is a marker we pass into the SendStoryEvent as a way of saying which Civil War faction controls the hold this trigger is in && the hold is contested
{BASEOBJECT property.}

ObjectReference Property WEHoldSonsContestedRef Auto		;this is a marker we pass into the SendStoryEvent as a way of saying which Civil War faction controls the hold this trigger is in && the hold is contested
{BASEOBJECT property.}

Quest Property CW Auto
{BASEOBJECT property.}

;Reference Properties

Location Property myHoldLocation Auto
{REFERENCE property.}

bool Property RoadEncounter Auto
{REFERENCE property.}

bool Property TriggerOnLoad Auto
{BASEOBJECT: Should this triggerbox be triggered when it loads instead of when the player enters it?}

int Property EventNum Auto
{REFERENCE property OPTIONAL: Used to start specific encounters - sent as aiValue1}

bool Property EventNumClearedAfterSpawning = True Auto
{REFERENCE property OPTIONAL: default = TRUE; if EventNum is used to spawn a specific encounter, should this be cleared so the next time this trigger activates it picks a random one?}

;internal properties

Int Property myHold auto Hidden						;an integer associated with myHoldLocation in terms of CWs.contestedHold... 1 = Haafingar, 2 = Reach, etc. see CWScript
Int Property myHoldOwner auto Hidden				;an integer associated with myHoldLocation in terms of CWs.<Hold>Owner... 1 = Imperials, 2 = Sons, etc. see CWScript
bool Property myHoldIsContested auto Hidden		;true = my hold is currently the contested hold of the Civil War

bool Property off auto Hidden						;will no longer respond to OnTriggerEnter()

CWScript Property CWs Auto Hidden


Event OnInit()

	if !myHoldLocation
		debug.MessageBox(self + "WARNING: OnInit() myHoldLocation property has not been set, this will result in errors.")
; 		debug.trace(self + "WARNING: OnInit() myHoldLocation property has not been set, this will result in errors.", 2)
	EndIf

	CWs = CW as CWScript
	
	;report my position in the game world
; 	debug.trace(self + "OnInit() myHoldLocation= " + myHoldLocation + "; My position: X=" + GetPositionX() + "; Y=" + GetPositionY() + "; Z=" + GetPositionZ())
	
	
EndEvent

State Off

	Event OnTriggerEnter(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			;do nothing
; 			debug.trace(self + "State 'Off' OnTriggerEnter() doing nothing.")
		EndIf

	EndEvent

	Event OnLoad()
		;do nothing
; 		debug.trace(self + "State 'Off' OnLoad() doing nothing.")
	EndEvent
	
	function StartEncounter()
; 		debug.trace(self + "State 'Off' StartEncounter() doing nothing.")
	EndFunction
		
EndState


Event OnTriggerEnter(ObjectReference akActionRef)
	if TriggerOnLoad == true || akActionRef != Game.GetPlayer()
		return
	EndIf

	StartEncounter()
	
EndEvent

Event OnCellLoad()
	if TriggerOnLoad
		StartEncounter()
	EndIf

EndEvent


function StartEncounter()
	GoToState("Off")
	
	if IsDisabled()	;Short circuit if i'm disabled
		GoToState("On")
		Return	
	EndIf
	
	myHold = CWs.getIntForHoldLocation(myHoldLocation)
	myHoldOwner = CWs.GetHoldOwner(myHold)
	myHoldIsContested = (myHold == CWs.ContestedHold)
	
	;this needs to be set AFTER myHold and myHoldOwner and myHoldIsContested are set
	ObjectReference myHoldFactionControllerMarker = getMyHoldFactionControllerMarker()	
	
; 	debug.trace(self + "OnTriggerEnter(): calling WEStart.SendStoryEvent(" + myHoldLocation + ", " + Self + ", " + myHoldFactionControllerMarker + ")")
	
	if RoadEncounter == false
	
		if EventNum == 0
		
			WEStart.SendStoryEvent(myHoldLocation, Self, myHoldFactionControllerMarker)
		
		Else
			WEStart.SendStoryEvent(myHoldLocation, Self, myHoldFactionControllerMarker, aiValue1 = EventNum)
			if EventNumClearedAfterSpawning == True
				EventNum = 0
			EndIf
		
		EndIf
	
	else	;roadEncounter == true
	
		if EventNum == 0
		
			WERoadStart.SendStoryEvent(myHoldLocation, Self, myHoldFactionControllerMarker)
		
		Else
			WERoadStart.SendStoryEvent(myHoldLocation, Self, myHoldFactionControllerMarker, aiValue1 = EventNum)
			if EventNumClearedAfterSpawning == True
				EventNum = 0
			EndIf
		
		EndIf
	
	endif
	
	off = True

EndFunction

function ReArmTrigger()
	GotoState("")
; 	debug.trace(self + "ReArmTrigger() going to state '' so it can be retriggered.")


EndFunction


ObjectReference Function getMyHoldFactionControllerMarker()
{Returns the xmarker associated with the Civil War faction currently controlling myHold.}

	if myHoldOwner == CWs.iImperials
		if myHoldIsContested
			return WEHoldImperialContestedRef
		Else
			return WEHoldImperialRef
		EndIf
		
	elseif myHoldOwner == CWs.iSons
		if myHoldIsContested
			return WEHoldSonsContestedRef
		Else
			return WEHoldSonsRef
		EndIf
		
	Else
		debug.MessageBox(self + "WARNING: getMyHoldFactionControllerMarker() myHoldOwner property expected to be 1 or 2, instead have:" + myHoldOwner)
; 		debug.trace(self + "WARNING: getMyHoldFactionControllerMarker() myHoldOwner property expected to be 1 or 2, instead have:" + myHoldOwner, 2)
		return None
	EndIf
	
	

EndFunction
