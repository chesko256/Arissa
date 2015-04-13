scriptName TrapPoisonGasCough extends ActiveMagicEffect
{used to make the player cough when they are poisoned
by gas and to throw detection events}
;===========================================================
float property fCoughTime = 5.0 auto
float property fCoughRand = 2.0 auto

float property afSmallMotorStrength = 0.2 auto
float property afBigMotorStrength = 0.2 auto
float property afDuration = 1.0 auto

actor myActor
sound property tempSound Auto
{temp sound till we can have the player "say" a line}
bool stateActive = false
float coughTime
topic property DialogueGenericPoisonCoughBranchTopic auto
bool myActorIsPlayer = false

auto State Waiting
	Event OnEffectStart(Actor akTarget, Actor akCaster)
		myActor = akTarget
		goToState("active")
	endEvent

endState

state active
	event onBeginState()
		stateActive = TRUE
		if myActor == game.getPlayer()
			myActorIsPlayer = True
		endif
		CoughLoop()
	endEvent
	
	event OnEffectFinish(Actor akTarget, Actor akCaster)
		stateActive = FALSE
		goToState("Waiting")
	endEvent
endState

function coughLoop()
	while stateActive
		utility.wait(randTimerFloat())
		DoCough()
	endWhile
endFunction

function DoCough()
	;game.getPlayer().say(cough)
	;tempSound.play(myActor)
	myActor.say(DialogueGenericPoisonCoughBranchTopic)
	if myActorIsPlayer
		myActor.createDetectionEvent(myActor, 30)
		game.ShakeController(afSmallMotorStrength, afBigMotorStrength, afDuration)
	endif
endFunction

float function randTimerFloat()
	float fReturn = fCoughTime + utility.RandomFloat((0-fCoughRand), fCoughRand)
	return fReturn
endFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
endEvent
	
event OnEffectFinish(Actor akTarget, Actor akCaster)
endEvent
