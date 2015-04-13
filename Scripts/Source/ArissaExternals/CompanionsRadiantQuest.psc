Scriptname CompanionsRadiantQuest extends Quest Conditional

Quest Property ParentQuest auto
ReferenceAlias Property Questgiver auto
ReferenceAlias Property MapMarker auto
bool Property IsRegistered = false auto
bool Property QuestgiverComesAlong = false auto conditional
bool Property IsActive = false auto conditional
bool Property IsAccepted = false auto conditional
bool Property WasRejected = false auto conditional
int  Property RewardAmount = 100 auto
bool Property Succeeded = false auto
bool Property Premature = false auto


; called when quest is first setup, but before player has accepted it
Function Setup()
	; default properties are supposed to handle most of these, but just in case....
	; IsRegistered = false
	; QuestgiverComesAlong = false
	; IsActive = false
	; IsAccepted = false
	; WasRejected = false
	; Succeeded = false
	; Premature = false

	int level = Game.GetPlayer().GetLevel()
	if     (level < 10)
		RewardAmount = 100
	elseif (level < 20)
		RewardAmount = 150
	elseif (level < 20)
		RewardAmount = 200
	elseif (level < 20)
		RewardAmount = 250
	else
		RewardAmount = 300
	endif

	(ParentQuest as CompanionsHousekeepingScript).RegisterRadiantQuest(self)
	SetStage(1)
EndFunction

; called when player accepts quest
Function Accepted()
; 	Debug.Trace("CRQ: Accepting " + self + ".")
	(ParentQuest as CompanionsHousekeepingScript).AcceptRadiantQuest(Questgiver.GetActorReference(), QuestgiverComesAlong)
	if ( (MapMarker != None) && (MapMarker.GetReference() != None) )
		MapMarker.GetReference().AddToMap()
	endif
	IsAccepted = True 
	SetStage(10)
EndFunction

; when player turns down the quest
Function Rejected()
; 	Debug.Trace("CRQ: Rejecting " + self + ".")
	WasRejected = True
EndFunction

; when player has finished quest, but not yet collected reward
Function Finished(bool _succeeded = true, bool _finished = true)
; 	Debug.Trace("CRQ: Finishing " + self + "; succeeded? " + _succeeded)
	Succeeded = _succeeded
	(ParentQuest as CompanionsHousekeepingScript).RadiantQuestFinished = _finished
EndFunction

; when the quest is shutting down
Function Cleanup()
	if (!Premature)
		(ParentQuest as CompanionsHousekeepingScript).CompleteRadiantQuest(self)
	endif
EndFunction

; for when the player kills someone before they accepted the quest, etc
Function PrematureShutdown()
; 	Debug.Trace("CRQ: Shutting down " + self + "prematurely...")
	IsAccepted = false
	Premature = true
	(ParentQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
	Cleanup()
EndFunction
