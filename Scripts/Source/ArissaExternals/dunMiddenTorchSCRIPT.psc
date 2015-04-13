scriptName dunMiddenTorchSCRIPT extends objectReference
{Configurable Custom Script.  Be default: when triggered, it will cast the spell from a linked ref at the triggering actor}

float property delayBetween auto
{seconds to wait between shots.  Only relevant if doOnce == false}
;light property myLight auto
;{light to cast}
;projectile property myFX auto
;{light FX object to place}

auto STATE active
	EVENT onTriggerEnter(ObjectReference actronaut)
		if actronaut == game.getPlayer()
			;gotoState("inactive")
			getLinkedRef().enable(true)
			;utility.wait(delayBetween)
			;gotostate("active")
		endif	
	endEVENT
	
	EVENT onTriggerLeave(objectReference actronaut)
		if actronaut == game.getPlayer()
			getLinkedRef().disable(true)
		endif
	endEVENT
endSTATE

STATE inactive
	; nothing happens here.
endSTATE

		; objectReference myFXref
		; myFXref = getLinkedRef().placeatme(myFX)
		; myFXref.setScale(0.1)
		;;send to inert state
		; gotoState ("inactive")
		; int i = 0
		; while myFXref.getScale() < 1.0 
			;;store the current scale for later
			; float fScale = myFXref.getscale()
; 			; debug.trace(self + "fScale = " + fscale)
			; i += 1
			; if i > 1000
				;;too many loops. Force full scale and kill the script
; 				; debug.traceStack(self + "looped too many times, killing it.  Scale was: " + fScale, 0)
				; myFXref.disable(true)
				; myFXref.delete()
				; gotoState("active")
				; return
			; endif
			; float newScale = (fScale + 0.01)
			; myFXref.setScale(newScale)
		; endwhile
		;;begin the delay wait after we've reached full scale
		; utility.wait(delayBetween)
		; gotoState("active")
	; endif
	; endEVENT