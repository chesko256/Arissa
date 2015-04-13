Scriptname MQ302Script extends Quest  Conditional

Location Property HighHrothgarLocation  Auto  

import game
import debug

function MoveToCouncil(ReferenceAlias guestAlias, ObjectReference partyMarker)
	Actor guest = guestAlias.GetActorRef()
	; first, check if empty
	if guest == None
		return
	endif

	; clear enemy flag on crime faction so no craziness in council
	Faction crimeFaction = guest.GetCrimeFaction()
	if crimeFaction
		crimeFaction.SetPlayerEnemy(false)
	endif

	; move them to the party marker if not near the player
	if guest.IsNearPlayer() == 0
		guest.moveTo(partyMarker)
	endif
endFunction

; return council NPCs
function MoveHome(ReferenceAlias guestAlias)
	Actor guest = guestAlias.GetActorRef()
	; first, check if empty
	if guest == None
		return
	endif

	; move to editor location
	if guest.IsNearPlayer() == 0
		guest.MoveToMyEditorLocation()
	endif
endFunction



function TransferHoldControl()
	trace("MQ302: TransferHoldControl start")
	; this is where we actually switch control of all the holds agreed to in the council
	CWScript sCW = CW as CWScript

	; Is the main city changing hands?
	if GetStageDone(141) == 0
		; yes
		if CityToSwitch == 1
			trace("MQ302: TransferHoldControl: give the Reach to Sons")
			sCW.SetHoldOwnerByInt(2, 2, DiplomaticVictory = true)
		else
			trace("MQ302: TransferHoldControl: give the Rift to Imperials")
			sCW.SetHoldOwnerByInt(9, 1, DiplomaticVictory = true)
		endif
	endif
	
	; Major holds changing hands?
	if GetStageDone(142)
		if CityToSwitch == 1	; Imperials are giving up Markarth, so give them a major hold in compensation
	trace("MQ302: TransferHoldControl: give " + SonsMajorHoldID + " to Imperials")
			sCW.SetHoldOwnerByInt(SonsMajorHoldID, 1, DiplomaticVictory = true)
		else						; Sons are giving up Riften - so give them major hold in compensation
	trace("MQ302: TransferHoldControl: give " + ImperialMajorHoldID + " to Sons")
			sCW.SetHoldOwnerByInt(ImperialMajorHoldID, 2, DiplomaticVictory = true)
		endif
	endif

	; Minor holds changing hands?
	; main concession
	if GetStageDone(143)
		if CityToSwitch == 1	; Imperials are giving up Markarth, so give them a minor hold in compensation
			trace("MQ302: TransferHoldControl: give " + SonsMinorHoldID + " to Imperials")
			sCW.SetHoldOwnerByInt(SonsMinorHoldID, 1, DiplomaticVictory = true)
		else						; Sons are giving up Riften, so give them a minor hold in compensation
		trace("MQ302: TransferHoldControl: give " + ImperialMinorHoldID + " to Sons")
			sCW.SetHoldOwnerByInt(ImperialMinorHoldID, 2, DiplomaticVictory = true)
		endif
	endif

	; secondary concession
	if GetStageDone(201) && GetStageDone(205)
		trace("MQ302: TransferHoldControl: give " + SonsMinorHold2ID + " to Imperials")
		sCW.SetHoldOwnerByInt(SonsMinorHold2ID, 1, DiplomaticVictory = true)
	endif
	
	if GetStageDone(202) && GetStageDone(206)
		trace("MQ302: TransferHoldControl: give " + ImperialMinorHold2ID + " to Sons")
		sCW.SetHoldOwnerByInt(ImperialMinorHold2ID, 2, DiplomaticVictory = true)
	endif
	
endFunction

function StartLoopingConcessionScene()
	trace("MQ302: StartLoopingConcessionScene")
	; which scene to start depends on who's losing
	if GetStageDone(181)
		; Imperials asking for concessions
		CouncilScene5_I.ForceStart()
	else
		; Sons asking for concessions
		CouncilScene5_S.ForceStart()
	endif
endFunction

; increment each time the player favors one side or the other
function IncrementNegotiationDelta(int value)
	trace("MQ302: IncrementNegotiationDelta: " + NegotiationDelta + " + " + value)
	NegotiationDelta = NegotiationDelta + value
endFunction


function SetNegotiationLocations()
	CWScript sCW = CW as CWScript

	; get IDs for the major and minor holds
; 	debug.trace(self + "GetHoldID for " + Alias_SonsMajorHold.GetLocation())
	SonsMajorHoldID = sCW.GetHoldID(Alias_SonsMajorHold.GetLocation())
