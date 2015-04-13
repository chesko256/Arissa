scriptname TG04LockedDoor extends objectReference
{script which must be on any barred door}
;======================================================================================;
;	PROPERTIES  /
;=============/
bool property barred = true auto hidden
{is this door barred?  Controlled by linked DoorBar object. Default:true}
bool property Accessible = false auto hidden
{bool that tracks whether the BOLT is moving}
message property BarredMSG auto
{set the "door is barred from the other side" message here"}
message property UnlockMeMSG auto
{set the "must raise deadbolt" message here"}
sound property barredSFX auto
{set the "ker-clunk" sfx for a door that cannot open here}

actor property GulumEi auto

; need to communicate with my bar's script
doorBar barScript
objectReference myLink

EVENT onLoad()
	myLink = getLinkedRef()
	barScript  = myLink as doorBar
endEVENT

EVENT onActivate(objectReference activateRef)
; 	;debug.trace(self + " has been activated by " + activateRef)
	if Accessible == TRUE
; 		;debug.Trace(self + " should open because accessible == " + Accessible)
	else
; 		;debug.Trace(self + " should not open because accessible == " + Accessible)
		;If GulumEi activates this door then unlock and set to be accessible by the player
		if (activateRef as actor) == GulumEi
; 			;debug.Trace(self + " has been activated by Gulum Ei and should be unlocked")
			self.lock(False)
			self.SetLockLevel(0)
			Accessible = TRUE
		elseIf activateRef == game.GetPlayer()
; 			;debug.Trace(self + " has been activated by the player but the door is inaccessible")
			barredMSG.show()
			barredSFX.play(self)
			game.shakeController(0.1, 0.1, 0.1)
		Else
			;Do Nothing
		endif
	endif
endEVENT
