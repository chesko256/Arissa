scriptName SpiderWebAnimationsSCRIPT extends ObjectReference

{
- This script randomly synchs two animations, one for the web and one for the actor in the web.
- The animations begin once the player enters the trigger and continue until either the player
leaves the trigger or is told to stop from somewhere else
}

import debug
import utility

bool inTrigger
bool doOnce

bool property stopCondition auto hidden

objectReference property myWeb auto
{The web} 

ObjectReference property webActor auto
{The actor in the web}

Idle property idleWebThrashShort auto
{This is the idle for the actor to thrash.}

Idle property idleWebThrashShort2 auto
{This is a second idle for the actor to thrash.}

EffectShader Property WebbedFXS auto

;*****************************************

Function playWebAnimations(int iRand)
	;notification("Rand = " + iRand)
	Actor myActor = webActor as Actor
	if(iRand == 1 && !stopCondition)
		myActor.playIdle( idleWebThrashShort );
	else
		if(iRand == 2 && !stopCondition)
		    myActor.playIdle( idleWebThrashShort2 )
		endif
	endif
	
	wait(5)
	
endFunction

;*****************************************

Auto STATE Begin
	Event onTriggerEnter (objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.GetPlayer())
			inTrigger = true
			if(stopCondition)
				gotoState("done")
				webActor.RemoveDependentAnimatedObjectReference(myWeb)
			else
				RegisterForSingleUpdate(0.5)
			endif
		endif
	endEvent
	
	Event onTriggerLeave (objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.GetPlayer())
			inTrigger = false
		endif
	endEvent
endState

;************************************

Event onUpdate()
	bool beginAnimations = true
	;UnRegisterForUpdate()
	while(inTrigger && !stopCondition)
		;stopCondition is set to true by the WebDestructibleScript on the webFX reference
		int rand = RandomInt(1,2)
		Actor myActor = webActor as Actor
		myActor.setav("Variable03", rand)
		playWebAnimations(rand)
		wait(5)
	endWhile
endEvent

;*****************************************

STATE done
	;do nothing
endState

;*****************************************

Event onLoad()
	if(!doOnce)
		WebbedFXS.Play(webActor)
		webActor.AddDependentAnimatedObjectReference( myWeb )
		doOnce = true
	endif
endEvent

;*****************************************