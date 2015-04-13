Scriptname WEAliasScript extends ReferenceAlias  
{Should be attached to all aliases in Wilderness Encounter quests.}

bool Property RegisterLoadingAndUnloading = true auto
{Default = TRUE; causes the quest to keep running if loaded, and stop if all similarly flagged aliases unload.}

int Property StopRegisteringUnloadingIfStageHasBeenSet = -1 Auto
{Default = -1 (doesn't matter); don't register unloading if this quest stage}

bool Property PacifyOnLoad = False Auto
{Default = FALSE: Should this alias be made unagressive when he loads?}

bool Property MakeAggressiveAndAttackPlayerIfAttacked = False Auto
{Default = FALSE: Should this alias be made an enemy and set his aggression to very aggressive if he's attacked by the player?}

bool Property MakeAggressiveOnGainLOSToPlayer = false Auto
{Default = FALSE: Should this alias be made an enemy and set his aggression to very aggressive if he sees the player?}

float Property MakeAggressiveOnDistanceToPlayer = 0.0 Auto
{Default = -1, off: Postive value means when the player gets this close the actor should become aggressive. Note: there is a short delay, this is not instantaneous}

bool Property InitiallyDisabled = false Auto
{Default = FALSE: should this alias disable when it loads the first time}
bool disabledOnce

bool Property DisableOnUnload = false Auto
{Default = FALSE: Should this alias disable itself when it unloads}

bool Property KillOnLoad = false Auto
{Default = FALSE: Should this alias kill itself when it loads}

Faction Property PutInThisFactionOnLoad Auto
{Optional: Put alias into this faction on load. Useful for setting up a faction that hates itself if you want to pacify things and yet make them attack each other.}


bool attached	;My cell has attached or I moved into an attached cell   (OR - rare/impossible: tried to detach before ever trying to attach)
bool detached	;My cell has detached or I moved into a detached cell   (OR - rare/impossible: tried to detach before ever trying to attach)

Event OnUpdate()

	if MakeAggressiveOnDistanceToPlayer > 0
	
		if GetReference().GetDistance(Game.GetPlayer()) < MakeAggressiveOnDistanceToPlayer
; 			;debug.trace(self + "OnUpdate() player is within MakeAggressiveOnDistanceToPlayer [ " + MakeAggressiveOnDistanceToPlayer + "], making aggressive to player.")
			(GetOwningQuest() as WEScript).makeAliasAggressiveAndAttackPlayer(self)
		Else
	
; 			;debug.trace(self + "OnUpdate() player isn't close enough, so calling RegisterForSingleUpdate(1) to poll again later.")
			RegisterForSingleUpdate(1)
		EndIf
		
	EndIf


EndEvent


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if MakeAggressiveAndAttackPlayerIfAttacked && akAggressor == Game.GetPlayer()
		(GetOwningQuest() as WEScript).makeAliasAggressiveAndAttackPlayer(self)
	
	EndIf

EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
	if akViewer == GetActorReference() && akTarget == Game.GetPlayer() as Actor
		(GetOwningQuest() as WEScript).makeAliasAggressiveAndAttackPlayer(self)
	EndIf
EndEvent

Event OnCellAttach()
	TryToAttach()
EndEvent

Event OnAttachedToCell()
	TryToAttach()
EndEvent

Event OnCellDetach()
	TryToDetach()
EndEvent

Event OnDetachedFromCell()
	TryToDetach()
EndEvent


Event OnLoad()
	TryToAttach()

	if InitiallyDisabled && DisabledOnce == False
; 		;debug.trace(self + "OnLoad() calling TryToDisable()")
		DisabledOnce = True
		TryToDisable()
	EndIf

	if MakeAggressiveOnGainLOSToPlayer
; 		;debug.trace(self + "OnLoad() calling RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)")
		RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
	
	EndIf

	if MakeAggressiveOnDistanceToPlayer > 0
; 		;debug.trace(self + "OnLoad() calling RegisterForSingleUpdate(1)")
		RegisterForSingleUpdate(1)
	EndIf
		
	if PacifyOnLoad
		(GetOwningQuest() as WEScript).pacifyAlias(self)
	EndIf

	if PutInThisFactionOnLoad
		GetActorReference().AddToFaction(PutInThisFactionOnLoad)
	EndIf
	
	if KillOnLoad
		GetActorReference().kill()
	EndIf
	
; 	;debug.trace(self + "OnLoad()")
	
EndEvent

Event OnUnload()
	TryToDetach()
	
	if DisableOnUnload
; 		;debug.trace(self + "OnUnload() calling Disable()")
		GetReference().Disable()
	EndIf
	
EndEvent

;*** DON'T TRACE IN HERE BEFORE SETTING THE ATTACH/DETACHED VARS - for thread safety
Function TryToAttach()
	if attached || detached    ;If we have already detached or attached before
		;do nothing
		Return
		
	Else ;We haven’t detached or attached before
		Attached  = true
		
		;*** increment and do stuff here
		if RegisterLoadingAndUnloading 
; 			;debug.trace(self + "OnLoad() calling AliasLoadingOrUnloading(IsLoading = True)")
			(GetOwningQuest() as WEScript).AliasLoadingOrUnloading(IsLoading = True)
		EndIf
		
	Endif

	
EndFunction

;*** DON'T TRACE IN HERE BEFORE SETTING THE ATTACH/DETACHED VARS - for thread safety
Function TryToDetach()
	If detached ; we’ve already detached
		;do nothing
		Return
	Elseif attached ; we haven’t detached AND we have attached – clean up
		Detached = true
		
		;*** decrement and do stuff here
		if RegisterLoadingAndUnloading
			if StopRegisteringUnloadingIfStageHasBeenSet != -1 && GetOwningQuest().GetStageDone(StopRegisteringUnloadingIfStageHasBeenSet) == True
; 				debug.trace(self + "WEAliasScript Not unregistering this reference because stage has been set: " + StopRegisteringUnloadingIfStageHasBeenSet)
			Else		
; 				;debug.trace(self + "OnUnload() calling AliasLoadingOrUnloading(IsLoading = False)")
				(GetOwningQuest() as WEScript).AliasLoadingOrUnloading(IsLoading = False)
			EndIf
		EndIf
		
	Else ; we haven’t attached or detached yet, so we didn’t really exist, do nothing and force ignoring everything else
		Detached = true
		Attached = true
		
		;*** tell quest to clean up if everyone else is gone – but do NOT decrement, because we never incremented
		(GetOwningQuest() as WEScript).RegisterForStopQuest()
		
	Endif

EndFunction

