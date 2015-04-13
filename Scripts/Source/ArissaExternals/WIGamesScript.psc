Scriptname WIGamesScript extends Quest

ReferenceAlias Property PlayerA Auto
ReferenceAlias Property PlayerB Auto
ReferenceAlias Property PlayerC Auto
ReferenceAlias Property PlayerD Auto
ReferenceAlias Property PlayerE Auto

ReferenceAlias Property PlayerIsIt Auto		;alias to the tag player who is it

int Property NumPlayers Auto conditional Hidden

int property IsPlayerInvolved auto	Conditional hidden	;is the player involved?

int Property ObjectivePlayerIt = 20 auto hidden			;number of the objective to display if the player is it (as in Game.GetPlayer() is it)
int Property ObjectivePlayerNotIt	= 10 auto hidden	;number of objective to display if the player is not it

int Property defaultTimeToRunGame = 90 auto hidden	;if the event that starts the quest doesn't come in with a Value1 use this as the number of seconds to run before stopping

scene Property SceneToPlayAfterTagged = none Auto
{optional: if set, this scene will play after a player get's tagged - used for HideAndSeek, NOT tag}

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
	
; 	debug.trace("WIGamesScript: OnStoryScript() Keyword=" + akKeyword + ", Location=" + akLocation +", Ref1 =" +akRef1 + ", Ref2 =" + akRef2 + ", Value1 =" + aiValue1 + ", Value2 = " + aiValue2)
	
	if aiValue1 != 0
; 		debug.trace("WIGamesScript: OnStoryScript() RegisterForSingleUpdate() for #sec = Value1: " + aiValue1)
		RegisterForSingleUpdate(aiValue1)
	Else
		;default time to run
; 		debug.trace("WIGamesScript: OnStoryScript() No Value1, so we are RegisterForSingleUpdate() for default #sec = " + defaultTimeToRunGame)
		RegisterForSingleUpdate(defaultTimeToRunGame) 
	EndIf
 
 
 
 EndEvent

event onUpdate()
; 	debug.trace("WIGamesScript: onUpdate() calling Stop()")
	stop()

EndEvent

function setNumPlayers()
	NumPlayers = 0
	
	If PlayerA.GetReference()
		NumPlayers +=1
	EndIf

	If PlayerB.GetReference()
		NumPlayers +=1
	EndIf
	
	If PlayerC.GetReference()
		NumPlayers +=1
	EndIf
	
	If PlayerD.GetReference()
		NumPlayers +=1
	EndIf
	
	If PlayerE.GetReference()
		NumPlayers +=1
	EndIf
	
EndFunction

function setIsPlayerInvolved()

	IsPlayerInvolved = 0

	ObjectReference PlayerARef = PlayerA.GetReference()
	ObjectReference PlayerBRef = PlayerB.GetReference()
	ObjectReference PlayerCRef = PlayerC.GetReference()
	ObjectReference PlayerDRef = PlayerD.GetReference()
	ObjectReference PlayerERef = PlayerE.GetReference()
	
	ObjectReference PlayerRef = Game.GetPlayer()
	
	if PlayerRef == PlayerARef || PlayerRef == PlayerBRef || PlayerRef == PlayerCRef || PlayerRef == PlayerDRef || PlayerRef == PlayerERef
		IsPlayerInvolved = 1
	EndIf

EndFunction

function Tag(Actor WhoTagged, Actor WhoGotTagged, form CallingForm)

; 	debug.trace("WIGamesScript: Tag() WhoTagged =" + WhoTagged + ", WhoGotTagged =" + WhoGotTagged + "CallingForm =" + CallingForm)
	;debug.messageBox("WIGamesTagScript: Tag() WhoGotTagged = " + WhoGotTagged)
	
	if WhoGotTagged == none
;		debug.messagebox	("WIGamesTagScript: Tag() WhoGotTagged == None, this will break the game of tag.")
		
; 		debug.trace("WIGamesScript: Tag() WhoGotTagged == None! Forcing pervious player to be it.", 2)
		
		WhoGotTagged = WhoTagged
		
	endif
	
	
	PlayerIsIt.ForceRefTo(WhoGotTagged)
	
	;because we call Tag() functionin startup stage, this won't work until after the quest is running - the scene starts on quest start
	if IsRunning() == true
		if SceneToPlayAfterTagged != None
			SceneToPlayAfterTagged.start()
		EndIf
	endif
	
	
	PlayerA.TryToEvaluatePackage()
	PlayerB.TryToEvaluatePackage()
	PlayerC.TryToEvaluatePackage()
	PlayerD.TryToEvaluatePackage()
	PlayerE.TryToEvaluatePackage()
	
	if IsPlayerInvolved
		if WhoGotTagged == Game.GetPlayer() as Actor
			SetObjectiveDisplayed(ObjectivePlayerNotIt, false)
			setObjectiveCompleted(ObjectivePlayerIt, false)
			SetObjectiveDisplayed(ObjectivePlayerIt, true, true)
			
		Else
			setObjectiveCompleted(ObjectivePlayerIt, true)
			SetObjectiveDisplayed(ObjectivePlayerNotIt, true, true)
			
		EndIf
	
	EndIf
	
EndFunction
