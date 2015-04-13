Scriptname MQ301Script extends Quest  Conditional

event OnUpdate()
	if DragonAttackStage > 0 && DragonAttackStage < 5
		; watch for Odahviing to be "down" (hurt, not flying)
		if DragonAttackStage < 4 && Alias_Odahviing.GetActorRef().IsDisabled()==0 && (Alias_Odahviing.GetActorRef().GetFlyingState()== 0 || Alias_Odahviing.GetActorRef().IsBleedingOut()== 1)
; 			debug.trace(self+"OnUpdate: GetFlyingState=" + Alias_Odahviing.GetActorRef().GetFlyingState() + ", IsBleedingOut()=" + Alias_Odahviing.GetActorRef().IsBleedingOut())
			AdvanceDragonAttackScene(4)
		endif
		
		; reset attack scene if player not in Dragonsreach
		if Game.GetPlayer().IsInLocation(DragonsreachLocation) == 0
			ResetDragonAttackScene()
		endif

	endif
	
endEvent



bool function CallOdahviingToDragonsreach()
; 	Debug.Trace("MQ301Script: Calling Odahviing")
	bool bSuccess = false
	; this is a failsafe, in case the player calls Odahviing again without leaving the porch
	if DragonAttackStage == 0
		; if player is in Dragonsreach, this is fine
		if Game.GetPlayer().IsInLocation(DragonsreachLocation) == 1 && GetStageDone(120)
			StartDragonAttackScene()
			bSuccess = true
		endif
	endif

	; if ready to advance, go for it
	if DragonAttackStage > 0
; 		Debug.Trace("MQ301Script: Calling Odahviing - scene is running. DragonAttackStage = " + DragonAttackStage)
		; update scene stage
		AdvanceDragonAttackScene(2)
		bSuccess = true
	endif
	return bSuccess
endFunction

function StartDragonAttackScene()
; 	Debug.Trace("MQ301Script: StartDragonAttackScene")
	AdvanceDragonAttackScene(1)
endFunction

bool function AdvanceDragonAttackScene(int newStage)
	bool success = false

; 	Debug.Trace("MQ301Script: AdvanceDragonAttackScene to stage " + newStage + ", current stage = " + DragonAttackStage)
	if newStage == -1
		ResetDragonAttackScene()
	elseif newStage == 1
		if DragonAttackStage == 0
			success = true
; 			Debug.Trace("MQ301Script: AdvanceDragonAttackScene - advancing to stage 1")
			; make sure MQCallDragon isn't running
			if MQCallDragon.IsRunning()
				MQCallDragon.Stop()
			endif
			Alias_Odahviing.GetRef().Disable()
			Alias_Odahviing.GetRef().MoveTo(OdahviingStartMarker)
			Alias_Odahviing.GetActorRef().GetLeveledActorBase().SetInvulnerable(false)
			DragonAttackStage = 1
			DragonAttackScene.Start()
		endif
	elseif newStage == 2
		if DragonAttackStage == 1
			success = true
; 			Debug.Trace("MQ301Script: AdvanceDragonAttackScene - advancing to stage 2")
			; enable Odahviing
			; try inserting a wait here
			utility.wait(10)
			Alias_Odahviing.GetRef().Enable()
			; reset shout timer
			Game.GetPlayer().SetVoiceRecoveryTime( 0 )
			SetStage(150)
			DragonAttackStage = 2
		endif
	elseif newStage == 3
		if DragonAttackStage < 3
			success = true
			; Odahviing becomes hostile (finishes initial pass or aggros on player)
; 			Debug.Trace("MQ301Script: AdvanceDragonAttackScene - advancing to stage 3")
			DragonAttackStage = 3
			DragonFaction.SetEnemy(PlayerFaction)
			DragonFaction.SetEnemy(SoldierFaction)
			TempResetFactions()
; 			Debug.Trace("MQ301Script: AdvanceDragonAttackScene - Odahviing should now be enemy of player and soldiers")
			Alias_Odahviing.GetActorRef().StartCombat(Game.GetPlayer())
		endif
	elseif newStage == 4
		if DragonAttackStage == 3
			success = true
			; Odahviing is "down" (landed)
; 			Debug.Trace("MQ301Script: AdvanceDragonAttackScene - advancing to stage 4")
			DragonAttackStage = 4
			; TEMP - make him unable to fly - until essential healing bug is fixed
			Alias_Odahviing.GetActorRef().SetAllowFlying(false)
			; Soldiers should no longer attack Odahviing
			SoldierFaction.SetAlly(DragonFaction)
			TempResetFactions()
			Alias_Odahviing.GetActorRef().StopCombatAlarm()
			; make sure he's still attacking player
			Alias_Odahviing.GetActorRef().StartCombat(Game.GetPlayer())
