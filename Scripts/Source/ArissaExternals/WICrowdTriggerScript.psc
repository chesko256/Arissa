Scriptname WICrowdTriggerScript extends ReferenceAlias  
{Used to put actors walking through trigger into aliases, usually to create crowds}

;These are aliases in your quest that represent the Specators you want the trigger box to fill when actors start/walk into it.
ReferenceAlias Property Spectator1 Auto
ReferenceAlias Property Spectator2 Auto
ReferenceAlias Property Spectator3 Auto
ReferenceAlias Property Spectator4 Auto
ReferenceAlias Property Spectator5 Auto
ReferenceAlias Property Spectator6 Auto
ReferenceAlias Property Spectator7 Auto
ReferenceAlias Property Spectator8 Auto
ReferenceAlias Property Spectator9 Auto
ReferenceAlias Property Spectator10 Auto
ReferenceAlias Property Spectator11 Auto
ReferenceAlias Property Spectator12 Auto
ReferenceAlias Property Spectator13 Auto
ReferenceAlias Property Spectator14 Auto
ReferenceAlias Property Spectator15 Auto
ReferenceAlias Property Spectator16 Auto
ReferenceAlias Property Spectator17 Auto
ReferenceAlias Property Spectator18 Auto
ReferenceAlias Property Spectator19 Auto
ReferenceAlias Property Spectator20 Auto

int nextSpectator	;0 = Spectator1, 1 = Spectator2, etc.

Faction Property FactionSpectator Auto
{Faction you should put anyone you don't want to be a spectator, AND add this faction via the spectator Aliases in your quest so that the trigger box doesn't try to add the same actor more than once if he walks in and out of the triggerbox}

ReferenceAlias Property AliasToCenterTriggerOn Auto Hidden

keyword Property ActorTypeNPC Auto
{You need to hook this property up to the ActorTuypeNPC keyword, or non-NPCs will become spectators}


Event OnTriggerEnter(ObjectReference akActionRef)
	Actor ActorRef = akActionRef as Actor
	
	if !ActorRef || !ActorRef.HasKeyword(ActorTypeNPC)
; 		debug.trace(self + "OnTriggerEnter() akActionRef is NOT an NPC, aborting: " + akActionRef)
		return

	ElseIf ActorRef == Game.GetPlayer()
; 		debug.trace(self + "OnTriggerEnter() akActionRef is the Player, aborting: " + akActionRef)
		return
		
		
	Elseif FactionSpectator && ActorRef.IsInFaction(FactionSpectator)
; 		debug.trace(self + "OnTriggerEnter() akActionRef[" + akActionRef + "] is in FactionSpectator[" + FactionSpectator + "], aborting.")	
		return
	
	Else
; 		debug.trace(self + "OnTriggerEnter() calling AddActorToSpectatorAlias()")
		AddActorToSpectatorAlias(ActorRef)
		
	EndIf
	

EndEvent

Event OnUpdate()
; 	debug.trace(self + "OnUpdate()")
		
	if AliasToCenterTriggerOn.GetReference()
		UpdateTriggerPosition()
	EndIf
	
	
EndEvent

function RegisterForUpdateTriggerPosition(ReferenceAlias AliasToMoveTriggerTo, int UpdateEveryHowManySeconds)
	AliasToCenterTriggerOn = AliasToMoveTriggerTo
	RegisterForUpdate(UpdateEveryHowManySeconds)
EndFunction

function UpdateTriggerPosition()
	objectReference selfRef = getReference()
	ObjectReference moveToRef = AliasToCenterTriggerOn.GetReference()

; 	debug.trace(self + "UpdateTriggerPosition() moving " + selfRef + " to " + moveToRef)
	selfRef.Disable()
	selfRef.moveTo(moveToRef)
	selfRef.Enable()
	
EndFunction

function UnregisterForTriggerPositionUpdate()
	UnRegisterForUpdate()
EndFunction

function AddActorToSpectatorAlias(Actor ActorRef)
	
	ReferenceAlias AliasToFill
	
	if NextSpectator == 0
		AliasToFill = Spectator1
	ElseIf NextSpectator == 1
		AliasToFill = Spectator2
	ElseIf NextSpectator == 2
		AliasToFill = Spectator3
	ElseIf NextSpectator == 3
		AliasToFill = Spectator4
	ElseIf NextSpectator == 4
		AliasToFill = Spectator5
	ElseIf NextSpectator == 5
		AliasToFill = Spectator6
	ElseIf NextSpectator == 6
		AliasToFill = Spectator7
	ElseIf NextSpectator == 7
		AliasToFill = Spectator8
	ElseIf NextSpectator == 8
		AliasToFill = Spectator9
	ElseIf !NextSpectator == 9
		AliasToFill = Spectator10
	ElseIf NextSpectator == 10
		AliasToFill = Spectator11
	ElseIf NextSpectator == 11
		AliasToFill = Spectator12
	ElseIf NextSpectator == 12
		AliasToFill = Spectator13
	ElseIf NextSpectator == 13
		AliasToFill = Spectator14
	ElseIf NextSpectator == 14
		AliasToFill = Spectator15
	ElseIf NextSpectator == 15
		AliasToFill = Spectator16
	ElseIf NextSpectator == 16
		AliasToFill = Spectator17
	ElseIf NextSpectator == 17
		AliasToFill = Spectator18
	ElseIf NextSpectator == 18
		AliasToFill = Spectator19
	ElseIf NextSpectator == 19
		AliasToFill = Spectator20
		
	EndIf

	NextSpectator += 1
	AliasToFill.ForceRefTo(ActorRef)
	
