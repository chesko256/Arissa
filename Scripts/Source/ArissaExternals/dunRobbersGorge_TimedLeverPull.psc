ScriptName dunRobbersGorge_TimedLeverPull extends objectReference

Quest property triggerQuest Auto
int property stage Auto
ObjectReference currentLever
ObjectReference currentGuard

ObjectReference PulledLever01
ObjectReference PulledLever02
ObjectReference PulledLever03
ObjectReference PulledLever04
ObjectReference PulledLever05

Event onTriggerEnter(objectReference triggerRef)
	if ((triggerRef As Actor) != None && triggerRef != Game.GetPlayer())
		currentGuard = triggerRef
		attemptLeverPull()
	EndIf
EndEvent

Function setLever(ObjectReference obj)
	if (obj != None && obj != PulledLever01 && obj != PulledLever02 && obj != PulledLever03 && obj != PulledLever04 && obj != PulledLever05)
		currentLever = obj
		attemptLeverPull()
	EndIf
EndFunction

Function attemptLeverPull()
	if ((triggerQuest == None || triggerQuest.GetStage() >= stage) && currentGuard != None && !(currentGuard As Actor).IsDead() && currentGuard.GetDistance(Self) < 256)
; 		;Debug.Trace("Should now pull: " + currentLever)
		 currentLever.Activate(Game.GetPlayer())
		 AddToPulledList(currentLever)
	EndIf
EndFunction

Function addToPulledList(ObjectReference obj)
	if (PulledLever01 == None)
		PulledLever01 = obj
	ElseIf (PulledLever02 == None)
		PulledLever02 = obj
	ElseIf (PulledLever03 == None)
		PulledLever03 = obj
	ElseIf (PulledLever04 == None)
		PulledLever04 = obj
	ElseIf (PulledLever05 == None)
		PulledLever05 = obj
	EndIf
EndFunction