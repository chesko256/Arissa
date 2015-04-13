Scriptname CWFortGateTriggerScript extends ObjectReference  
{Starts CWFortStartOpenGateScene quest/scene.}

;### Properties to set on the base object CWGateTrigger
GlobalVariable Property DebugOn Auto
{BASEOBJECT Pointer to CWDebugOn Global.}

Quest Property CWFortOpenGate Auto
{BASEOBJECT Pointer to CWFortOpenGate quest.}

Keyword Property CWFortOpenGateStart  Auto
{BASEOBJECT Pointer to CWFortOpenGateStart keyword.}

Faction Property CWFortGateFaction Auto
{BASEOBJECT Pointer to CWFortGateFaction.}

;### Properties to set on the reference of each CWGateTrigger in the render window
ObjectReference Property myGateKeeper Auto
{REFERENCE pointer to Imperial or Sons Gatekeeper at location of this trigger reference}

Faction Property myFaction Auto
{REFERENCE pointer to CWImperialFaction or CWSonsFaction depending on which faction myGatekeeper belongs to}

ObjectReference Property myGate auto
{REFERENCE pointer to the CWFortGate at location of this trigger reference}

ObjectReference Property myLever Auto
{REFERENCE pointer to the CWFortLever at location of this trigger reference}



;### Properties set by ScriptName

ObjectReference Property ActionRefNPC Auto Hidden
ObjectReference Property ActionRefPlayer Auto Hidden



Event OnInit()

; 	debug.trace(self + "OnInit()")

	if !myGateKeeper || !myFaction || !myGate || !myLever
; 		debug.trace(self + "WARNING: not all of my properties have been set. Make sure all properties that need to be set on my reference, have been properly set.")
	EndIf

	RegisterForUpdate(5)
	
EndEvent

State GateShouldRemainOpen
	Event OnUpdate()
; ; 		debug.TraceConditional(self + "State 'GateShouldRemainOpen' OnUpdate().", DebugOn.value)

		if ActionRefNPC != None
			if (ActionRefNPC as actor).IsDead() == True
; ; 				debug.TraceConditional(self + "State 'GateShouldRemainOpen' OnUpdate() ActionRefNPC is dead, set to None.", DebugOn.value)
				ActionRefNPC = None
				
			EndIf
		EndIf
		
		if CWFortOpenGate.IsRunning()
; ; 			debug.TraceConditional(self + "State 'GateShouldRemainOpen' OnUpdate() CWFortOpenGate.IsRunning(), do nothing.", DebugOn.value)
		
		Elseif ActionRefNPC == None && ActionRefPlayer == None
; ; 			debug.TraceConditional(self + "State 'GateShouldRemainOpen' OnUpdate() ActionRefNPC == None && ActionRefPlayer == None, call CloseGate()", DebugOn.value)
			CloseGate()
			
		Else
; ; 			debug.TraceConditional(self + "State 'GateShouldRemainOpen' OnUpdate() calling OpenGate() to make sure it remains open.", DebugOn.value)
			OpenGate()
		
		EndIf	
		
	EndEvent
	
EndState


Event OnTriggerEnter(ObjectReference akActionRef)
; ; 	debug.TraceConditional(self + "OnTriggerEnter(" + akActionRef + ").", DebugOn.value)

	actor ActionRefActor = akActionRef as Actor
	
	if ActionRefActor == None
; ; 		debug.TraceConditional(self + "OnTriggerEnter() akActionRef is not an actor, so I am ignoring it.", DebugOn.value)
	
	Elseif ActionRefActor.IsDead()
; ; 		debug.TraceConditional(self + "OnTriggerEnter() akActionRef dead, so I am ignoring it.", DebugOn.value)
	
	ElseIf ActionRefActor.IsInFaction(myFaction) == False && ActionRefActor.IsInFaction(CWFortGateFaction) == False
; ; 		debug.TraceConditional(self + "OnTriggerEnter() akActionRef is not in myFaction nor CWFortGateFaction, so I am ignoring it.", DebugOn.value)
	
	ElseIf ActionRefActor == (Game.GetPlayer() as Actor)
; ; 		debug.TraceConditional(self + "OnTriggerEnter() akActionRef is the player, setting ActionRefPlayer to akActionRef and calling StartQuest()", DebugOn.value)
		ActionRefPlayer = akActionRef
		StartQuest(akActionRef)
		
	Else
; ; 		debug.TraceConditional(self + "OnTriggerEnter() akActionRef is not the player, setting ActionRefNPC to akActionRef and calling StartQuest()", DebugOn.value)
		ActionRefNPC = akActionRef
		StartQuest(akActionRef)

	EndIf

	
	

EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)

	if akActionRef == ActionRefPlayer
; ; 		debug.TraceConditional(self + "OnTriggerLeave() akActionRef is ActionRefPlayer, so set ActionRefPlayer to None.", DebugOn.value)
		ActionRefPlayer = None
		
	Elseif akActionRef == ActionRefNPC
; ; 		debug.TraceConditional(self + "OnTriggerLeave() akActionRef is ActionRefNPC, so set ActionRefNPC to None.", DebugOn.value)
		ActionRefNPC = None
	
	EndIf

EndEvent

Function StartQuest(ObjectReference akActionRef)
	if CWFortOpenGate.IsRunning()
; ; 		debug.TraceConditional(self + "StartQuest() CWFortOpenGate is already running, so ignore it.", DebugOn.value)
	
	ElseIf (akActionRef as actor).IsInCombat()
; ; 		debug.TraceConditional(self + "StartQuest() akActionRef is in combat, skip starting the quest, and call Open() on myGate directly.", DebugOn.value)
		openGate()
		
	ElseIf (myGateKeeper as actor).IsDead()
; ; 		debug.TraceConditional(self + "StartQuest() myGateKeeper is dead, skip starting the quest, and call Open() on myGate directly.", DebugOn.value)
		openGate()
	
	Else
; ; 		debug.TraceConditional(self + "StartQuest() Try to start CWFortOpenGate quest by calling CWFortOpenGateStart.SendStoryEvent(" + GetEditorLocation() + ", " + self + ", " + akActionRef + ")", DebugOn.value)
		CWFortOpenGateStart.SendStoryEvent(GetEditorLocation(), self, akActionRef)
	
	EndIf

EndFunction

Function OpenGate()
	GotoState("GateShouldRemainOpen")
; ; 	debug.TraceConditional(self + "OpenGate() going to State 'GateShouldRemainOpen' and calling Open() on myGate.", DebugOn.value)
	(myGate as CWFortGateScript).open()
EndFunction


Function CloseGate()
	GotoState("None")
; ; 	debug.TraceConditional(self + "OpenGate() going to State 'None' and calling Close() on myGate.", DebugOn.value)
	(myGate as CWFortGateScript).close()
EndFunction

