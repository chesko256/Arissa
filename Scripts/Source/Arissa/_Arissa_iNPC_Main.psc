scriptname _Arissa_iNPC_Main extends Quest conditional

import debug

Actor property PlayerRef auto
MiscObject property Lockpick auto
LeveledItem property LItemPoisonAll auto
_Arissa_PlayerActivityMonitor property Activity auto
_Arissa_Compatibility property Compatibility auto
;==============iNPC Actor Properties==============
Actor property iNPC_Actor auto						;MUST be set in the Creation Kit
ReferenceAlias property iNPC auto
;@TODO: Set Current/PotentialFollowerFaction for compatibility
Faction property _ArissaFollowerFaction auto
GlobalVariable property _Arissa_Setting_AllowChatter auto
GlobalVariable property _Arissa_Setting_ChatterFrequency auto
GlobalVariable property _Arissa_Setting_AllowAnnounceNewArea auto
GlobalVariable property _Arissa_Setting_NewAreaFrequency auto
GlobalVariable property _Arissa_Setting_SuppressDialogue auto
GlobalVariable property _Arissa_Setting_RegardSystem auto

;==============iNPC Behavior Flags==============
bool Property PlayerSettled auto conditional hidden
bool Property CanFollow auto conditional hidden
bool Property IsFollowing auto conditional hidden
bool Property CanWait auto conditional hidden
bool Property IsWaiting auto conditional hidden
bool property CanDoFavors = false auto conditional hidden
bool property IsTownRoaming auto conditional hidden
bool property CanTownRoam = true auto conditional hidden
bool Property IsDismissed auto conditional hidden
bool Property CanBeDismissed auto conditional hidden
bool property CanRideOwnHorse = true auto conditional hidden		;False if we want to use Convenient Horses, true otherwise
bool property IsRidingOwnHorse auto conditional hidden
bool property WaitingQuestOverride = false auto hidden				;Set by main quest events to prevent waiting
bool property GaveLockpicksToday = false auto conditional hidden
bool property GavePoisonsToday = false auto conditional hidden

;==============iNPC Stat Memory Counters==============
int property PlayerStat_BrawlsWon = 0 auto hidden
int property PlayerStat_Backstabs = 0 auto hidden
int property PlayerStat_LocationsDiscovered = 0 auto hidden
int property PlayerStat_DungeonsCleared = 0 auto hidden
int property PlayerStat_DaysPassed = 0 auto hidden
int property PlayerStat_Persuasions = 0 auto hidden
int property PlayerStat_Bribes = 0 auto hidden
int property PlayerStat_QuestsCompleted = 0 auto hidden
int property PlayerStat_SpellsLearned = 0 auto hidden
int property PlayerStat_PocketsPicked = 0 auto hidden
int property PlayerStat_LocksPicked = 0 auto hidden
int property PlayerStat_HorsesStolen = 0 auto hidden
int property PlayerStat_DragonSoulsCollected = 0 auto hidden
int property PlayerStat_PeopleKilled = 0 auto hidden
int property PlayerStat_UndeadKilled = 0 auto hidden
int property PlayerStat_DaedraKilled = 0 auto hidden
int property PlayerStat_AutomatonsKilled = 0 auto hidden
int property PlayerStat_TimesShouted = 0 auto hidden
int property PlayerStat_WordsOfPowerLearned = 0 auto hidden
int property PlayerStat_SneakAttacks = 0 auto hidden
int property PlayerStat_ItemsStolen = 0 auto hidden
int property PlayerStat_Murders = 0 auto hidden
int property PlayerStat_Intimidations = 0 auto hidden

