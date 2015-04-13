scriptname barredDoor extends objectReference
{script which must be on any barred door}
;======================================================================================;
;	PROPERTIES  /
;=============/
bool property barred = true auto hidden
{is this door barred?  Controlled by linked DoorBar object. Default:true}
bool property busy = false auto hidden
{bool that tracks whether the BOLT is moving}
message property BarredMSG auto
{set the "door is barred from the other side" message here"}
message property UnlockMeMSG auto
{set the "must raise deadbolt" message here"}
sound property barredSFX auto
{set the "ker-clunk" sfx for a door that cannot open here}

; need to communicate with my bar's script
doorBar barScript
objectReference myLink

EVENT onCellLoad()
	myLink = getLinkedRef()
	barScript  = myLink as doorBar
endEVENT

EVENT onActivate(objectReference actronaut)
; 	;debug.trace("bolt state is: " + barScript.getState() + "(" + barScript + ")")
	if busy == TRUE
		; do nothing if the bolt is in motion
	else
		if barred == true && actronaut == game.getPlayer()
			if actronaut.getDistance(self) < actronaut.getDistance(myLink)
				; I cannot be opened from this side! 
				barredMSG.show()
			else
				; player is closer to bar than the door, so must be on the "right" side
				UnlockMeMSG.show()
			endif
			; either way, play a nice ker-chunk sound to feedback why door isn't opening
			barredSFX.play(self)
			; add a tiny rumble bump for good measure
			game.shakeController(0.1, 0.1, 0.1)
		else
			; do a redundant check here
			if getOpenState() == 3 || busy == TRUE
; 				;debug.trace("Something is wrong, do nothing" + self)
				return
			else
; 				;debug.trace("open " + self) 
				; not barred, so allow normal activation.
			endif
		endif
	endif
endEVENT
	