; 			Debug.Trace("MQ301Script: AdvanceDragonAttackScene - Odahviing should now be ally of soldiers")
		endif
	elseif newStage == 5
		;if DragonAttackStage == 4
			success = true
			; Odahviing has entered the trap
; 			Debug.Trace("MQ301Script: AdvanceDragonAttackScene - advancing to stage 5")
			DragonAttackStage = 5
			SetStage(180)
		;endif
	elseif newStage == 6
		if DragonAttackStage == 5
			success = true
			; Odahviing is trapped
; 			Debug.Trace("MQ301Script: AdvanceDragonAttackScene - advancing to stage 6")
			DragonAttackStage = 6
			; reset faction status to neutral
			DragonFaction.SetEnemy(PlayerFaction, true, true)
			DragonFaction.SetEnemy(SoldierFaction, true, true)
			TempResetFactions()
		endif
	else
; 		Debug.Trace("MQ301Script: AdvanceDragonAttackScene ELSE, current stage = " + DragonAttackStage)
	endif
; 	Debug.Trace("MQ301Script: AdvanceDragonAttackScene END, current stage = " + DragonAttackStage)

	return success
endFunction

; called when the dragon attack scene ends
function ResetDragonAttackScene()
	if DragonAttackStage < 5
; 		Debug.Trace("MQ301Script: ResetDragonAttackScene")
		; stop scene
		DragonAttackStage = 0
		DragonAttackScene.Stop()
		; put triggers back in waiting state
		(MQ301StartDragonAttackTRIG as MQ301StartDragonAttackTrigScript).ResetScene()
		; reset faction status to neutral
		DragonFaction.SetEnemy(PlayerFaction, true, true)
		DragonFaction.SetEnemy(SoldierFaction, true, true)
		; TEMP - reset allow flying
		Alias_Odahviing.GetActorRef().SetAllowFlying(true)
		; make him invulnerable again
		Alias_Odahviing.GetActorRef().GetLeveledActorBase().SetInvulnerable(true)
; 		Debug.Trace("MQ301Script: AdvanceDragonAttackScene - Odahviing should now be neutral to player and soldiers")
		; Disable Odahviing and put back at start location
		Alias_Odahviing.GetRef().Disable()
		Alias_Odahviing.GetRef().MoveTo(OdahviingStartMarker)
	endif
endFunction

; temp function to encapsulate changing faction allegiance until bug is fixed
function TempResetFactions()
	Alias_Jarl.GetActorRef().AddToFaction(DragonFaction)
	Alias_Jarl.GetActorRef().RemoveFromFaction(DragonFaction)
	Alias_Soldier1.GetActorRef().AddToFaction(DragonFaction)
	Alias_Soldier1.GetActorRef().RemoveFromFaction(DragonFaction)
	Alias_Soldier2.GetActorRef().AddToFaction(DragonFaction)
	Alias_Soldier2.GetActorRef().RemoveFromFaction(DragonFaction)
	Alias_Soldier3.GetActorRef().AddToFaction(DragonFaction)
	Alias_Soldier3.GetActorRef().RemoveFromFaction(DragonFaction)
	Game.GetPlayer().AddToFaction(DragonFaction)
	Game.GetPlayer().RemoveFromFaction(DragonFaction)
	Alias_Odahviing.GetActorRef().AddToFaction(PlayerFaction)
	Alias_Odahviing.GetActorRef().RemoveFromFaction(PlayerFaction)
endFunction



ObjectReference Property OdahviingStartMarker  Auto  

Scene Property DragonAttackScene  Auto  

Location Property DragonsreachLocation Auto

int Property DragonAttackStage = 0 Auto  Conditional
{tracks the progress of the dragon attack scene
0 = off
1 = waiting for player to call dragon
2 = dragon on initial pass
3 = dragon attacking
4 = dragon "down"
5 = dragon in the trap
6 = dragon trapped
}

ReferenceAlias property Alias_Odahviing Auto

ObjectReference Property MQ301StartDragonAttackTRIG  Auto  

Faction property DragonFaction Auto

Faction property PlayerFaction Auto

Faction Property SoldierFaction  Auto  

ReferenceAlias Property Alias_Jarl  Auto  

ReferenceAlias Property Alias_Soldier1  Auto  

ReferenceAlias Property Alias_Soldier2  Auto  

ReferenceAlias Property Alias_Soldier3  Auto  

FavorDialogueScript Property DialogueFavorGeneric  Auto  

Quest Property MQCallDragon  Auto  