;==============iNPC Misc Properties==============
ReferenceAlias Property HomeMarker auto hidden						;Go back here if dismissed or abandoned
Faction Property WIFollowerCommentFaction auto
Quest property MonitoringQuest auto
_Arissa_iNPC_MonitoringPlayerScript property MonitorScript auto
GlobalVariable property _Arissa_DebugVar auto
Weapon property _Arissa_IronDaggerForceEquipUpdate auto
int property FollowDistance = 3 auto conditional hidden				;3 = Far, 2 = Medium, 1 = Close (defined in iNPC Packages)
message property _Arissa_RegardRank_1 auto
message property _Arissa_RegardRank_2 auto
message property _Arissa_RegardRank_3 auto
message property _Arissa_RegardRank_4 auto
message property _Arissa_RegardRank_5 auto
message property _Arissa_RegardRank_6 auto
message property _Arissa_RegardRank_7 auto
message property _Arissa_RegardUpMinor auto
message property _Arissa_RegardUpModerate auto
message property _Arissa_RegardUpMajor auto
message property _Arissa_RegardUpExtreme auto
message property _Arissa_RegardDownMinor auto
message property _Arissa_RegardDownModerate auto
message property _Arissa_RegardDownMajor auto
message property _Arissa_RegardDownExtreme auto
message property _Arissa_Regard180 auto
message property _ArissaDismissMessage auto

GlobalVariable property _Arissa_Setting_ShowRegardLevels auto
GlobalVariable property _Arissa_Setting_ShowRegardChanges auto

;Starting Values
bool bSetup = false
function InitialSetup()
	if bSetup
		return
	endif
	PlayerAssessmentRegard = -6.0   			;Start the game somewhat not well regarded
endFunction

;====================================================================================================================
;
;
;													iNPC MOOD SYSTEM
;
;
;====================================================================================================================
;Mood Axis Values
   ; Short term variables that affect how we feel in the present moment.

GlobalVariable property _Arissa_MoodOpenness auto 		;-3 (Guarded)-----------0----------- 3 (Open)			
GlobalVariable property _Arissa_MoodPlayfulness auto	;-3 (Serious)-----------0----------- 3 (Playful)				

; starts the game slightly playful and slightly guarded (sarcastic)
int anchorOpenness = -1
int anchorPlayfulness = 1

;Mood Anchor Values
   ; Anchors are the general place in the personality that the character will return to after a time. The anchor moves as the attitudes towards
   ; the player adjust more permamently.


int property AxisAnchorOpenness hidden
	int function get()
		return anchorOpenness
	endfunction
	function set(int newValue)
		int oldValue = anchorOpenness
		anchorOpenness = ClampInt(newValue, moodAxisMin, moodAxisMax)
	endfunction
endProperty

int property AxisAnchorPlayfulness hidden
	int function get()
		return anchorPlayfulness
	endfunction
	function set(int newValue)
		int oldValue = anchorPlayfulness
		anchorPlayfulness = ClampInt(newValue, moodAxisMin, moodAxisMax)
	endfunction
endProperty

Idle Property RF_MoodChangeGuarded auto
{Set by the optional Dawnguard add-on}
Idle Property RF_MoodChangeOpen auto
{Set by the optional Dawnguard add-on}
Idle Property RF_MoodChangeSerious auto
{Set by the optional Dawnguard add-on}
Idle Property RF_MoodChangePlayful auto
{Set by the optional Dawnguard add-on}

int moodAxisMin = -3
int moodAxisMax =  3

bool moodAxisCrossingTimeout = false

Function AxisCrossedOver()
	if (moodAxisCrossingTimeout)
		return
	endif
	ArissaDebug(1, "iNPC: Axis crossed.")
	moodAxisCrossingTimeout = true
	if     (_Arissa_MoodOpenness.GetValueInt() <  0 && _Arissa_MoodPlayfulness.GetValueInt() <  0)
		if RF_MoodChangeGuarded != none
			iNPC.GetActorReference().PlayIdle(RF_MoodChangeGuarded)
		endif
	elseif (_Arissa_MoodOpenness.GetValueInt() >=  0 && _Arissa_MoodPlayfulness.GetValueInt() <  0)
		if RF_MoodChangeOpen != none
			iNPC.GetActorReference().PlayIdle(RF_MoodChangeOpen)
		endif
	elseif (_Arissa_MoodOpenness.GetValueInt() <  0 && _Arissa_MoodPlayfulness.GetValueInt() >=  0)
		if RF_MoodChangeSerious != none
			iNPC.GetActorReference().PlayIdle(RF_MoodChangeSerious)
		endif
	elseif (_Arissa_MoodOpenness.GetValueInt() >=  0 && _Arissa_MoodPlayfulness.GetValueInt() >=  0)
		if RF_MoodChangePlayful != none
			iNPC.GetActorReference().PlayIdle(RF_MoodChangePlayful)
		endif
	endif
	Utility.Wait(0.1)
	moodAxisCrossingTimeout = false
