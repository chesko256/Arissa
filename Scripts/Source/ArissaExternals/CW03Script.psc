Scriptname CW03Script extends Quest  Conditional

CWSCript Property CWs Auto

Scene Property CW03Scene  Auto  
Scene Property CW03SiegeScene Auto	
Scene Property CW03ToWarScene Auto

Scene Property MQ104OutroScene Auto 

Actor Property CWFieldCOSonsWhiterunCamp Auto

ReferenceAlias Property MessageAlias Auto
ReferenceAlias Property AxeUlfrics Auto
ReferenceAlias Property AxeBalgruufs Auto
ReferenceAlias Property AxeHrongars Auto
ReferenceAlias Property MessageFromTullius Auto

Weapon Property SteelWarAxe Auto
MiscObject Property CWDocumentsImperial Auto

ActorBase Property BalgruufTheGreater Auto 

ObjectReference function CreateAndGiveMessageToPlayer(Form ThingToCreate, ReferenceAlias AliasToForceIntoThatHasName)
	ObjectReference MessageRef
	ObjectReference PlayerRef = Game.GetPlayer()

	MessageRef = PlayerRef.PlaceAtMe(ThingToCreate)
	MessageAlias.ForceRefTo(MessageRef)
	AliasToForceIntoThatHasName.ForceRefTo(MessageRef)
	PlayerRef.AddItem(MessageRef)


EndFunction

function GivePlayerMessageToWhiterun()

	ObjectReference MessageRef
	ObjectReference PlayerRef = Game.GetPlayer()
	
	if CWs.PlayerAllegiance == CWs.iImperials
		CreateAndGiveMessageToPlayer(CWDocumentsImperial, MessageFromTullius)
	
	elseif CWs.PlayerAllegiance == CWs.iSons
		CreateAndGiveMessageToPlayer(SteelWarAxe, AxeUlfrics)
	
	Else
; 		CWScript.Log("CW03Script", " WARNING: GiveInitialMessageToPlayer() expected CWs.PlayerAllegiance to be 1 or 2, instead got " + CWs.PlayerAllegiance)
		
	EndIf
	
EndFunction

function JarlTakesMessage()
	ObjectReference MessageRef = MessageAlias.GetReference()
	
	Game.GetPlayer().RemoveItem(MessageRef)
		
EndFunction

Function GivePlayerMessageToUlfric()

	if CWs.PlayerAllegiance == CWs.iImperials
	
		if BalgruufTheGreater.GetDeadCount() == 0
			CreateAndGiveMessageToPlayer(SteelWarAxe, AxeBalgruufs)
		Else
			CreateAndGiveMessageToPlayer(SteelWarAxe, AxeHrongars)		
		EndIf
	
	elseif CWs.PlayerAllegiance == CWs.iSons
	
		CreateAndGiveMessageToPlayer(SteelWarAxe, AxeUlfrics)
	
	Else
; 		CWScript.Log("CW03Script", " WARNING: GiveInitialMessageToPlayer() expected CWs.PlayerAllegiance to be 1 or 2, instead got " + CWs.PlayerAllegiance)
		
	EndIf
	

EndFunction

function StartWhiterunAttack()
	CWs.CreateMissions(CWs.GetMyCurrentHoldLocation(CWFieldCOSonsWhiterunCamp), CWFieldCOSonsWhiterunCamp, ForceFinalSiege = true)
EndFunction

