Scriptname HelgenRandomSoundScript extends ObjectReference  
{While the player is in trigger, pick from locations to play these sounds}

import debug
import utility

Sound property mySound01 auto
{the sound to play}

Sound property mySound02 auto
{the sound to play}

ObjectReference property mySoundOrigin01 auto
{the reference to play the sound from}

ObjectReference property mySoundOrigin02 auto
{the reference to play the sound from}

ObjectReference property mySoundOrigin03 auto
{the reference to play the sound from}

float property fCameraShake01 auto
{camera shake intensity for close roar}

float property fCameraShake02 auto
{camera shake intensity for distant roar}

float property fduration01 auto
{camera shake duration for close roar}

float property fduration02 auto
{camera shake duration for distant roar}

float property fLIntensity01 auto
{shake left intensity for close roar}

float property fLIntensity02 auto
{shake left intensity for distant roar}

float property fRIntensity01 auto
{shake right intensity for close roar}

float property fRIntensity02 auto
{shake right intensity for distant roar}

int property maxTimer = 30 auto
{default - 30, max timer for how long to wait between sounds}

int property minTimer = 20 auto
{default - 20, min timer for how long to wait between sounds}

bool inTrigger = false
bool busy = false
int iInTrigger = 0

;************************************

auto State playSound
	Event onTriggerEnter (ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.getPlayer())
			;inTrigger = true
			iInTrigger += 1
			RegisterForSingleUpdate(0.5)
		endif
	endEvent
	
	Event onTriggerLeave (ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.getPlayer())
			;inTrigger = false
			iInTrigger -= 1
		endif
	endEvent
endState

;************************************

Event onUpdate()
	;while(inTrigger && !busy)
	while((iInTrigger > 0) && !busy)
		busy = true
		int myTimer = RandomInt(minTimer, maxTimer)
		int myOrigin = RandomInt(1,3)
		
		; // PHILS CHANGE //
		;int mySound = RandomInt(1,2)
		int mySound = 2
		; // PHILS CHANGE //
		
		if(myOrigin == 1)
			if(mySound == 1)
				mySound01.play(mySoundOrigin01)
				game.shakeCamera(NONE, fCameraShake01)
				game.shakeController(fLIntensity01, fRIntensity01, fduration01)
			elseif (mySound == 2)
				mySound02.play(mySoundOrigin01)
				game.shakeCamera(NONE, fCameraShake02)
				game.shakeController(fLIntensity02, fRIntensity02, fduration02)
			endif
		elseif(myOrigin == 2)
			if(mySound == 1)
				mySound01.play(mySoundOrigin02)
				game.shakeCamera(NONE, fCameraShake01)
				game.shakeController(fLIntensity01, fRIntensity01, fduration01)
			elseif (mySound == 2)
				mySound02.play(mySoundOrigin02)
				game.shakeCamera(NONE, fCameraShake02)
				game.shakeController(fLIntensity02, fRIntensity02, fduration02)
			endif
		elseif(myOrigin == 3)
			if(mySound == 1)
				mySound01.play(mySoundOrigin03)
				game.shakeCamera(NONE, fCameraShake01)
				game.shakeController(fLIntensity01, fRIntensity01, fduration01)
			elseif (mySound == 2)
				mySound02.play(mySoundOrigin03)
				game.shakeCamera(NONE, fCameraShake02)
				game.shakeController(fLIntensity02, fRIntensity02, fduration02)
			endif
		endif
				
		wait(mytimer as float)
		busy = false
	endWhile

endEvent

;************************************
