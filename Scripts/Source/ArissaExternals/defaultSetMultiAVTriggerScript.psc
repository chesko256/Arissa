ScriptName defaultSetMultiAVTriggerScript extends ObjectReference
{Sets the specified actor value on the actor(s) to the specified value when the player enters the trigger.}

import game
import debug

ObjectReference property Actor1 Auto
ObjectReference property Actor2 Auto
ObjectReference property Actor3 Auto
ObjectReference property Actor4 Auto
ObjectReference property Actor5 Auto

String property ActorValueName Auto
int property ActorValueValue Auto
bool property onlyOnce = True Auto
bool property evalPackageAfterwards = True Auto
bool property onlyPlayer = True Auto


auto State Waiting
	Event onTriggerEnter(ObjectReference obj)
		if (!onlyPlayer || obj == GetPlayer())
			if (Actor1 != None)
				(Actor1 as Actor).SetAV(ActorValueName, ActorValueValue)
			EndIf
			if (Actor2 != None)
				(Actor2 as Actor).SetAV(ActorValueName, ActorValueValue)
			EndIf
			if (Actor3 != None)
				(Actor3 as Actor).SetAV(ActorValueName, ActorValueValue)
			EndIf
			if (Actor4 != None)
				(Actor4 as Actor).SetAV(ActorValueName, ActorValueValue)
			EndIf
			if (Actor5 != None)
				(Actor5 as Actor).SetAV(ActorValueName, ActorValueValue)
			EndIf
			
			if (evalPackageAfterwards)
				if (Actor1 != None)
					(Actor1 as Actor).EvaluatePackage()
				EndIf
				if (Actor2 != None)
					(Actor2 as Actor).EvaluatePackage()
				EndIf
				if (Actor3 != None)
					(Actor3 as Actor).EvaluatePackage()
				EndIf
				if (Actor4 != None)
					(Actor4 as Actor).EvaluatePackage()
				EndIf
				if (Actor5 != None)
					(Actor5 as Actor).EvaluatePackage()
				EndIf
			EndIf
			
			if (onlyOnce)
				GoToState("AllDone")
			EndIf
		EndIf
	EndEvent
EndState

State AllDone
	Event OnTriggerEnter(ObjectReference obj)
		;Do nothing.
	EndEvent
EndState