Scriptname MQCallDragonScript extends Quest  

function CallDragon(Actor dragon, ObjectReference marker1, ObjectReference marker2)
; 	debug.trace(self + "CallDragon: dragon=" + dragon + ", marker1=" + marker1 + ", marker2=" + marker2)
	; call Odahviing, but only if he's not loaded
	if !dragon.IsNearPlayer()
; 		debug.trace(self + " dragon NOT near player, move to nearby marker...")
		; move to the closest summon marker (try this for now)
		if marker1 == None && marker2 == None || ( marker1 == None && marker2.IsInInterior() ) || (marker2 == None && marker1.IsInInterior() )
			; can't do anything -- no nearby marker or found interior markers (bad data)
			SetStage(200)
		else
			if marker1 == None
; 				debug.trace(self + " moveto marker 2 = " + marker2)
				dragon.moveTo(marker2)
			elseif marker2 == None
; 				debug.trace(self + " moveto marker 1 = " + marker1)
				dragon.moveTo(marker1)
			else
				; move to closest
				if Game.GetPlayer().GetDistance(marker1) < Game.GetPlayer().GetDistance(marker2)
; 					debug.trace(self + " moveto marker 1 = " + marker1)
					dragon.moveto(marker1)
				else
; 					debug.trace(self + " moveto marker 2 = " + marker2)
					dragon.moveto(marker2)
				endif
			endif
			; temp?
			dragon.Enable()
		endif
	else
; 		debug.trace(self + " dragon near player, setstage 200")
		SetStage(200)
	endif

endFunction