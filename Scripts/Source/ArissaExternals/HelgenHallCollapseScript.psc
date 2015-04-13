Scriptname HelgenHallCollapseScript extends ObjectReference  
{When triggered, play dragon roar from xmarker, controller shake, and play dustFX from xmarkers}

import debug
import utility

Sound property mySound01 auto
{the sound to play}

ObjectReference property mySoundOrigin01 auto
{the reference to play the sound from}

ObjectReference property myDustOrigin01 auto
{the reference to play the dust from}

ObjectReference property myDustOrigin02 auto
{the reference to play the dust from}

Explosion property myDustFX auto

float property fCameraShake01 auto
{camera shake intensity}

float property fCameraShake02 auto
{camera shake intensity}

float property fduration01 auto
{camera shake duration}

float property fduration02 auto
{camera shake duration}

float property fLIntensity01 auto
{shake left intensity}

float property fLIntensity02 auto
{shake left intensity}

float property fRIntensity01 auto
{shake right intensity}

float property fRIntensity02 auto
{shake right intensity}

objectReference property staggerOrigin auto
{where should the stagger originate from}

ObjectReference property ImpFortHallCollapseFX01 auto
{the reference of the hall collapse effect}

ReferenceAlias Property HallwayStormcloak01 Auto
ReferenceAlias Property HallwayStormcloak02 Auto
ReferenceAlias Property HallwayStormcloak03 Auto

;************************************

auto State waiting
	Event onTriggerEnter (ObjectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.getPlayer())
			TriggerCollapse()
		endif
	endEvent
endState

;************************************

State done
	;do nothing
endState

;************************************

function TriggerCollapse()
	;also want to stagger player
	gotoState("done")
	ImpFortHallCollapseFX01.playanimation("PlayAnim02")
	mySound01.play(mySoundOrigin01)
	staggerOrigin.knockAreaEffect(1,2048)
	game.shakeCamera(NONE, fCameraShake01)
	game.shakeController(fLIntensity01, fRIntensity01, fduration01)
	wait(4)
	myDustOrigin01.placeatme(myDustFX)
	wait(2)
	game.shakeCamera(NONE, fCameraShake02)
	game.shakeController(fLIntensity02, fRIntensity02, fduration02)
	myDustOrigin02.placeatme(myDustFX)
	
	;disable hallway victims
	HallwayStormcloak01.TrytoDisable()
	HallwayStormcloak02.TrytoDisable()
	HallwayStormcloak03.TrytoDisable()	
endFunction