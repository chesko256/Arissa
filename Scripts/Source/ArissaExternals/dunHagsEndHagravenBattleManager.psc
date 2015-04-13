Scriptname dunHagsEndHagravenBattleManager extends Actor
{Boss battle script for the Hagraven in Hag's End, who teleports to a number of set locations ahead of the player.}

int battleStage = 0
;Current combat phase.
;0 = Dining Room 100-60%
;1 = Throne Hall 90-45%
;2 = Ritual Chamber 80-25% 
;3 = Peak 75-0%

bool battleStageActive = True
;Is the Hagraven in the level and active? False if she's at the Safe Point.

float currentHealthThreshold = 0.60
;Next threshold at which the Hagraven will teleport out.

;Markers to activate when the battle reaches each phase.
ObjectReference property Stage1ActivateMarker Auto
ObjectReference property Stage2ActivateMarker Auto
ObjectReference property Stage3ActivateMarker Auto

ObjectReference property SafePoint Auto
{A point outside the world we can always send the Hagraven to.}

ObjectReference property Stage0TeleportPoint Auto
{Location to teleport to for Phase 0 (Dining Room)}

ObjectReference property Stage1TeleportPoint Auto
{Location to teleport to for Phase 1 (Throne Hall)}

ObjectReference property Stage2TeleportPoint Auto
{Location to teleport to for Phase 2 (Ritual Chamber)}

ObjectReference property Stage3TeleportPoint Auto
{Location to teleport to for Phase 3 (Peak)}

Activator property TeleportFX Auto
{VFX used when the Hagraven teleports out.}

;On hit, check if we need to teleport out.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If (Self.GetActorValuePercentage("Health") < currentHealthThreshold && battleStage < 3 && battleStageActive)
		battleStageActive = False		;Set to false to prevent multiple triggers while the teleport process is ongoing.
		TeleportToSafePoint(False)	;Teleport out.
	EndIf
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if ((aeCombatState != 0) && battleStage == 3 && Self.GetAV("Health") > 0) ; 0 = not in combat, so non-zero means we entered combat
; 		;Debug.Trace("Activating")
		Stage3ActivateMarker.Activate(Self)
	EndIf
EndEvent

;If the player runs past the combat, teleport to the next location without the usual delays.
Function BypassCombat()
	if (battleStage < 3 && battleStageActive)
		battleStageActive = False		;Set to false to prevent multiple triggers while the teleport process is ongoing.
		TeleportToSafePoint(True)
	EndIf
EndFunction

;Teleport-To-Safety procedure.
Function TeleportToSafePoint(bool fastFade)
; 	;Debug.Trace("Teleporting to Safe Point")
	
	;Advance the combat stage.
	battleStage = battleStage + 1
	
	Self.SetGhost(True)	;Ghost to prevent further damage.
	
	;Play the teleport FX...
	Self.PlaceAtMe(TeleportFX)
	
	;...Fade out....
	if (Self.GetAV("Health") < 1)
		Self.Disable()
		Self.Resurrect()
		Self.ForceAV("Health", 1)
	Else
		Utility.Wait(0.25)
		Self.Disable()
	EndIf
	
	;Disable(True) is latent, so skip moving to the safe point if the next phase has already been triggered.
	if (!battleStageActive)
		Self.MoveTo(SafePoint)
	EndIf
	
	;Clean up.
	Self.Enable()
	Self.SetGhost(False)
EndFunction

;Move the Hagraven into position for the next combat.
Event SetupCombat()
; 	;Debug.Trace("Setup. BattleStage is: " + battleStage)
	if (battleStage == 0)
		;Debug.Notification("Error! Activated, waiting for battleStage, but battleStage = 0!")
	ElseIf (battleStage == 1)
; 		;Debug.Trace("Starting Phase #1")
		If (Self.GetActorValuePercentage("Health") < currentHealthThreshold)
			Self.ForceAV("Health", Self.GetBaseAV("Health") * 0.9)
		EndIf
		currentHealthThreshold = 0.45
		Self.MoveTo(Stage1TeleportPoint)
		Stage1ActivateMarker.Activate(Self)
	ElseIf (battleStage == 2)
; 		;Debug.Trace("Starting Phase #2")
		If (Self.GetActorValuePercentage("Health") < currentHealthThreshold)
			Self.ForceAV("Health", Self.GetBaseAV("Health") * 0.8)
		EndIf
		currentHealthThreshold = 0.25
		Self.MoveTo(Stage2TeleportPoint)
		Stage2ActivateMarker.Activate(Self)
	ElseIf (battleStage == 3)
; 		;Debug.Trace("Starting Phase #3")
		If (Self.GetActorValuePercentage("Health") < currentHealthThreshold)
			Self.ForceAV("Health", Self.GetBaseAV("Health") * 0.75)
		EndIf
		Self.MoveTo(Stage3TeleportPoint)
		;Don't trigger the Stage 3 Activator yet...
	EndIf
	
	;Update Variable06, which controls the Hagraven's packages at each point.
	Self.SetAV("Variable06", battleStage)
	Self.EvaluatePackage()
	
	;Battle is ready to go.
	battleStageActive = True
EndEvent


;Re-initialize variables and reset the Hagraven.
Event OnReset()
	battleStage = 0
	currentHealthThreshold = 0.60
	battleStageActive = True
	Stage1ActivateMarker.Disable()
	Stage2ActivateMarker.Disable()
	Stage3ActivateMarker.Disable()
	Self.Resurrect()
	Self.ForceAV("Health", Self.GetBaseAV("Health"))
	Self.SetAV("Variable06", battleStage)
	Self.MoveTo(Stage0TeleportPoint)
	Self.EvaluatePackage()
EndEvent