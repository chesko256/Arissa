Scriptname CarriageSystemScript extends Quest  Conditional

import game

; remove gold and travel
function Travel(int iDestination = -1, Actor pDriver)
; 	debug.trace(self + " Travel to " + iDestination)
	currentDestination = iDestination
	currentDriver = pDriver

	; try two ways for testing:
	if bWaitForPlayerToSit 
		; just start watching for player to sit
		PlayerRider.ForceRefTo(pDriver.GetLinkedRef(LinkCarriageSeat))
		currentDriver.SetActorValue("variable01", 3) ; to allow "waiting" chatter
		; if player is sitting already, let's go
		ObjectReference sitMarker = pDriver.GetLinkedRef(LinkCarriageSeat)
		; we can only check if furniture is in use, not who's sitting in it
		if sitMarker.IsFurnitureInUse()
			PlayerRider.Clear()
			PlayerIsSitting()
		endif
	else
		if currentDestination >= 1 && currentDestination <= 5
			GetPlayer().RemoveItem(Gold, CarriageCost.value as int)
		else
			GetPlayer().RemoveItem(Gold, CarriageCostSmall.value as int)
		endif

		; get player to sit in marker
		ObjectReference sitMarker = pDriver.GetLinkedRef(LinkCarriageSeat)
		sitMarker.Activate(Game.GetPlayer())
		RegisterForSingleUpdate(1)
	endif
endFunction

function ClearWaitingState()
; 	debug.trace(self + "ClearWaitingState(): currentDriver=" + currentDriver)
	currentDriver.SetActorValue("variable01", 0)
	currentDriver = None
	currentDestination = -1
	PlayerRider.Clear()
endFunction

