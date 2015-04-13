Scriptname MQ101QuestScript extends Quest  conditional
{MQ101 main quest script}

Location Property Riverwood  Auto  

int Property FactionPath  Auto  Conditional
{Current faction side you're with (can change during MQ101)
1 = Imperial
2 = Stormcloak
}

; tower enemies
int stage280Count
int Property stage280Target = 2 auto

; storeroom enemies
int stage340Count
int Property stage340Target = 2 auto

; torture room enemies
int stage380Count
int Property stage380Target = 2 auto

; cage room enemies
int stage440Count
int Property stage440Target = 2 auto

; pool room enemies
int stage470Count
int Property stage470Target = 5 auto

; spiders
int stage630Count
int Property stage630Target = 5 auto

; title sequence
int TitleSequenceCount

; camera bob
Idle Property IdleWalkingCameraStart Auto
Idle Property IdleWalkingCameraEnd Auto

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

; 	debug.trace(self + ": animation event received=" + asEventName)

	if (akSource == Alduin.GetActorRef()) && (asEventName == "FlightLanding")
; 		debug.trace(self + "Alduin lands, Executioner raises axe")
		Headsman.GetActorRef().PlayIdle(NextClip)
		UnregisterForAnimationEvent(Alduin.GetActorRef(), "FlightLanding")
	EndIf

	if (akSource == Alduin.GetActorRef()) && (asEventName == "TowerLandImpact")
; 		debug.trace(self + "Alduin finishes landing, Executioner falls")
		Headsman.GetActorRef().PlayIdle(NextClip)
		UnregisterForAnimationEvent(Alduin.GetActorRef(), "TowerLandImpact")
	EndIf

	if (akSource== StormcloakPrisoner01.GetActorRef()) && (asEventName == "Decapitate")
; 		Debug.trace(self + "Prison decapitate event, play crowd reaction sounds")
		HelgenCrowdWallaMarker1.Disable()
		HelgenCrowdWallaMarker2.Enable()
		UnregisterForAnimationEvent(StormcloakPrisoner01.GetActorRef(), "Decapitate")
	EndIf

	if (akSource == Game.GetPlayer()) && (asEventName == "PlayImod")
; 		Debug.Trace(self + "Player Player IMOD for Alduin showing up")
		PlayerAlduinIMOD.Apply()
		CGDragonAttackBlurLong.Apply()
		SetStage(145)
		UnregisterForAnimationEvent(Game.GetPlayer(), "PlayImod")
	endIf

	if (akSource == Game.GetPlayer()) && (asEventName == "IdleFurnitureExit")
; 		Debug.Trace(self + "Player has gotten up from the stumble")
		SetStage(160)
		UnregisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
	endIf

EndEvent

Event OnUpdate()

	If TitleSequenceCount == 0
; 		debug.trace(self + "Playing Title Card 1")
		Game.StartTitleSequence("Sequence1")
		TitleSequenceCount = 1
		RegisterForSingleUpdate(5)
	ElseIf TitleSequenceCount == 1
; 		debug.trace(self + "Playing Title Card 2")
		Game.StartTitleSequence("Sequence2")
		TitleSequenceCount = 2
		RegisterForSingleUpdate(12)
	ElseIf TitleSequenceCount == 2
; 		debug.trace(self + "Playing Title Card 3")
		Game.StartTitleSequence("Sequence3")
		TitleSequenceCount = 3
		RegisterForSingleUpdate(5)
	ElseIf TitleSequenceCount == 3
; 		debug.trace(self + "Playing Title Card 4")
		Game.StartTitleSequence("Sequence4")
		TitleSequenceCount = 4
		RegisterForSingleUpdate(10)
	ElseIf TitleSequenceCount == 4
		Game.HideTitleSequenceMenu()
	EndIf

EndEvent

;call this function for the first person camera walk
Function CameraBobStart()
	Game.DisablePlayerControls(abLooking = True)
	Game.GetPlayer().PlayIdle(IdleWalkingCameraStart)
EndFunction

Function CameraBobStop()
	Game.GetPlayer().PlayIdle(IdleWalkingCameraEnd)
	Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = true, abSneaking = false, abmenu = false, abactivate = false, abjournaltabs = false)
EndFunction

; call this function for player execution block IMOD
Function PlayerImodAnimation()
	If RegisterForAnimationEvent(Game.GetPlayer(), "PlayImod")
; 		debug.trace(self + "Registered for PlayImod event")
	else
; 		debug.trace(self + "Failed to register for PlayImod event")
	EndIf
EndFunction

; call this function for player execution getUp event
Function PlayerFurnitureAnimation()
	If RegisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
; 		debug.trace(self + "Registered for IdleFurnitureExit event")
	Else
; 		debug.trace(self + "Failed to register for IdleFurnitureExit event")
	EndIf
EndFunction


; call this function to increment and set stage when count reaches target
function SetStageOnDeadCount(int stageToSet)
; 	debug.trace(self + "SetStageOnDeadCount " + stageToSet)
	if stageToSet == 280
		stage280Count += 1
		if stage280Count >= stage280Target
			setstage(280)
		endif
	elseif stageToSet == 340
		stage340Count += 1
		if stage340Count >= stage340Target
			setstage(340)
		endif
	elseif stageToSet == 380
		stage380Count += 1
		if stage380Count >= stage380Target
			setstage(380)
		endif
	elseif stageToSet == 440
		stage440Count += 1
		if stage440Count >= stage440Target
			setstage(440)
		endif
	elseif stageToSet == 470
		stage470Count += 1
		if stage470Count >= stage470Target
			setstage(470)
		endif
	elseif stageToSet == 630
		stage630Count += 1
		if stage630Count >= stage630Target
			setstage(630)
		endif
	endif