EndFunction

int Property AxisOpenness hidden
	int function get()
		return _Arissa_MoodOpenness.GetValueInt()
	endfunction
	function set(int newValue)
		int oldValue = _Arissa_MoodOpenness.GetValueInt()
		_Arissa_MoodOpenness.SetValueInt(ClampInt(newValue, moodAxisMin, moodAxisMax))
		if (oldValue < 0 && _Arissa_MoodOpenness.GetValueInt() >= 0)
			AxisCrossedOver()
		elseif (oldValue >= 0 && _Arissa_MoodOpenness.GetValueInt() < 0)
			AxisCrossedOver()
		endif
	endfunction
EndProperty

int Property AxisPlayfulness hidden
	int function get()
		return _Arissa_MoodPlayfulness.GetValueInt()
	endfunction
	function set(int newValue)
		int oldValue = _Arissa_MoodPlayfulness.GetValueInt()
		_Arissa_MoodPlayfulness.SetValueInt(ClampInt(newValue, moodAxisMin, moodAxisMax))
		if (oldValue < 0 && _Arissa_MoodPlayfulness.GetValueInt() >= 0)
			AxisCrossedOver()
		elseif (oldValue >= 0 && _Arissa_MoodPlayfulness.GetValueInt() < 0)
			AxisCrossedOver()
		endif
	endfunction
EndProperty

;Mood Override functions
Function SlamToCaring()
	ArissaDebug(1, "iNPC: Forcing to 'Caring' animation base.")
	AxisPlayfulness = -3
	AxisOpenness = 3
	AxisCrossedOver()
EndFunction

Function SlamToStandoff()
	ArissaDebug(1, "iNPC: Forcing to 'Standoff-ish' animation base.")
	AxisPlayfulness = -3
	AxisOpenness = -3
	AxisCrossedOver()
EndFunction

Function SlamToFlirty()
	ArissaDebug(1, "iNPC: Forcing to 'Flirty' animation base.")
	AxisPlayfulness = 3
	AxisOpenness = 3
	AxisCrossedOver()
EndFunction

Function SlamToSarcastic()
	ArissaDebug(1, "iNPC: Forcing to 'Sarcastic' animation base.")
	AxisPlayfulness = 3
	AxisOpenness = -3
	AxisCrossedOver()
EndFunction

Function ModAxis(int axisIndex, int amount)
	; 1 = Playfulness, 2 = Openness
	if (axisIndex == 1)
		AxisPlayfulness += amount
	endif
	if (axisIndex == 2)
		AxisOpenness += amount
	endif	
EndFunction

Function IncreaseSerious(int amount = 1)
	ModAxis(1, -amount)
EndFunction

Function IncreasePlayful(int amount = 1)
	ModAxis(1, amount)
EndFunction

Function IncreaseGuarded(int amount = 1)
	ModAxis(2, -amount)
EndFunction

Function IncreaseOpen(int amount = 1)
	ModAxis(2, amount)
EndFunction

Function DecreaseSerious(int amount = 1)
	ModAxis(1, amount)
EndFunction

Function DecreasePlayful(int amount = 1)
	ModAxis(1, -amount)
EndFunction

Function DecreaseGuarded(int amount = 1)
	ModAxis(2, amount)
EndFunction

Function DecreaseOpen(int amount = 1)
	ModAxis(2, -amount)
EndFunction

;====================================================================================================================
;
;
;													iNPC REGARD SYSTEM
;
;
;====================================================================================================================
GlobalVariable property _Arissa_Regard auto
float assessmentMin = -10.0
float assessmentMax = 10.0
float tinyAssessment = 0.005
float minorAssessment = 0.1
float moderateAssessment = 0.2
float majorAssessment = 0.50
float extremeAssessment = 2.0

float property AssessmentThresholdCompanion = 8.0 auto conditional hidden
float property AssessmentThresholdFriendly = 5.0 auto conditional hidden
float property AssessmentThresholdAllied = 0.0 auto conditional hidden
float property AssessmentThresholdDistant = -5.0 auto conditional hidden
float property AssessmentThresholdDistrustful = -8.0 auto conditional hidden
float property AssessmentThresholdRival = -10.0 auto conditional hidden