function PlayerIsSitting()
; 	debug.trace(self + " PlayerIsSitting")
	actor player = Game.GetPlayer()

	; if driver is dead, clear and return
	if currentDriver.IsDead()
		ClearWaitingState()
		return
	endif

	; no riding while in combat (because you can't actually sit)
	if player.IsInCombat()
		return
	endif

	; no riding while encumbered (fast travel will fail)
	if player.GetActorValue("InventoryWeight") > player.getActorValue("CarryWeight")
; 		debug.trace(self + " player is encumbered - do nothing")
		return
	endif

	Game.DisablePlayerControls()
	CarriageDriverScript driverScript = (currentDriver as ObjectReference) as CarriageDriverScript
	if driverScript && driverScript.bSitting
		currentDriver.PlayIdle(IdleCartDriverIdle)
	endif
	if currentDestination >= 1 && currentDestination <= 5
		player.RemoveItem(Gold, CarriageCost.value as int)
	else
		player.RemoveItem(Gold, CarriageCostSmall.value as int)
	endif

;	Game.FadeOutGame(true, true, 0.5, 8)
	currentDriver.SetActorValue("variable01", 2) ; to allow chatter
	currentDriver.Say(DialogueCarriageChatterTopic)
	currentDriver.SetActorValue("variable01", 0) ; turn it back off
	utility.wait(2)
	FadeToBlackImod.Apply()
	utility.wait(2)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	utility.wait(2)
	SkipToDestinationSimple()
endFunction

event OnUpdate()
	; player has asked to travel, single update to prevent function call from blocking
	currentDriver.SetActorValue("variable01", 2) ; to allow chatter
	currentDriver.Say(DialogueCarriageChatterTopic)
	utility.wait(6)
	currentDriver.SetActorValue("variable01", 0) ; turn it back off
	SkipToDestinationSimple()
endEvent

function SkipToDestinationSimple()
; 	debug.trace(self + "SkipToDestinationSimple START: travel to " + currentDestination)

	; fast travel to current destination
	if currentDestination == 1
		FastTravel(Whiterun)
	elseif currentDestination == 2
		FastTravel(Solitude)
	elseif currentDestination == 3
		FastTravel(Markarth)
	elseif currentDestination == 4
		FastTravel(Riften)
	elseif currentDestination == 5
		FastTravel(Windhelm)
	elseif currentDestination == 6
		FastTravel(Morthal)
	elseif currentDestination == 7
		FastTravel(Dawnstar)
	elseif currentDestination == 8
		FastTravel(Falkreath)
	elseif currentDestination == 9
		FastTravel(Winterhold)
	else
; 		debug.trace(self + "SkipToDestinationSimple: FAILED - bad destination")
	endif
	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	FadeToBlackHoldImod.Remove()
;	Game.FadeOutGame(False, true, 1, 2)
	ClearWaitingState()
	EnablePlayerControls()
; 	debug.trace(self + "SkipToDestination DONE")
endFunction


Keyword Property LinkCarriageSeat Auto

GlobalVariable Property CarriageCost Auto
GlobalVariable Property CarriageCostSmall Auto

bool Property bWaitForPlayerToSit = true Auto Conditional

MiscObject Property Gold  Auto  

Topic Property DialogueCarriageChatterTopic Auto

Actor property currentDriver auto		; save current driver for update loop


ObjectReference Property Solitude  Auto  

ObjectReference Property Rorikstead  Auto  

ObjectReference Property GraniteHill  Auto  

ObjectReference Property DragonBridge  Auto  

ObjectReference Property Winterhold  Auto  

ObjectReference Property Whiterun  Auto  

ObjectReference Property Windhelm  Auto  

ObjectReference Property Dawnstar  Auto  

ObjectReference Property Falkreath  Auto  

ObjectReference Property Morthal  Auto  

ObjectReference Property Markarth  Auto  

ObjectReference Property Riften  Auto  

ObjectReference Property Karthwasten  Auto  

ObjectReference Property Stonehills  Auto  

ObjectReference Property OldHroldan  Auto  

ObjectReference Property Riverwood  Auto  

ObjectReference Property Ivarstead  Auto  

ObjectReference Property Heljarchen  Auto  

ObjectReference Property DarkwaterCrossing  Auto  

ObjectReference Property ShorsStone  Auto  

ObjectReference Property Kynesgrove  Auto  


; ***********************
; REAL CART STUFF
;************************
import ObjectReference

int property currentDestination auto conditional
{ where is the player currently traveling?
	Not traveling = 0
	Whiterun = 1
	Solitude = 2
	Markarth = 3
	Riften = 4
	Windhelm = 5
	Morthal = 6
	Dawnstar = 7
	Falkreath = 8
	Winterhold = 9
}

Idle property IdleCartPlayerIdle auto
Idle property IdleCartPlayerExit auto
Idle property IdleCartDriverIdle auto
Idle property IdleCartDriverExit auto
Idle property IdleCartPassenger1Idle auto
Idle property IdleCartPassenger1Exit auto
Idle property IdleCartPassenger2Idle auto
Idle property IdleCartPassenger2Exit auto
Idle property IdleCartPassenger3Idle auto
Idle property IdleCartPassenger3Exit auto

ReferenceAlias Property Follower  Auto  

; keep track if anyone is riding with the player
ReferenceAlias Property CartRider1  Auto  
ReferenceAlias Property CartRider2  Auto  
ReferenceAlias Property CartRider3  Auto  

GlobalVariable property WEEnabled auto
{ turn off wilderness encounters while riding }

Idle Property OffsetStop  Auto  

bool bWaitingToFastTravel = false			; if true, player will fast travel after exit cart event is received

float fSittingAngleLimitRadians = 2.6180		; angle player is allowed to look while seated in cart (150 degrees)

function RideInCart(Actor myDriver, Actor myHorse, ObjectReference myCart, int iDestination = -1, int iStartingLocation = 1, bool payForRide = false)
; 		debug.trace(self + " RideInCart START")
		; start riding in cart
		Game.ForceFirstPerson()
		Game.SetInChargen(true, true, true)	; disable saving and waiting
		Game.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = false, abSneaking = true, abMenu = true, abActivate = false, abJournalTabs = false)
		Game.ForceFirstPerson()

		; change camera sitting angle limit
		SittingAngleLimit.SetValue(fSittingAngleLimitRadians)
		; cull first person geomerty during cart ride
		ShowFirstPersonGeometry(false)

		if payForRide
			GetPlayer().RemoveItem(Gold, CarriageCost.value as int)
		endif

		; disable all other carts when the player is riding in one of them
		DisableAllOtherDrivers(myDriver)
		; don't let CW script enable/disable carts while riding
		CarriageAllowCWDisable.SetValue(0)

		CartRiderPlayer.ForceRefTo(game.GetPlayer())

		; if no destination, we'll just keep current destination
		if iDestination > 0
			currentDestination = iDestination
		endif
		myDriver.SetActorValue("variable01", 2)
		WEEnabled.SetValue(0)
		myDriver.RegisterForUpdate(1.0)
		myHorse.SetRestrained(true)
		myDriver.PlayIdle(IdleCartDriverIdle)
		Game.GetPlayer().SetVehicle(myCart)
		Game.GetPlayer().PlayIdle(IdleCartPlayerIdle)

		; TEST - add follower to cart!
		; this isn't working - causes cart to flip out - take out for now