; 	debug.trace(self + "AddActorToSpectatorAlias() forced Alias[" + AliasToFill + "] to actor:" + ActorRef)

	
	
EndFunction



Function RegisterSpectatorAliases(ReferenceAlias Alias1, ReferenceAlias Alias2 = None, ReferenceAlias Alias3 = None, ReferenceAlias Alias4 = None, ReferenceAlias Alias5 = None, \
ReferenceAlias Alias6 = None, ReferenceAlias Alias7 = None, ReferenceAlias Alias8 = None, ReferenceAlias Alias9 = None, ReferenceAlias Alias10 = None, \
ReferenceAlias Alias11 = None, ReferenceAlias Alias12 = None, ReferenceAlias Alias13 = None, ReferenceAlias Alias14 = None, ReferenceAlias Alias15 = None, \
ReferenceAlias Alias16 = None, ReferenceAlias Alias17 = None, ReferenceAlias Alias18 = None, ReferenceAlias Alias19 = None, ReferenceAlias Alias20 = None)
{Pass in Aliases that should be filled with passerbys who enter the trigger}

	ClearSpectatorAliases()
	RegisterSpecatorAlias(Alias1)
	RegisterSpecatorAlias(Alias2)
	RegisterSpecatorAlias(Alias3)
	RegisterSpecatorAlias(Alias4)
	RegisterSpecatorAlias(Alias5)
	RegisterSpecatorAlias(Alias6)
	RegisterSpecatorAlias(Alias7)
	RegisterSpecatorAlias(Alias8)
	RegisterSpecatorAlias(Alias9)
	RegisterSpecatorAlias(Alias10)
	RegisterSpecatorAlias(Alias11)
	RegisterSpecatorAlias(Alias12)
	RegisterSpecatorAlias(Alias13)
	RegisterSpecatorAlias(Alias14)
	RegisterSpecatorAlias(Alias15)
	RegisterSpecatorAlias(Alias16)
	RegisterSpecatorAlias(Alias17)
	RegisterSpecatorAlias(Alias18)
	RegisterSpecatorAlias(Alias19)
	RegisterSpecatorAlias(Alias20)
	
EndFunction

Function RegisterSpecatorAlias(ReferenceAlias AliasToRegister)
	if !AliasToRegister
		Return
	
	EndIf
	
; 	debug.trace(self + "RegisterSpecatorAlias() Registering AliasToRegister:" + AliasToRegister)
	
	if !Spectator1
		Spectator1 = AliasToRegister
	
	Elseif !Spectator2
		Spectator2 = AliasToRegister
	
	Elseif !Spectator3
		Spectator3 = AliasToRegister
	
	Elseif !Spectator4
		Spectator4 = AliasToRegister
	
	Elseif !Spectator5
		Spectator5 = AliasToRegister
	
	Elseif !Spectator6
		Spectator6 = AliasToRegister
	
	Elseif !Spectator7
		Spectator7 = AliasToRegister
	
	Elseif !Spectator8
		Spectator8 = AliasToRegister
	
	Elseif !Spectator9
		Spectator9 = AliasToRegister
	
	Elseif !Spectator10
		Spectator10 = AliasToRegister
	
	Elseif !Spectator11
		Spectator11 = AliasToRegister
	
	Elseif !Spectator12
		Spectator12 = AliasToRegister
	
	Elseif !Spectator13
		Spectator13 = AliasToRegister
	
	Elseif !Spectator14
		Spectator14 = AliasToRegister
	
	Elseif !Spectator15
		Spectator15 = AliasToRegister
	
	Elseif !Spectator16
		Spectator16 = AliasToRegister
	
	Elseif !Spectator17
		Spectator17 = AliasToRegister
	
	Elseif !Spectator18
		Spectator18 = AliasToRegister
	
	Elseif !Spectator19
		Spectator19 = AliasToRegister
	
	Elseif !Spectator20
		Spectator20 = AliasToRegister	
	EndIf

EndFunction

Function ClearSpectatorAliases()

	NextSpectator = 0

	Spectator1 = None
	Spectator2 = None
	Spectator3 = None
	Spectator4 = None
	Spectator5 = None
	Spectator6 = None
	Spectator7 = None
	Spectator8 = None
	Spectator9 = None
	Spectator10 = None
	Spectator11 = None
	Spectator12 = None
	Spectator13 = None
	Spectator14 = None
	Spectator15 = None
	Spectator16 = None
	Spectator17 = None
	Spectator18 = None
	Spectator19 = None
	Spectator20 = None

EndFunction
