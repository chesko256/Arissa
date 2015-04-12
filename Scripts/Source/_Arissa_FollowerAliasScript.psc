ScriptName _Arissa_FollowerAliasScript extends ReferenceAlias

Faction property _ArissaFollowerFaction auto
GlobalVariable property _Arissa_DebugVar auto
GlobalVariable property _Arissa_CurrentHold auto
GlobalVariable property _Arissa_Setting_AllowAnnounceNewArea auto
Quest property _Arissa_Commentary_AnnounceArea auto
Armor property _Arissa_ClothingTownBody auto
_Arissa_iNPC_Behavior property iNPCSystem auto
Quest property _Arissa_MQ02 auto
Location property MilitaryCampHaafingarSonsLocation auto
Message property _Arissa_CantEquip auto
Package property _Arissa_AvoidPlayer auto

import _ArissaDebugScript

Location old_location
bool was_interior

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if iNPCSystem.iNPC.GetActorRef().GetCurrentPackage() == _Arissa_AvoidPlayer
			;debug.notification("In Soviet Skyrim, Arissa activate you!")
			iNPCSystem.iNPC.GetActorRef().EvaluatePackage()
			;Try again
			iNPCSystem.iNPC.GetActorRef().Activate(Game.GetPlayer())
		EndIf
	EndIf
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akSourceContainer == Game.GetPlayer()
		if !(akBaseItem as Weapon) && !(akBaseItem as Armor) && !(akBaseItem as Ammo) && !(akBaseItem as Light) && !(akBaseItem as Potion)
			_Arissa_CantEquip.Show()
			if akItemReference != none
				Game.GetPlayer().AddItem(akItemReference, aiItemCount, abSilent = true)
			else
				Game.GetPlayer().AddItem(akBaseItem, aiItemCount, abSilent = true)
				self.GetActorRef().RemoveItem(akBaseItem, aiItemCount)
			EndIf

		EndIf
	endif
endEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	SetHold()

	if was_interior && !(self.GetActorRef().IsInInterior())
		; skip comments when exiting buildings
		ArissaDebug(4, "Arissa moved from interior to exterior, skip comment.")
	else
		if (akNewLoc) && (akNewLoc != akOldLoc) && (_Arissa_Setting_AllowAnnounceNewArea.GetValueInt() == 2)
			AnnounceArea(akNewLoc)
		endif
	endif

	if akNewLoc == MilitaryCampHaafingarSonsLocation && !_Arissa_MQ02.IsRunning() && !_Arissa_MQ02.IsCompleted()
		_Arissa_MQ02.Start()
	endif

	;GetName requires SKSE
	if akOldLoc && akNewLoc
		ArissaDebug(4, "Arissa moved from " + akOldLoc.GetName() + " to " + akNewLoc.GetName())
	elseif akOldLoc && !akNewLoc
		ArissaDebug(4, "Arissa moved from " + akOldLoc.GetName() + " to NONE.")
	elseif !akOldLoc && akNewLoc
		ArissaDebug(4, "Arissa moved from NONE to " + akNewLoc.GetName())
	else
		ArissaDebug(4, "Arissa moved from NONE to NONE.")
	endif

	if self.GetActorRef().IsInInterior()
		was_interior = true
	else
		was_interior = false
	endif

endEvent

Event OnUpdateGameTime()
	self.GetActorRef().UnregisterForUpdateGameTime()
	If Self.GetActorRef().GetAv("WaitingforPlayer") != 0
		ArissaDebug(4, "Arissa is waiting and 2 days have passed.")
		iNPCSystem.FinishWaiting()
	EndIf
EndEvent

Event OnUnload()
	;If Arissa unloads, wait 2 days before going home.
	If Self.GetActorRef().GetAv("WaitingforPlayer") == 1
		ArissaDebug(4, "Arissa is unloaded, waiting 2 days before going home.")
		RegisterForUpdateGameTime(48)
	EndIf
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	
	If akTarget == Game.GetPlayer() && iNPCSystem.IsFollowing == true
		iNPCSystem.iNPC.GetActorRef().IgnoreFriendlyHits()
	endif
	;/
		ArissaDebug(4, "Arissa is dismissed because she is attacking the player.")
		iNPCSystem.Dismiss()
		iNPCSystem.DecreaseRegardMinor()
		if iNPCSystem.PlayerAssessmentRegard >= -5.0
			
		EndIf
	EndIf
	/;
EndEvent

Event OnDeath(Actor akKiller)
	ArissaDebug(4, "Arissa is dismissed because the player killed her.")
	Self.GetActorRef().SetFactionRank(_ArissaFollowerFaction, -1)
	Self.Clear()
	iNPCSystem.Dismiss()
EndEvent

Location myHold
													;Hold ID Decoder Ring (0 = none / unknown)
Location property EastmarchHoldLocation auto		;1
Location property FalkreathHoldLocation auto		;2
Location property HaafingarHoldLocation auto		;3
Location property HjaalmarchHoldLocation auto		;4
Location property PaleHoldLocation auto				;5
Location property ReachHoldLocation auto			;6
Location property RiftHoldLocation auto				;7
Location property WhiterunHoldLocation auto			;8
Location property WinterholdHoldLocation auto		;9

function SetHold()
	if self.GetActorRef().IsInLocation(EastmarchHoldLocation)
		_Arissa_CurrentHold.SetValueInt(1)
	elseif self.GetActorRef().IsInLocation(FalkreathHoldLocation)
		_Arissa_CurrentHold.SetValueInt(2)
	elseif self.GetActorRef().IsInLocation(HaafingarHoldLocation)
		_Arissa_CurrentHold.SetValueInt(3)
	elseif self.GetActorRef().IsInLocation(HjaalmarchHoldLocation)
		_Arissa_CurrentHold.SetValueInt(4)
	elseif self.GetActorRef().IsInLocation(PaleHoldLocation)
		_Arissa_CurrentHold.SetValueInt(5)
	elseif self.GetActorRef().IsInLocation(ReachHoldLocation)
		_Arissa_CurrentHold.SetValueInt(6)
	elseif self.GetActorRef().IsInLocation(RiftHoldLocation)
		_Arissa_CurrentHold.SetValueInt(7)
	elseif self.GetActorRef().IsInLocation(WhiterunHoldLocation)
		_Arissa_CurrentHold.SetValueInt(8)
	elseif self.GetActorRef().IsInLocation(WinterholdHoldLocation)
		_Arissa_CurrentHold.SetValueInt(9)
	else
		_Arissa_CurrentHold.SetValueInt(0)
	endif
endFunction

function AnnounceArea(Location akLocation)
	if _Arissa_Setting_AllowAnnounceNewArea.GetValueInt() == 2
		debug.trace("[Arissa] Attempting to play ambient dialogue...")
		iNPCSystem.PlayAmbientDialogue(akLocation)
	EndIf
endFunction

function ArissaDebug(int iClassification, string sDebugMessage)
	;1 = Regard updates, status changes
	;2 = Quest state data
	;3 = Scene data
	;4 = Other
	if _Arissa_DebugVar.GetValueInt() == iClassification
		debug.trace("[ARISSA] " + sDebugMessage)
	endif
endFunction