;		actor myFollower =  Follower.GetActorRef()
;		if myFollower && myFollower.GetActorValue("WaitingForPlayer") == 0
;			AddPassenger(myFollower, myCart, 1)
;		endif

		; TEST - try setting keyframed (should already be that) to fix save/load issue
		myCart.SetMotionType(myCart.Motion_Keyframed)
		; end test

		utility.wait(2)
		myCart.SetMotionType(myCart.Motion_Dynamic)
		myHorse.SetActorValue("Variable01", currentDestination + 10*iStartingLocation)
		myhorse.SetRestrained(false)
		myhorse.evaluatepackage()
		mydriver.EvaluatePackage()
; 		debug.trace(self + " RideInCart DONE")
endFunction

function StopRiding(Actor myDriver, Actor myHorse, ObjectReference myCart, bool bPause = true, bool bFastTravel = false)
; 	bPause - true if just stopping temporarily
; 			- false if at destination
; 	bFastTravel - true to fast travel directly to destination
; 	debug.trace(self + "StopRiding START")

		; stop riding in cart
		myDriver.UnRegisterForUpdate()
		myhorse.SetRestrained(true)
		myDriver.PlayIdle(IdleCartDriverIdle)

		; announce arrival
		if !bPause && !bFastTravel
			myDriver.Say(ArrivalTopic)
		endif

		; Passengers not working for the moment
;		RemovePassengers()

		CartRiderPlayer.RegisterForAnimationEvent(Game.GetPlayer(), "ExitCartEnd")

		Game.DisablePlayerControls(abLooking = true)
		; reset camera sitting angle limit
		SittingAngleLimit.SetValue(0)

		; set this so we'll fast travel once exit event is received
		bWaitingToFastTravel = bFastTravel
		if bFastTravel
			; quick exit
			if TestCartQuickExit.GetValue() == 0
				; just fade game out until we're done
;				Game.FadeOutGame(true, true, 0, 6)
				Game.GetPlayer().PlayIdle(IdleCartPlayerExit)
			endif
		else
			Game.GetPlayer().PlayIdle(IdleCartPlayerExit)
			utility.wait(3)
			myCart.SetMotionType(myCart.Motion_Keyframed)
		endif

		; MOVED this to NotifyOnCartExit - put back if needed as failsafe, maybe with longer timer
;		Game.EnablePlayerControls()

		WEEnabled.SetValue(1)

		; let CW script enable/disable carts again
		CarriageAllowCWDisable.SetValue(1)

		if bPause
			myDriver.SetActorValue("variable01", 3)
		elseif bFastTravel
			; reset current destination? This should be taken care of by driver's OnUnload script
			if TestCartQuickExit.GetValue() == 1
				Game.GetPlayer().PlayIdle(IdleCartExitInstant)
			endif
		else
			; reset "home" to be here
			((myDriver as ObjectReference) as CartDriverScript).currentLocation = currentDestination
			myDriver.SetActorValue("variable01", 1)
			myHorse.SetActorValue("Variable01", currentDestination)
		endif

; 	debug.trace(self + "StopRiding DONE")
endFunction

function SkipToDestination()
; 	debug.trace(self + "SkipToDestination START")

	; fast travel to current destination
	Game.FadeOutGame(true, true, 0.5, 3)
	; reset all carts
	ResetAllDrivers()

	if currentDestination == 1
		FastTravel(Whiterun)
	elseif currentDestination == 2
		FastTravel(Solitude)
	elseif currentDestination == 3
		FastTravel(Markarth)
	elseif currentDestination == 4
		FastTravel(Riften)
	elseif currentDestination == 5
		FastTravel(Windhelm)
	elseif currentDestination == 6
		FastTravel(Morthal)
	elseif currentDestination == 7
		FastTravel(Dawnstar)
	elseif currentDestination == 8
		FastTravel(Falkreath)
	elseif currentDestination == 9
		FastTravel(Winterhold)
	endif
	Game.FadeOutGame(False, true, 1, 2)
; 	debug.trace(self + "SkipToDestination DONE")
endFunction

function AddPassenger(Actor myPassenger, ObjectReference myCart, int iSeat = 1)
; iSeat = 1, 2, or 3
	; since we only have 1 alias, just use that for now - should be function with iSeat as param
	if iSeat == 1
		CartRider1.ForceRefTo(myPassenger)
	elseif iSeat == 2
		CartRider2.ForceRefTo(myPassenger)
	elseif iSeat == 3
		CartRider3.ForceRefTo(myPassenger)
	endif
	myPassenger.EvaluatePackage()
	; try moving near cart to make them not knock over the cart
	myPassenger.MoveTo(myCart, afYOffset = 400.0)
	utility.wait(0.5)
	myPassenger.SetVehicle(myCart)
	myPassenger.PlayIdle(GetCartIdle(iSeat))
