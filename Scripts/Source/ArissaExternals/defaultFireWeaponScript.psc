Scriptname defaultFireWeaponScript extends ObjectReference  
{Script for firing projectiles from FireWeaponMarker
-The default setting is to fire whatever weapon/ammo you choose infintely, every 4-6 seconds, if the marker is enabled
-If you just want it to fire once then set MinWaitTime to 0.0, MaxWaitTime to 0.1, and TimesFired to 1}

import utility
import weapon
import debug


;---------------------------
;--Hidden Properties
;---------------------------
int Property TimesFired Auto Hidden
{How many times i've already fired}

bool Property Looping auto hidden
{If true I should keep firing}

float Property WaitTimer Auto hidden
{Rand wait time generated based on the Min and Max wait times}


;---------------------------
;--Editable Properties
;---------------------------
int Property TimesToFire = -1 Auto
{Maximum number of times you want this to fire once it's enabled. (-1 = until disabled)}

float Property MaxWaitTime = 6.0 auto
{Maximum wait between refire, Default = 6.0}

float Property MinWaitTime = 4.0 auto
{Minimum wait between refire, Default = 4.0}

weapon Property WeaponType Auto
{Type of weapon you want to fire, (ie. "HuntingBow")}

ammo Property Ammotype Auto
{Type of ammo you would like to fire, (ie. "IronArrow")}

quest Property myQuest Auto
{Quest you want to check the stage of}

int Property StageToStartFire = -1 Auto
{Stage of myQuest you want to start firing at}

int Property StageToStopFire = -1 Auto
{Stage of myQuest you want to stop firing at (-1 = until disabled)}



Event OnLoad()
	; I'm loaded, or have been enabled, so start the fire loop
	Looping = TRUE
	GoToState("FireLoop")
endEVENT

Event OnUnload()
	; I've been unloaded, or disabled.  Stop firing
	Looping = FALSE
	GoToState("Waiting")
endEVENT


auto state Waiting
	; The state I hang out in while I'm waiting for something to happen.
endstate


state FireLoop
	EVENT OnBeginState()

		While(Looping)
			;trace(self + "I'm looping...")
			; Set up what our next wait time will be before firing
			waitTimer = randomFloat(MinWaitTime, MaxWaitTime)	

			wait(waitTimer)
			
			if (myQuest)
				; There is a quest set, lets see if it's running
				if (myQuest.IsRunning())
					; There is a quest running, lets see if we should be firing
					if (myQuest.GetStage() >= StageToStopFire)
						;trace(self + " The done stage has been hit.  No longer going to fire.  Also dropping out of loop")
						; The quest is at the stop firing stage, so don't fire
						Looping = False
					elseif (myQuest.GetStage() >= StageToStartFire)
						;trace(self + " The correct stage is set, I'm going to fire.")
						; The quest isn't at the stop firing stage yet, but is at the firing stage, so see if we are enabled
							if (self as ObjectReference).IsEnabled()
								; We're enabled, start firing
								;trace(self + " is firing.")
								WeaponType.fire( self as objectReference, Ammotype)	;I'm enabled so fire.
								TimesFired += 1
							else
								; We're not enabled, so don't fire
							endif
							if (TimesToFire != -1)
								; There is a fire limit set, check to see if we've reached it
								;trace(self + "  has a firing limit of " + TimesToFire + " and has fired " + TimesFired + " so far.")
								if (TimesFired == TimesToFire)
									; We've reached our fire limit, stop firing
									;trace(self + " has reached it's firing limit of " + TimesToFire + ".  Stopping fire and while loop.")
									Looping = False
								endif
							endif
					else
						;trace(self + " Has a quest but the start/stop stages aren't set yet.")
					endif	
				else
					; The quest isn't running, wait for a bit then check again
					wait(8)
				endif
				
			else
				; There's no quest set so I'm just going to continue without worrying about quests/stages
				if (self as ObjectReference).IsEnabled()
					; I'm enabled, so I'm going to fire
					WeaponType.fire( self as objectReference, Ammotype)
					TimesFired += 1
				else
					; I'm not enabled, so I'm going to stop firing
					Looping = False
				endif
				if (TimesToFire != -1)
					; I have a firing limit set, lets see if I've reached it
					if (TimesFired == TimesToFire)
						; I've reached my limit, stop firing
						Looping = False
					endif
				endif
			endif
			
		endWhile
		
		; I'm no longer in the fireloop, time to wait
	goToState("Waiting")
	endEvent
endstate
		
