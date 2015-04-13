Scriptname MQ204HrothgarPushbackSCRIPT extends ObjectReference  
{script to handle blocking the player prior to acquisition of Clear Skies Shout}

import utility

projectile property voicelv01 auto		
{Projectile fired by syllable 1}
projectile property voicelv02 auto		
{syllable 2}
projectile property voicelv03 auto		
{syllable 3}
sound property windSFX auto
{SFX of wind gust pushing player back}
idle property LooseFullBodyStagger auto
{full body stagger for player}

objectReference property CollBox auto
{the collision box that actually blocks as our failsafe}

bool property bDebug = TRUE auto hidden

bool isWithin
int i = 0  			; recursion limiter
int max = 25
float force = 0.1	; push a little harder each time

auto STATE blocking
	;=====================================================
	EVENT onUpdate()
		if isWithin == FALSE || i >= max
			i = 0
			force = 0.1
			unRegisterForUpdate()
		elseif isWithin == TRUE
; 			debug.trace("stagger #"+(i+1)+" of force: "+force)
			windSFX.play(self)
			game.getPlayer().playIdle(LooseFullBodyStagger)			
			KnockAreaEffect(1.0, 1024)
			i+= 1
			force+= 0.1
			registerForSingleUpdate(0.5)
		endif
		
	endEVENT
	;=====================================================
	EVENT onTriggerLeave(objectReference actronaut)
		if actronaut == game.getPlayer()
; 			debug.trace("Player has left trigger")
			isWithin = FALSE
		endif
	
	endEVENT
	;=====================================================
	EVENT onTriggerEnter(objectReference actronaut)
		
		
		if collBox.isDisabled() == TRUE
			self.Disable()
			gotoState("clear")
		endif
	
; 		debug.trace("actronaut is: "+actronaut)
		;if actronaut == game.getPlayer()
; 			debug.trace("player has entered the trigger")
			isWithin == TRUE
		;endif

; 		debug.trace("DEBUG: Do the push'em")
		(actronaut as actor).playIdle(LooseFullBodyStagger)
		KnockAreaEffect(1, 1024)
		windSFX.play(self)
		
		registerForSingleUpdate(0.5)
		;float d1 = actronaut.getDistance(collBox)
		;wait(2.0)
				

		
		; while isWithin == TRUE && i < max
			; wait(2.0)
			; if isWithin == FALSE ; just a double check
				; i = max				; force loop to end
			; endif
; 			; debug.trace("stagger #"+(i+1)+" of force: "+force)
			; windSFX.play(self)
			; KnockAreaEffect(force, 1024)
			; force += 0.1
			; if force > 1.0
				; force = 1.0
			; endif
			; i+=1
		; endWhile
		
		; wait(2.0)
		;if the player is really persistent...
		
		; if isWithin == TRUE
			; while isWithin == TRUE && i < max
				; wait(2.0)
				; if isWithin == FALSE ; double check!
					; i = max
				; endif
				; collBox.pushActorAway((actronaut as actor),force)
				; windSFX.play(self)
				; force += 0.5
				; i+=1
			; endWhile
		; endif

	endEVENT

	EVENT onHit(ObjectReference akAggressor, Form akWeapon, Projectile projectileRef, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if bDebug
; 			debug.trace("DEBUG: OnHit() information")
; 			debug.trace("________________________________")
; 			debug.trace("Aggressor:"+akAggressor)
; 			debug.trace("Weapon:"+akWeapon)
; 			debug.trace("Projectile:"+projectileRef)
		endif
		if ProjectileRef && (ProjectileRef == voicelv01 || ProjectileRef == voicelv02 || ProjectileRef == voicelv03)
			if bDebug
; 				debug.trace("________________________________")
; 				debug.trace("DETECTED CORRECT PROJECTILE, DISABLING COLLISION")
			endif
			CollBox.disable()
			CollBox.delete()
			self.disable()
			self.delete()
			gotoState("clear")
		endif		
	endEVENT
	
endSTATE

STATE clear
	; nothing here.
endSTATE