endFunction

function RemovePassengers()
	RemovePassenger(CartRider1, 1)
	RemovePassenger(CartRider2, 2)
	RemovePassenger(CartRider3, 3)
endFunction

bool function RemovePassenger(ReferenceAlias myAlias, int iSeat)
	; returns true if a passenger was removed
	actor myPassenger = myAlias.GetActorRef()
	if myPassenger
		; reset sitting idle just in case
		myAlias.RegisterForAnimationEvent(myPassenger, "ExitCartEnd")
		myPassenger.PlayIdle(GetCartIdle(iSeat))
		myPassenger.PlayIdle(GetCartIdle(iSeat, true))
		return true
	endif
endFunction


; call this function from actor script when finished exiting cart
function NotifyOnCartExit(ReferenceAlias myAlias)
; 	debug.trace(self + "NotifyOnCartExit " + myAlias)
	Actor myActor = myAlias.GetActorRef()
	; TEMP? to clear bound hands anim - not needed if we get alternate idle/exit
	myActor.PlayIdle(OffsetStop)
	if myActor == game.GetPlayer()
		actor player = game.GetPlayer()
		; try this to get 1st person geometry back:
		ShowFirstPersonGeometry(true)
		Game.SetInChargen(false, false, false)	; reenable saving and waiting
		Game.EnablePlayerControls()
		; if waiting to fast travel, do it
		if bWaitingToFastTravel
			bWaitingToFastTravel = false
			SkipToDestination()
		endif

	endif
	; clear the alias
	myAlias.Clear()
endFunction

Idle function GetCartIdle(int iSeat, bool bExit = false)
	if bExit
		if iSeat == 1
			return IdleCartPassenger1Exit
		elseif iSeat == 2
			return IdleCartPassenger2Exit
		elseif iSeat == 3
			return IdleCartPassenger3Exit
		endif
	else
		if iSeat == 1
			return IdleCartPassenger1Idle
		elseif iSeat == 2
			return IdleCartPassenger2Idle
		elseif iSeat == 3
			return IdleCartPassenger3Idle
		endif
	endif
endFunction

;**************************
; utility functions
;**************************
function DisableAllOtherDrivers(ObjectReference myDriver)
	if WhiterunDriver.GetRef() != myDriver
		WhiterunDriver.TryToDisable()
	endif
	if SolitudeDriver.GetRef() != myDriver
		SolitudeDriver.TryToDisable()
	endif
	if MarkarthDriver.GetRef() != myDriver
		MarkarthDriver.TryToDisable()
	endif
	if RiftenDriver.GetRef() != myDriver
		RiftenDriver.TryToDisable()
	endif
	if WindhelmDriver.GetRef() != myDriver
		WindhelmDriver.TryToDisable()
	endif
endFunction

function ResetAllDrivers()
; 	debug.trace(self + " ResetAllDrivers() BEGIN")
	ResetDriver(WhiterunDriver)
	ResetDriver(SolitudeDriver)
	ResetDriver(MarkarthDriver)
	ResetDriver(RiftenDriver)
	ResetDriver(WindhelmDriver)
; 	debug.trace(self + " ResetAllDrivers() END")
endFunction

function ResetDriver(ReferenceAlias driverAlias)
	ObjectReference driverRef = driverAlias.GetRef()
	(driverRef as CartDriverScript).ResetLocation()
endFunction

ReferenceAlias Property CartRiderPlayer  Auto  

Topic Property ArrivalTopic  Auto  

ReferenceAlias Property WhiterunDriver Auto
ReferenceAlias Property SolitudeDriver Auto
ReferenceAlias Property MarkarthDriver Auto
ReferenceAlias Property RiftenDriver Auto
ReferenceAlias Property WindhelmDriver Auto



GlobalVariable Property CarriageAllowCWDisable  Auto  
{set this to 0 when riding - prevents CW scripts from enabling/disabling carts}

GlobalVariable Property SittingAngleLimit  Auto  
{global to change the angle you can look while seated}

Idle Property ExitCartBegin  Auto  

Idle Property ExitCartEnd  Auto  

Idle Property IdleCartExitInstant  Auto  

GlobalVariable Property TestCartQuickExit  Auto  

ReferenceAlias Property PlayerRider  Auto  

ImageSpaceModifier Property FadeToBlackImod  Auto  

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  

ImageSpaceModifier Property FadeToBlackBackImod  Auto  
