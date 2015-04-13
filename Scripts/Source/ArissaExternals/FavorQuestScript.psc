scriptName FavorQuestScript extends quest conditional

ReferenceAlias property QuestGiver auto
{Set this to be the QuestGiver Alias for this favor.}

GlobalVariable Property GameDaysPassed auto
GlobalVariable Property FavorsPerNPCPerDay auto
Int Property PlayerHasQuestItem auto conditional
{Do not set this property. Used to track if the player has a quest item. See FavorQuestItemHandler script}

Quest Property FavorControlQuest auto

GlobalVariable Property pFavorTimeLeft auto
{Set this to the Global Variable used for your Favor's timer}

bool property bDoNotResetQuest auto
{OBSOLETE -- Set this to True if you do NOT want your Favor to be reset when it completes. Default = False}

bool Property bDisplayObjective  Auto  
{set to true to display objective and timer}

float fHourAsFloat = 0.0 ; set in OnInit
float fFavorEndTime
float fNextNotifyTime
float fFavorTimerReset

float fLastUpdateDays = 0.0

bool bTimerCancelled = false

Event OnInit()
	fHourAsFloat = 1.0 / 24.0
EndEvent

Event OnUpdate()
	
	; end the quest if the player leaves the headtrack zone without accepting
	if 	((QuestGiver.GetActorReference().GetDistance(Game.GetPlayer()) > 400) && (GetStage() < 10))
		SetStage(200)
	endif

	; start the timer if the player leaves the quest location	

EndEvent

bool Function UpdateObjectives()
	;when the timer reaches 0, the quest fails

	; KMK - way to turn on/off objective display
	int iObjective = -1
	if bDisplayObjective
		iObjective = GetStage()
	endif

	If (ModObjectiveGlobal(-fNextNotifyTime, pFavorTimeLeft, iObjective, 0, abCountingUp = False, abCompleteObjective = False, abRedisplayObjective = False))
		SetStage(200)
		return false ; tell our caller that we no longer need to update
	EndIf

	;Figure out how often to run the RegisterForUpdateGameTime Event
	If (pFavorTimeLeft.GetValue() >= 24)
		fNextNotifyTime = 6 ; If the timer has more than a day on it, notify us every 6 hours
	ElseIf (pFavorTimeLeft.GetValue() >= 6)
		fNextNotifyTime = 1 ; If the timer has more than 6 hours on it, notify us every hour
	Elseif (pFavorTimeLeft.GetValue() >= 1)
		fNextNotifyTime = 0.5 ; If the timer has more than 1 hour on it, notify us every half hour
	Else
		fNextNotifyTime = 0.25 ; If the timer has less than 1 hour on it, notify us every 15 minutes
	EndIf
	return true ; tell our caller to continue updating
EndFunction

bool bUpdatingObjectives = false
Event OnUpdateGameTime()
	while bUpdatingObjectives
		Utility.Wait(1)
	endWhile
	bUpdatingObjectives = True
	
	float fCurrentTimeDays = GameDaysPassed.Value
	float fTimePassed = (fCurrentTimeDays - fLastUpdateDays) / fHourAsFloat
	
; 	;Debug.Trace("Time passed since last update: " + fTimePassed + " hours")
	
	bool bContinueUpdating = true
	while fTimePassed > fNextNotifyTime ; While we have time left, keep faking updates
		bContinueUpdating = UpdateObjectives()
		fTimePassed -= fNextNotifyTime ; fNextNotifyTime can change, so make sure to update time passed using the updated value
; 		Debug.Trace("Update sent - time left: " + fTimePassed + " house")
	endWhile

	if bContinueUpdating
; 		;Debug.Trace("Remainder: " + (fTimePassed * fHourAsFloat) + " days")
		fLastUpdateDays = fCurrentTimeDays - (fTimePassed * fHourAsFloat)
		RegisterForUpdateGameTime(fNextNotifyTime)
	Else
; 		Debug.Trace("Done! Quest cancelled")
		UnregisterForUpdateGameTime()
	EndIf
	
	bUpdatingObjectives = false
EndEvent

Function FavorStartUp()
	;Poll to see if the player moves away from the NPC without accepting the favor
	RegisterForUpdate(5)

	;A Favor is now running on this actor
	;Don't run any more favors on this actor if the number of active favors is greater than FavorsConcurrentPerNPC
	QuestGiver.GetActorReference().ModActorValue("FavorActive", 1)
EndFunction

Function FavorAccepted()
	;Increment FavorsAcceptedCount. When this hits the FavorsConcurrentMax global, stop offering favors quests
	FavorControlQuestScript FavorControl = FavorControlQuest as FavorControlQuestScript
	FavorControl.ModFavorsAcceptedCount(1)
	
	;Setup the timer if one exists
	If (pFavorTimeLeft)	== None
		if bDisplayObjective
			SetObjectiveDisplayed(10, 1)
		endif
		Return
	Else		
		;Store the timer's original value so we can reset the global later
		fFavorTimerReset = pFavorTimeLeft.GetValue()		
		fNextNotifyTime = 0		
		if bDisplayObjective
			SetObjectiveDisplayed(10, 1)
		endif

		;Figure out how often to run the RegisterForUpdateGameTime Event for the timer
		If (pFavorTimeLeft.GetValue() >= 24)
			fNextNotifyTime = 6 ; If the timer has more than a day on it, notify us every 6 hours
		ElseIf (pFavorTimeLeft.GetValue() >= 6)
			fNextNotifyTime = 1 ; If the timer has more than 6 hours on it, notify us every hour
		Elseif (pFavorTimeLeft.GetValue() >= 1)
			fNextNotifyTime = 0.5 ; If the timer has more than 1 hour on it, notify us every half hour
		Else
			fNextNotifyTime = 0.25 ; If the timer has less than 1 hour on it, notify us every 15 minutes
		EndIf

		fLastUpdateDays = GameDaysPassed.Value
		RegisterForUpdateGameTime(fNextNotifyTime)

	EndIf
EndFunction

Function FavorShutdown()
	;Stop polling
	UnregisterForUpdate()
	UnregisterForUpdateGameTime()

	;Actor is no longer running this favor
	QuestGiver.GetActorReference().ModActorValue("FavorActive", -1)

	;Decrement FavorsAcceptedCount
	FavorControlQuestScript FavorControl = FavorControlQuest as FavorControlQuestScript
	FavorControl.ModFavorsAcceptedCount(-1)

	;Reset the favor timer if one exists
	If (pFavorTimeLeft)	!= None
		pFavorTimeLeft.SetValue(fFavorTimerReset)
	EndIf

	;Handle loose objectives
	If GetStageDone(20) == 1
		CompleteAllObjectives()
	Else
; 		;Debug.Trace("Waiting for a FailAllObjectives() function. Until then, failing Favor objectives manually may cause Papyrus Errors. They are safe to ignore.")

		; KMK - for now, turning off objectives rather than failing them
		if IsObjectiveDisplayed(10)
			SetObjectiveDisplayed(10, false)
		endif
		if IsObjectiveDisplayed(15)
			SetObjectiveDisplayed(15, false)
		endif
	EndIf

	Stop()

EndFunction