; 	debug.trace(self + "GetHoldID for " + Alias_SonsMinorHold.GetLocation())
	SonsMinorHoldID = sCW.GetHoldID(Alias_SonsMinorHold.GetLocation())
; 	debug.trace(self + "GetHoldID for " + Alias_SonsMinorHold2.GetLocation())
	SonsMinorHold2ID = sCW.GetHoldID(Alias_SonsMinorHold2.GetLocation())

; 	debug.trace(self + "GetHoldID for " + Alias_ImperialMajorHold.GetLocation())
	ImperialMajorHoldID = sCW.GetHoldID(Alias_ImperialMajorHold.GetLocation())
; 	debug.trace(self + "GetHoldID for " + Alias_ImperialMinorHold.GetLocation())
	ImperialMinorHoldID = sCW.GetHoldID(Alias_ImperialMinorHold.GetLocation())
; 	debug.trace(self + "GetHoldID for " + Alias_ImperialMinorHold2.GetLocation())
	ImperialMinorHold2ID = sCW.GetHoldID(Alias_ImperialMinorHold2.GetLocation())
	
	; based on this, initialize negotationDelta variables
	; first, who owns Whiterun?
	;if sCW.OwnerWhiterun == 1
	; NOW - which side is the player on?
	if Game.GetPlayer().IsInFaction(CWSonsFaction) == 0
		; player not on Stormcloaks side ==> Ulfric demands Markarth
		; do the Sons of Skyrim control any major holds?
		if SonsMajorHoldID == -1
			IncrementNegotiationDelta(1)
			if SonsMinorHoldID == -1
				IncrementNegotiationDelta(1)
			endif
		endif
	else
		; player on Stormcloaks side ==> Tullius demands Riften
		; do the Imperials control any major holds?
		if ImperialMajorHoldID == -1
			IncrementNegotiationDelta(-1)
			if ImperialMinorHoldID == -1
				IncrementNegotiationDelta(-1)
			endif
		endif
	endif
	; remember starting delta
	StartingNegotiationDelta.value = NegotiationDelta
endFunction

Location Property ImperialTownRaided  Auto  Conditional
{last Imperial town raided
set by CW missions
}

Location Property SonsTownRaided  Auto  Conditional
{last Sons-owned town raided
set by CW missions
}

int Property ImperialMajorHoldID Auto Conditional
int Property ImperialMinorHoldID Auto Conditional
int Property ImperialMinorHold2ID Auto Conditional
int Property SonsMajorHoldID Auto Conditional
int Property SonsMinorHoldID Auto Conditional
int Property SonsMinorHold2ID Auto Conditional


Quest Property CW Auto

int Property NegotiationDelta = 0 Auto  Conditional
{Tracks the relative position of the negoations
+ : imperials favored
- : sons favored
}

GlobalVariable Property StartingNegotiationDelta Auto
{initial state of negotating position -- based on holds controlled}

; looping "demand concession" scenes
Scene Property CouncilScene5_S Auto
Scene Property CouncilScene5_I Auto

bool Property KickOutFlag = false Auto Conditional
{Set to true if you pissed off your faction enough to be kicked out}

; DEPRECATED
;int Property OwnerWhiterunFinal  Auto  Conditional
;{this is set by stage 140 -- who controls Whiterun 
;after the council?}

int Property  CityToSwitch Auto  Conditional
{this is set by stage 140 -- which city is switching sides? (whether it actually switches or not depends on if stage 141 is set)
	1 = Markarth
	2 = Riften
}


LocationAlias Property Alias_ImperialMajorHold  Auto  

LocationAlias Property Alias_ImperialMinorHold  Auto  

LocationAlias Property Alias_ImperialMinorHold2  Auto  

LocationAlias Property Alias_SonsMajorHold  Auto  

LocationAlias Property Alias_SonsMinorHold  Auto  

LocationAlias Property Alias_SonsMinorHold2  Auto  

ReferenceAlias Property Alias_PlayerChair  Auto  

int Property SideFavored  Auto  Conditional
{at end, which side was favored?
positive - Imperials
negative - Sons}

bool Property HideCWMiscObjectives  Auto  Conditional
{set to true during council to hide CW quest targets
to Ulfric and Tullius
}

FavorDialogueScript Property DialogueFavorGeneric  Auto  

Faction Property CWSonsFaction  Auto  

Bool Property bImperialCouncilBlocked  Auto  Conditional
{72813 - to allow conditions to check this due to delay of stage 20 getting set}

Bool Property bStormcloakCouncilBlocked  Auto  Conditional
{72813 - to allow conditions to check this due to delay of stage 30 getting set}