endFunction

; this function is to advance quest when the starting cells are loaded
int startingCellLoadCount = 0
int startingCellTotal = 2

function RegisterStartingCellLoad()
; 	debug.trace(self + "RegisterStartingCellLoad")
	startingCellLoadCount += 1
	if startingCellLoadCount >= startingCellTotal
		setStage(12)
	endif
endFunction

; *********************
; exiting cart
; *********************
function ExitCart(ReferenceAlias cartActorAlias, int seat = 0)
	Actor cartActor = cartActorAlias.GetActorRef()
; 	debug.trace("ExitCart: " + cartActor + ", seat=" + seat)
	; register for exit finish event
	cartActorAlias.RegisterForAnimationEvent(cartActor, "ExitCartEnd")
	; start exit anim
	if seat == 1
		cartActor.PlayIdle(IdleCartPassengerAExit)
	elseif seat == 2
		cartActor.PlayIdle(IdleCartPassengerBExit)
	elseif seat == 3
		cartActor.PlayIdle(IdleCartPassengerDExit)
	elseif seat == 4
		cartActor.PlayIdle(IdleCartPassengerCExit)
	elseif seat == 5
		cartActor.PlayIdle(IdleCartDriverExit)
	else
; 		debug.trace("ExitCart: INVALID SEAT " + seat)
	endif
endFunction

; actors call this function when they get the VehicleExit event
; this function sets a stage when all the actors have finished exiting
int stage45count
int stage46count
int stage52count
int stage56count
int stage60count
int stage64count

int Property stage45Total = 1 auto
int Property stage46Total = 1 auto
int Property stage52Total = 2 auto
int Property stage56Total = 2 auto
int Property stage60Total = 2 auto
int Property stage64Total = 2 auto

function IncrementExitCartCount(int stageToSet)
; 	debug.trace("IncrementExitCartCount: " + stageToSet)
	bool doSetStage = false
	if stageToSet == 45
		stage45count += 1
		if stage45count >= stage45Total 
			doSetStage = true
		endif
	elseif stageToSet == 46
		stage46count += 1
		if stage46count >= stage46Total 
			doSetStage = true
		endif
	elseif stageToSet == 52
		stage52count += 1
		if stage52count >= stage52Total 
			doSetStage = true
		endif
	elseif stageToSet == 56
		stage56count += 1
		if stage56count >= stage56Total 
			doSetStage = true
		endif
	elseif stageToSet == 60
		stage60count += 1
		if stage60count >= stage60Total 
			doSetStage = true
		endif
	elseif stageToSet == 64
		stage64count += 1
		if stage64count >= stage64Total 
			doSetStage = true
		endif
	endif
	if doSetStage
		setstage(stageToSet)
	endif
endFunction

;********************
; END exit cart section
;********************


; add racial spells to player
function AddRaceSpells()
	; remove all racial spells first, just in case
	Actor player = Game.GetPlayer()
	RemoveRaceSpells(player)

	; add race spells
	Race playerRace = player.GetActorBase().GetRace()
	if playerRace == ArgonianRace

	elseif playerRace == BretonRace
		player.AddSpell(ConjureFamiliar)

	elseif playerRace == DarkElfRace  
		player.AddSpell(Sparks)

	elseif playerRace == HighElfRace  
		player.AddSpell(Fury)

	elseif playerRace == ImperialRace  

	elseif playerRace == KhajiitRace  

	elseif playerRace == NordRace  

	elseif playerRace == OrcRace  

	elseif playerRace == RedguardRace  

	elseif playerRace == WoodElfRace  

	endif

endFunction

function RemoveRaceSpells(Actor pActor)
; 	debug.trace(self + " removing all race spells")
	pActor.RemoveSpell(ConjureFamiliar)
	pActor.RemoveSpell(Sparks)
	pActor.RemoveSpell(Fury)  
endFunction

Message Property KeepDoorMessage  Auto  
{message to prevent exit from keep}

Idle Property IdleCartDriverIdle  Auto  
{cart driver idle}

Idle Property IdleCartPassengerAIdle  Auto  

Idle Property IdleCartPassengerBIdle  Auto  

Idle Property IdleCartPassengerCIdle  Auto  

Idle Property IdleCartPassengerDIdle  Auto  

Idle Property IdleCartDriverExit  Auto  

Idle Property IdleCartPassengerAExit  Auto  

Idle Property IdleCartPassengerBExit  Auto  

Idle Property IdleCartPassengerCExit  Auto  

Idle Property IdleCartPassengerDExit  Auto  



int Property CartSoundInstanceID  Auto  
{instance ID of the cart sound (so I can stop it)
}

; starting race spells
Spell Property ConjureFamiliar  Auto  
Spell Property Sparks  Auto  
Spell Property Fury  Auto  

; player races
Race Property ArgonianRace  Auto  
Race Property BretonRace  Auto  
Race Property DarkElfRace  Auto  
Race Property HighElfRace  Auto  
Race Property ImperialRace  Auto  
Race Property KhajiitRace  Auto  
Race Property NordRace  Auto  
Race Property OrcRace  Auto  
Race Property RedguardRace  Auto  
Race Property WoodElfRace  Auto  


ImageSpaceModifier Property PlayerAlduinIMOD  Auto  

ImageSpaceModifier Property CGDragonAttackBlurLong  Auto  

ObjectReference Property HelgenCrowdWallaMarker1 Auto

ObjectReference Property HelgenCrowdWallaMarker2 Auto

ReferenceAlias Property StormcloakPrisoner01 Auto

ReferenceAlias Property Alduin Auto

ReferenceAlias Property Headsman Auto

Idle Property NextClip Auto