float Property PlayerAssessmentRegard hidden
	float function get()
		return _Arissa_Regard.GetValue()
	endfunction
	function set(float newValue)
		float oldValue = _Arissa_Regard.GetValue()
		_Arissa_Regard.SetValue(ClampFloat(newValue, assessmentMin, assessmentMax))
	endfunction
EndProperty

	;REGARD

	;Value that determines how open we are to the player with sensitive matters,
	;and affects quest options.
	;Affects our willingness to wait.
	;Affects our willingness to trade.
	;Affects our willingness to take orders.
	;Affects our combat performance and options.
	;Affects dialogue options.
	;Affects willingness to change equipment.

	;Rank								;Unlocks
	;> 8 (Companion)					Horn of Oakshore
	;> 5	(Friend)					Lockpicks, Poisons
	;> 0 	(Ally)						Waiting, Favors
	;> -5 (Distant)						Trade
	;> -8 (Resentful)					(Nothing)
	;> -10 (Enemy)						(Leaves)

	;SlamToDisRegard - Discover being a cannibal

Function ModAssessment(float amount)
	if _Arissa_Setting_RegardSystem.GetValueInt() != 2
		return
	endif

	float fOldValue = PlayerAssessmentRegard
	PlayerAssessmentRegard += amount

	;Update our willingness to do favors
	if PlayerAssessmentRegard >= 0
		CanDoFavors = true
	else
		CanDoFavors = false
	endif
	iNPC.GetActorReference().SetPlayerTeammate(true, CanDoFavors)
	
	utility.wait(0.2)
	if _Arissa_Setting_ShowRegardLevels.GetValueInt() == 1
		if !(fOldValue > AssessmentThresholdCompanion) && PlayerAssessmentRegard > AssessmentThresholdCompanion
			_Arissa_RegardRank_1.Show()
		elseif !IsBetween(fOldValue, AssessmentThresholdCompanion, AssessmentThresholdFriendly) && IsBetween(PlayerAssessmentRegard, AssessmentThresholdCompanion, AssessmentThresholdFriendly)
			_Arissa_RegardRank_2.Show()
		elseif !IsBetween(fOldValue, AssessmentThresholdFriendly, AssessmentThresholdAllied) && IsBetween(PlayerAssessmentRegard, AssessmentThresholdFriendly, AssessmentThresholdAllied)
			_Arissa_RegardRank_3.Show()
		elseif !IsBetween(fOldValue, AssessmentThresholdAllied, AssessmentThresholdDistant) && IsBetween(PlayerAssessmentRegard, AssessmentThresholdAllied, AssessmentThresholdDistant)
			_Arissa_RegardRank_4.Show()
		elseif !IsBetween(fOldValue, AssessmentThresholdDistant, AssessmentThresholdDistrustful) && IsBetween(PlayerAssessmentRegard, AssessmentThresholdDistant, AssessmentThresholdDistrustful)
			_Arissa_RegardRank_5.Show()
		elseif !IsBetween(fOldValue, AssessmentThresholdDistrustful, AssessmentThresholdRival) && IsBetween(PlayerAssessmentRegard, AssessmentThresholdDistrustful, AssessmentThresholdRival)
			_Arissa_RegardRank_6.Show()
		elseif !(fOldValue < AssessmentThresholdRival) && PlayerAssessmentRegard < AssessmentThresholdRival
			_Arissa_RegardRank_7.Show()
		endif
	endif

EndFunction

bool function IsBetween(float fValue, float fUpperBound, float fLowerBound)
	if fValue <= fUpperBound && fValue > fLowerBound
		return true
	else
		return false
	endif
endFunction

Function IncreaseRegardTiny()
	ModAssessment(tinyAssessment)
	ArissaDebug(1, "Regard +" + tinyAssessment + " (New value: " + PlayerAssessmentRegard + ")")
EndFunction

Function IncreaseRegardMinor()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_RegardUpMinor.Show()
	endif
	ModAssessment(minorAssessment)
	ArissaDebug(1, "Regard +" + minorAssessment + " (New value: " + PlayerAssessmentRegard + ")")
