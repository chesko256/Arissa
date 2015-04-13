Scriptname CartDriverScript extends ObjectReference  
{script to attach and detach driver from cart
}

; ***** PROPERTIES **********

ObjectReference property myCart auto
{cart I'm assigned to}

ObjectReference property myHorse auto
{horse I'm assigned to}


Idle property IdleCartPlayerIdle auto
Idle property IdleCartPlayerExit auto
Idle property IdleCartDriverIdle auto
Idle property IdleCartDriverExit auto

int property startingLocation = 1 auto
{	set this for starting location:
	Whiterun = 1
	Solitude = 2
	Markarth = 3
	Riften = 4
	Windhelm = 5
}

; NOTE: Driver uses Variable01 to indicate his state:
; 	1 = waiting on cart
; 	2 = driving cart with player as passenger
; 	3 = waiting along the way for player to get back in

int property currentLocation = 1 auto

CarriageSystemScript Property DialogueCarriageSystem  Auto  

Topic Property ChatterTopic  Auto  


; ***** VARIABLES **********
Actor meAsActor

;**************************

event OnInit()
	meAsActor = (self as ObjectReference) as Actor
	; start with them the same
	currentLocation = startingLocation
endEvent


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; ;	debug.trace(self + " OnHit")

	; try just always stopping combat (so he can talk to the player)
	meAsActor.stopCombat()
endEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
; ;	debug.trace(self + " OnCombatStateChanged = " + aeCombatState)

	; try just always stopping combat (so he can talk to the player)
	meAsActor.stopCombat()
endEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.trace(self + ": animation event received=" + asEventName)
endEvent

Event OnDeath(Actor akKiller)
	AttachToCart(false)
endEvent


auto state normal
; state where I'm in loaded area and not doing something else
event OnCellLoad()
; 	debug.trace(self + " OnCellLoad() normal state")
	; enable cart
	if isEnabled() == 0
; 		debug.trace(self + "OnCellLoad() - disabled - do nothing")
		return
	endif
; 	debug.trace(self + "OnCellLoad() - enabled - proceed")

	; TODO - OnCellLoad and ResetLocation seem kind of redundant - ideally we have a single function called in all cases where the cart needs to be initialized/reset

	gotoState("busy")

	; set driver starting location
	meAsActor.SetActorValue("variable02", startingLocation)

	(myHorse as Actor).SetRestrained(false)

	; for now, take this out unless global is on
	myCart.SetMotionType(myCart.Motion_Dynamic)
	if TestCartOn.GetValue() == 1
		myCart.TetherToHorse(myHorse)
	endif
	; OLD WAS JUST THIS:
	utility.wait(0.5)
	AttachToCart(!meAsActor.IsDead())

	; try waiting for things to calm down
	utility.wait(3)
	; this seems unnecessary and is breaking things
;	(myHorse as Actor).SetRestrained(true)
	myCart.SetMotionType(myCart.Motion_Keyframed)

	gotoState("normal")
; 	debug.trace(self + "OnCellLoad() - DONE")
endEvent

event OnUnload()
	; two cases where we need to reset all the carts:
	; 1)  player was riding in cart and got out (driver's variable01 = 3)
	; 2) player rode cart to destination (driver's starting location != current location)

	; only reset if editor location - where we're going to reset - is not loaded
	if GetEditorLocation().IsLoaded() == 0
		; if I'm in waiting state (player was riding and got out), reset all carts
		if meAsActor.GetActorValue("variable01") == 3 || currentLocation != startingLocation
			DialogueCarriageSystem.ResetAllDrivers()
		endif
	endif
endEvent

endState


state busy
; I'm busy, either loading or resetting, don't need to respond to load/unload events
event OnCellLoad()
; 	debug.trace(self + " OnCellLoad() busy state - I won't do my normal setup if you see this. Probably means the script needs to be revised...")
endEvent
endState

function AttachToCart(bool bDoAttach)
; 	debug.trace(self + " AttachToCart = " + bDoAttach)
	if bDoAttach
		; attach me to my cart and make me the driver
		meAsActor.SetActorValue("variable01", 1)
		meAsActor.SetVehicle(myCart)
		meAsActor.PlayIdle(IdleCartDriverIdle)
	else
		; unattach me from cart
		meAsActor.SetVehicle(none)
		meAsActor.SetActorValue("variable01", 0)
		meAsActor.PlayIdle(IdleCartDriverExit)
	endif
endFunction



function RideInCart(int iDestination = -1, bool payForRide = false)
	; start riding in cart
	DialogueCarriageSystem.RideInCart(meAsActor, myhorse as Actor, myCart, iDestination, currentLocation, payForRide)
endFunction

function StopRiding(bool bPause = true, bool bFastTravel = false)
	; 	bPause - true if just stopping temporarily
	; 			- false if at destination

	; stop riding in cart
	DialogueCarriageSystem.StopRiding(meAsActor, myhorse as Actor, myCart, bPause, bFastTravel)
endFunction

function ResetLocation()
; put cart back to starting location and enable
	gotoState("busy")
	UnregisterForUpdate()
	Enable()
; 	debug.trace(self + " cart unloaded - moving back to starting location")
	; put driver back into normal state - ready to go for ride
	meAsActor.SetActorValue("variable01", 1)
	meAsActor.SetActorValue("variable02", startingLocation)
	; reset horse to starting location
	currentLocation = startingLocation
	(myHorse as Actor).SetActorValue("Variable01", startingLocation)

	; move everything to starting location
;	if Is3DLoaded() == 0
		myHorse.MoveToMyEditorLocation()
		myCart.MoveToMyEditorLocation()
		moveToMyEditorLocation()
;	endif

	if Is3DLoaded()
		meAsActor.PlayIdle(IdleCartDriverIdle)
	endif
	(myHorse as Actor).SetRestrained(false)

	gotoState("normal")

endFunction

event OnUpdate()
	; make sure I stay out of combat
;	measActor.StopCombat()
	; stupid failsafe
	if meAsActor && meAsActor.GetActorValue("variable01") > 0
		meAsActor.PlayIdle(IdleCartDriverIdle)
	endif
endEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akNewLoc && meAsActor.GetActorValue("variable01") == 2 && meAsActor.IsInDialogueWithPlayer() == 0
; 		debug.trace(self + "OnLocationChange akNewLoc=" + akNewLoc)
		meAsActor.Say(ChatterTopic)
	endif
endEvent


GlobalVariable Property TestCartOn  Auto  
