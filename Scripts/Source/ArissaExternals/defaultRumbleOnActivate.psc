scriptname defaultRumbleOnActivate extends objectreference
{Quick script that shakes camera and/or controller on activation.  Customizable via properties}
;======================================================;

import game	; import game script for access to shake functions
import utility ; import utility for access to wait()

float property cameraIntensity = 0.25 auto
{How hard to shake camera, range:0-1}
float property shakeLeft = 0.25 auto
{How hard to shake left motor, range:0-1}
float property shakeRight = 0.25 auto
{How hard to shake right motor, range:0-1}
float property duration = 0.25 auto
{how long to shake controller}
bool property repeatable = true auto
{by default, this happens per activation}

;======================================================;

auto STATE active
	EVENT onActivate(objectReference actronaut)
		shakeCamera(NONE, cameraIntensity)
		shakeController(shakeLeft,shakeRight,duration)
		gotoState("busy")
		wait(duration)
		if repeatable == true
			gotoSTATE("active")
		else
			gotoState("inactive")
		endif
	endEVENT
endSTATE
;======================================================;
STATE busy
	EVENT onActivate(objectReference actronaut)
		; don't do anything until previous shake is over with
	endEVENT
endSTATE
;======================================================;
STATE inactive
	; empty state.  Script is dead now.
endSTATE
;======================================================;