EndFunction

Function IncreaseRegardModerate()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_RegardUpModerate.Show()
	endif
	ModAssessment(moderateAssessment)
	ArissaDebug(1, "Regard +" + moderateAssessment + " (New value: " + PlayerAssessmentRegard + ")")
EndFunction

Function IncreaseRegardMajor()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_RegardUpMajor.Show()
	endif
	ModAssessment(majorAssessment)
	ArissaDebug(1, "Regard +" + majorAssessment + " (New value: " + PlayerAssessmentRegard + ")")
EndFunction

Function IncreaseRegardExtreme()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_RegardUpExtreme.Show()
	endif
	ModAssessment(extremeAssessment)
	ArissaDebug(1, "Regard +" + extremeAssessment + " (New value: " + PlayerAssessmentRegard + ")")
endFunction

Function DecreaseRegardTiny()
	ModAssessment(-tinyAssessment)
	ArissaDebug(1, "Regard -" + tinyAssessment + " (New value: " + PlayerAssessmentRegard + ")")
EndFunction

Function DecreaseRegardMinor()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_RegardDownMinor.Show()
	endif
	ModAssessment(-minorAssessment)
	ArissaDebug(1, "Regard -" + minorAssessment + " (New value: " + PlayerAssessmentRegard + ")")
EndFunction

Function DecreaseRegardModerate()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_RegardDownModerate.Show()
	endif
	ModAssessment(-moderateAssessment)
	ArissaDebug(1, "Regard -" + moderateAssessment + " (New value: " + PlayerAssessmentRegard + ")")
EndFunction

Function DecreaseRegardMajor()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_RegardDownMajor.Show()
	endif
	ModAssessment(-majorAssessment)
	ArissaDebug(1, "Regard -" + majorAssessment + " (New value: " + PlayerAssessmentRegard + ")")
EndFunction

Function DecreaseRegardExtreme()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_RegardDownExtreme.Show()
	endif
	ModAssessment(-extremeAssessment)
	ArissaDebug(1, "Regard -" + extremeAssessment + " (New value: " + PlayerAssessmentRegard + ")")
endFunction

;Assessment Override Functions

function SlamToDisregarded()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_Regard180.Show()
	endif
	ModAssessment(-40.0)
	ArissaDebug(1, "Regard -40.0, New value: " + PlayerAssessmentRegard + ")")
endFunction

function SlamToRegarded()
	if _Arissa_Setting_ShowRegardChanges.GetValueInt() == 1
		_Arissa_Regard180.Show()
	endif
	ModAssessment(40.0)
	ArissaDebug(1, "Regard +40.0, New value: " + PlayerAssessmentRegard + ")")
endFunction

function OverrideRegard(float fVal)
	ModAssessment(fVal)
	ArissaDebug(1, "Regard new value: " + PlayerAssessmentRegard + ")")
endFunction

;#endregion

;====================================================================================================================
;
;
;												iNPC STANDARD BEHAVIOR FUNCTIONS
;
;
;====================================================================================================================

Function EngageFollowBehavior(bool allowDismiss = true)
	ArissaDebug(1, "Engaging follow behavior.")
	IsFollowing = true
	IsWaiting = false
	IsTownRoaming = false
	IsDismissed = false
	CanBeDismissed = allowDismiss
	UpdateAllStats()
	iNPC.ForceRefIfEmpty(iNPC_Actor)
	iNPC.GetActorReference().SetFactionRank(_ArissaFollowerFaction, 0)
	iNPC.GetActorReference().SetPlayerTeammate(true, CanDoFavors)
	iNPC.GetActorReference().EvaluatePackage()
	iNPC.TryToAddToFaction(WIFollowerCommentFaction)
	iNPC.GetActorReference().IgnoreFriendlyHits()
	MonitoringQuest.Start()
	Activity.ReInit()
	EvaluateBestEquipment()
	;/if Compatibility.EFF != none
		Quest EFFQuest = Compatibility.EFF
		(EFFQuest as EFFCore).XFL_AddFollower(iNPC_Actor)
	endif
	/;
	SetAllowChatter()
	ArissaDebug(1, "================[iNPC]================")
	ArissaDebug(1, "Engaging follower behavior.")
	ArissaDebug(1, "Alias: " + iNPC)
	ArissaDebug(1, "Alias Ref: " + iNPC.GetActorReference())
	ArissaDebug(1, "Faction Rank: " + iNPC.GetActorReference().GetFactionRank(_ArissaFollowerFaction))
	ArissaDebug(1, "IsFollowing: " + IsFollowing)
	ArissaDebug(1, "IsWaiting: " + IsWaiting)
	ArissaDebug(1, "IsTownRoaming: " + IsTownRoaming)
	ArissaDebug(1, "IsDismissed: " + IsDismissed)
	ArissaDebug(1, "CanBeDismissed: " + CanBeDismissed)
	ArissaDebug(1, "IsIgnoringFriendlyHits: " + iNPC.GetActorRef().IsIgnoringFriendlyHits())
	ArissaDebug(1, "================[iNPC]================")
