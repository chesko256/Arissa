scriptName dunFellglowBossBattle extends Actor
{ Boss Battle script for MG03's Fellglow Keep Caller battle. Placed on the Caller base object.}

;MG03, quest for Fellglow Keep.
Quest property MG03 Auto

;The two initial atronachs 'summoned' by the Caller.
ObjectReference property Atronach1 auto
ObjectReference property Atronach2 auto

;Orthorn
ReferenceAlias property OrthornRef auto

;Formlist of Atronachs for search during the teleport process.
FormList property AtronachList auto

;VFX for the teleport process.
Activator property SummonFX Auto

;Teleport/Summon locations.
ObjectReference property SummonPad1 Auto ;Left Rear
ObjectReference property SummonPad2 Auto ;Right Rear
ObjectReference property SummonPad3 Auto ;Center

;Keys and barred door Orthorn needs to path through.
Key property CallersKey Auto
Objectreference property FrontDoor Auto
Objectreference property Bar Auto

;Door the player entered by.
ObjectReference property EntryDoor Auto

;ActivateParent of the activators used to banish the Atronachs when the Caller is killed.
ObjectReference property BanishActivator Auto

;Internal variables:
bool combatStarted							;Has the player entered combat with the Caller?
ObjectReference AtronachForSwap			;During teleport, which Atronach are we swapping with?

;Teleport limiters:
float lastTeleportTime = 0.0 	;When did she last teleport?
float teleportMinDelay = 5.0		;Minimum time between teleports.
float healthThreshold = 0.8		;Boss teleports only after losing this much health.


;When combat starts, 'summon' in the Atronachs and update the quest.
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if ((aeCombatState != 0) && (!combatStarted)) ; 0 = not in combat, so non-zero means we entered combat
		;Make sure this only happens once.
		combatStarted = True

		;Lock the door.
		EntryDoor.Lock(True)
		
		;Update quest stages.
		MG03QuestScript MG03Script = MG03 as MG03QuestScript
		MG03Script.MG03CallerFactionSwap=1
		MG03Script.BossFight()
		
		;Summon in the Atronachs (they have their own script to handle VFX).
		Atronach1.Activate(Self)
		
		if (Game.GetPlayer().GetLevel() >= 15)
			Atronach2.Activate(Self)
		EndIf
	EndIf
EndEvent


;After [hitMinTimes] hits, if [teleportMinDelay] has passed since the last teleport, teleport again.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (Self.GetAVPercentage("Health") < healthThreshold && (Utility.GetCurrentRealTime() - lastTeleportTime > teleportMinDelay) && !Self.IsDead())
		healthThreshold = healthThreshold - 0.2
		lastTeleportTime = Utility.GetCurrentRealTime()
		Teleport()
	EndIf
EndEvent


;When triggered (see above), the Caller teleports to a new position, swapping places with another Atronach in the room (if any).
Event Teleport()
	AtronachForSwap = None
	if (!(Atronach1 As Actor).IsDead() && !(Atronach1.IsDisabled()))
		AtronachForSwap = Atronach1
	EndIf
	If (!(Atronach2 As Actor).IsDead() && !(Atronach2.IsDisabled()))
		AtronachForSwap = Atronach2
		Atronach2 = Atronach1
		Atronach1 = AtronachForSwap
	EndIf
			
	;Which spot is closest to the player? We won't use that one. Do some inefficient and crude distance sorting.
	ObjectReference tmp
	if (SummonPad1.GetDistance(Game.GetPlayer()) < SummonPad3.GetDistance(Game.GetPlayer()))
		tmp = SummonPad1
		SummonPad1 = SummonPad3
		SummonPad3 = tmp
	EndIf
	if (SummonPad2.GetDistance(Game.GetPlayer()) < SummonPad3.GetDistance(Game.GetPlayer()))
		tmp = SummonPad2
		SummonPad2 = SummonPad3
		SummonPad3 = tmp
	EndIf
	
	ObjectReference newCallerPosition
	if (SummonPad1.GetDistance(Self) < 512)
		newCallerPosition = SummonPad2
	ElseIf (SummonPad2.GetDistance(Self) < 512)
		newCallerPosition = SummonPad1
	Else
		;Pick randomly between the other two.
		int spot = Utility.RandomInt(1, 2)
		if (spot == 1)
			newCallerPosition = SummonPad1
		Else
			newCallerPosition = SummonPad2
		EndIf
	EndIf
	
	;Remove any ongoing spell effects.
	Self.DispelAllSpells()

	;Double-check and make sure the Caller isn't dead.
	if (Self.GetAV("Health") > 0)
		;Perform the swap.
		Self.SetGhost(True)
		Self.PlaceAtMe(SummonFX)
		AtronachForSwap.PlaceAtMe(SummonFX)
		Utility.Wait(0.25)
		Self.Disable()
		AtronachForSwap.Disable()
		
		AtronachForSwap.MoveTo(Self)
		Self.MoveTo(newCallerPosition)
		Self.PlaceAtMe(SummonFX)
		Utility.Wait(0.25)
		Self.SetGhost(False)

		Self.Enable()
		Self.StartCombat(Game.GetPlayer())
		AtronachForSwap.Enable(True)
		(AtronachForSwap As Actor).StartCombat(Game.GetPlayer())
	EndIf
EndEvent


;When the Caller dies, put the key on her corpse and dispel her Atronachs.
;The key isn't on her prior to this point to avoid awkward edge cases in which the player can get out (or worse, pull her out).
Event OnDeath(Actor akKiller)
	Self.AddItem(CallersKey, 1, True)
	FrontDoor.Lock(False)
	if (!OrthornRef.GetActorRef().IsDead())
		OrthornRef.GetActorRef().AddItem(CallersKey, 1, True)
		;Actually, don't set the bar position because the bar can't animate if the cell isn't loaded.
; 		;Debug.Trace("SETTING BAR POSITION: " + bar)
		;(bar as DoorBar).SetBarPosition(True)
	EndIf
	;Use a chain of activations to fork off the latent Banish() calls.
	BanishActivator.Activate(Self)
EndEvent
