Scriptname WorldInteractionsScript extends Quest Hidden 
{Parent script for each World Interaction Quest script}

WIFunctionsScript Property WIs Auto
{Pointer to WIFunctionsSCript attached to WI quest}

GlobalVariable Property pGameDaysPassed  Auto
{Holds global GameDaysPassed}

GlobalVariable Property pWIWaitEvent  Auto
{The global variable holding the number of days this type of event should wait before allowing it to recur.}

GlobalVariable Property pWINextEvent  Auto
{The global variable holding the day this type of event will be allowed to recur.}

Keyword Property WICrowdStart Auto
{set this if you need to use the generic WICrowd quest}

Quest Property WICrowd Auto
{set this if you need to use the generic WICrowd quest}

GlobalVariable Property SceneVarGlobal Auto
{if you need a tracking variable for scenes, use this}

WICourierScript Property WICourierS Auto
{Pointer to WICourierScript attached to WICourier quest}

bool StopQuestOnPlayerLocationChange 

Function SetNextEventGlobals()
	{sets global variables used as conditions in the story manager to restrict how often world interactions for each event type are allowed to start.}
	;set WINextAddItem to GameDaysPassed + WIWaitAddItem 
	pWINextEvent.value = (pGameDaysPassed.value + pWIWaitEvent.value)
EndFunction

function startWICrowd(ObjectReference RefToWatch1, ObjectReference RefToWatch2 = None)
	{Starts the WICrowd quest by sending a story event}
	
	if RefToWatch2 == None
		RefToWatch2 = RefToWatch1	;if not set, just make it the same as RefToWatch1
	EndIf

; 	debug.trace(self + "starting WICrowd by calling WICrowdStart.SendStoryEvent(akRef 1 =" + RefToWatch1 + ", akRef2 =" + RefToWatch2 + ")")
	WICrowdStart.SendStoryEvent(akRef1 = RefToWatch1, akRef2 = RefToWatch2)

EndFunction

function stopWICrowd()
; 	debug.trace(self + "stoping WICrowd quest by calling WICrowd.stop()")
	WICrowd.stop()

EndFunction

function setSceneVarGlobal(int NumberToSetSceneVarGlobalTo)
; 	debug.trace(self + "setSceneVarGlobal(" + NumberToSetSceneVarGlobalTo + ") will set global " + SceneVarGlobal)
	SceneVarGlobal.setValue(NumberToSetSceneVarGlobalTo)
	
EndFunction

int function getSceneVarGlobal()
; 	debug.trace(self + "getSceneVarGlobal() will get value in global " + SceneVarGlobal)
	return SceneVarGlobal.getValue() as Int
	
EndFunction