EndFunction

Function DisengageFollowBehavior()
	ArissaDebug(1, "Disengaging follow behavior.")
	IsFollowing = false
	IsWaiting = false
	IsDismissed = true
	CanBeDismissed = true
	iNPC.GetActorReference().SetFactionRank(_ArissaFollowerFaction, -1)
	iNPC.GetActorReference().SetPlayerTeammate(false)
	iNPC.GetActorReference().EvaluatePackage()
	iNPC.TryToRemoveFromFaction(WIFollowerCommentFaction)
	iNPC.GetActorReference().IgnoreFriendlyHits(false)
	MonitoringQuest.Stop()
	;/if Compatibility.EFF != none
		Quest EFFQuest = Compatibility.EFF
		(EFFQuest as EFFCore).XFL_RemoveFollower(iNPC_Actor)
	endif
	/;
	if !IsTownRoaming
		_ArissaDismissMessage.Show()
	endif
EndFunction

Function SetHomeMarker(int choiceSet, ObjectReference newHomeMarker=None)
	
	;? insert logic to move her there if she's unloaded and not following the player
EndFunction

Function Wait()
	ArissaDebug(1, "Being told to wait...")
	if (!CanWait)
		ArissaDebug(1, "... but not listening.")
		IsWaiting = false
	else
		ArissaDebug(1, "... and obeying.")
		IsWaiting = true
		iNPC.GetActorReference().SetAV("WaitingForPlayer", 1)
		iNPC.GetActorReference().EvaluatePackage()
		;(iNPC as DLC1RNPCAliasScript).RegisterForUpdateGameTime(72)
	endif
EndFunction

Function StopWaiting()
	;The normal "Let's go" result.
	if (IsDismissed)
		EngageFollowBehavior(CanBeDismissed)
	else
		IsWaiting = false
		;(iNPC as DLC1RNPCAliasScript).UnregisterForUpdateGameTime()
		iNPC.GetActorReference().SetAV("WaitingForPlayer", 0)
		iNPC.GetActorReference().EvaluatePackage()
	endif
EndFunction

Function FinishWaiting()
	;For giving up on the player after waiting too long.
	if iNPC.GetActorRef().GetCurrentLocation() == PlayerRef.GetCurrentLocation()
		;We're in the same place, return to player
		StopWaiting()
	else
		;Leave and get mad
		IsWaiting = false
		iNPC.GetActorRef().SetAV("WaitingForPlayer", 0)
		if (CanBeDismissed)
			DisengageFollowBehavior()
			Dismiss()
		endif
		iNPC.GetActorReference().EvaluatePackage()
		DecreaseRegardModerate()
	endif
EndFunction

Function Dismiss()
	ArissaDebug(1, "Being dismissed...")
	if (!CanBeDismissed)
		ArissaDebug(1, "... but not listening.")
	else
		ArissaDebug(1, "... and obeying.")
		DisengageFollowBehavior()
		;Evaluate this
		;if (CentralFollowerAlias.GetReference() == iNPC.GetReference())
		;	(DialogueFollower as DialogueFollowerScript).DismissFollower()
		;endif
		;Evaluate this
	endif
EndFunction

bool function SetUseOwnHorse(bool abEnable = true)
	if abEnable == false
		ObjectReference HorseRef = MonitorScript.MyHorse
		if HorseRef
			if (HorseRef as Actor).IsBeingRidden() || IsRidingOwnHorse == true
				;Force a dismount
				IsRidingOwnHorse = false
				iNPC.GetActorRef().EvaluatePackage()
				utility.wait(2.0)
				CanRideOwnHorse = false
				return true
			else
				CanRideOwnHorse = false
				return true
			endif
		else
			CanRideOwnHorse = false
			return true
		endif
	else
		CanRideOwnHorse = true
		return true
	endif
endFunction

function GiveLockpicks()
	PlayerRef.AddItem(Lockpick, utility.RandomInt(1, 3))
	GaveLockpicksToday = true
endFunction

function GivePoisons()
	PlayerRef.AddItem(LItemPoisonAll, 1)
	GavePoisonsToday = true
endFunction

function SetAllowChatter()
	;overridden by Behavior
endFunction

function EvaluateBestEquipment()
	; Force Arissa to evaluate her best gear.
	; debug.trace("[Arissa Debug] Evaluating best equipment.")
	iNPC.GetActorRef().AddItem(_Arissa_IronDaggerForceEquipUpdate)
	utility.wait(0.1)
	iNPC.GetActorRef().RemoveItem(_Arissa_IronDaggerForceEquipUpdate)
endFunction

;====================================================================================================================
;
;
;												iNPC UTILITY FUNCTIONS
;
;
;====================================================================================================================
float Function ClampFloat(float value, float min, float max)
	if (value > max)
		value = max
	endif
	if (value < min)
		value = min
	endif
	return value
EndFunction

int Function ClampInt(int value, int min, int max)
	if (value > max)
		value = max
	endif
	if (value < min)
		value = min
	endif
	return value
EndFunction

function ArissaDebug(int iClassification, string sDebugMessage)
	;1 = Regard updates, status changes
	;2 = Quest state data
	;3 = Scene data
	;4 = Other
	if _Arissa_DebugVar.GetValueInt() == iClassification
		trace("[ARISSA] " + sDebugMessage)
	endif
endFunction

bool function IsFollowingAndNearPlayer()
	if IsFollowing == true && \
		IsWaiting == false && \
		IsDismissed == false && \
		iNPC_Actor.GetDistance(PlayerRef) <= 1000.0
		return true
	else
		return false
	endif
endFunction

function UpdateAllStats()
	PlayerStat_BrawlsWon = Game.QueryStat("Brawls Won")
	PlayerStat_Backstabs = Game.QueryStat("Backstabs")
	PlayerStat_LocationsDiscovered = Game.QueryStat("Locations Discovered")
	PlayerStat_DungeonsCleared = Game.QueryStat("Dungeons Cleared")
	PlayerStat_DaysPassed = Game.QueryStat("Days Passed")
	PlayerStat_Persuasions = Game.QueryStat("Persuasions")
	PlayerStat_Bribes = Game.QueryStat("Bribes")
	PlayerStat_QuestsCompleted = Game.QueryStat("Quests Completed")
	PlayerStat_SpellsLearned = Game.QueryStat("Spells Learned")
	PlayerStat_PocketsPicked = Game.QueryStat("Pockets Picked")
	PlayerStat_LocksPicked = Game.QueryStat("Locks Picked")
	PlayerStat_HorsesStolen = Game.QueryStat("Horses Stolen")
	PlayerStat_DragonSoulsCollected = Game.QueryStat("Dragon Souls Collected")
	PlayerStat_PeopleKilled = Game.QueryStat("People Killed")
	PlayerStat_UndeadKilled = Game.QueryStat("Undead Killed")
	PlayerStat_DaedraKilled = Game.QueryStat("Daedra Killed")
	PlayerStat_AutomatonsKilled = Game.QueryStat("Automatons Killed")
	PlayerStat_TimesShouted = Game.QueryStat("Times Shouted")
	PlayerStat_WordsOfPowerLearned = Game.QueryStat("Words Of Power Learned")
	PlayerStat_SneakAttacks = Game.QueryStat("Sneak Attacks")
	PlayerStat_ItemsStolen = Game.QueryStat("Items Stolen")
	PlayerStat_Murders = Game.QueryStat("Murders")
	PlayerStat_Intimidations = Game.QueryStat("Intimidations")
endFunction