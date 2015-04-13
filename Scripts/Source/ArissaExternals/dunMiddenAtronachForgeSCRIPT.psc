scriptName dunMiddenAtronachForgeSCRIPT extends ObjectReference
{toy for the midden - player can use void salts to spawn elemental atronachs}

objectReference property OfferingBox auto
{container into which player can deposit salts to determine atronach type}
objectReference property conjureLocation auto
{Marker from which we spawn the atronachs}
objectReference property MasterSpear auto
{spear which is activate parent to others that make up the gate}
ingredient property firesalts auto
ingredient property voidsalts auto
ingredient property frostsalts auto
spell property flameAtronach auto
spell property stormAtronach auto
spell property frostAtronach auto
actorbase property deadSkeever auto
explosion property failureExplosion auto

objectReference property castingNPC auto
{need somebody to be the "owner" of the atronachs}

actorbase property fireActor auto
actorbase property voidActor auto
actorbase property frostActor auto


spell property DEBUGSPELL auto


; just script variables here, not properties
bool fireSaltsDeposited = false
bool voidSaltsDeposited = false
bool frostSaltsDeposited = false
spell atronach
form salts
bool spearsUp = false
; next one is theoretically temp:
actorBase AtroActor
objectReference activeSummon

EVENT onInit()
	;offeringBox.setMotionType(Motion_Fixed)
	fireSaltsDeposited = false
	voidSaltsDeposited = false
	frostSaltsDeposited = false
	gotoState("ready")
; 	debug.trace("Atronach Forge Initialized!")		
	endEVENT

STATE ready
	EVENT onBeginState()
; 		debug.trace("Atronach forge is ready")
		if spearsUp == true
			MasterSpear.activate(MasterSpear)
			spearsUp = false
		endif
	endEVENT
	
	EVENT onActivate(objectReference actronaut)
		gotoState ("busy")
		utility.wait(3.0) ; give the gates time to close up first
		
		int saltIndex = 0			; track how many types of salts are present
		if offeringBox.getItemCount(fireSalts) >= 1
			fireSaltsDeposited = true
			saltIndex += 1
		endif
		if offeringBox.getItemCount(voidSalts) >= 1
			voidSaltsDeposited = true
			saltIndex += 1
		endif
		if offeringBox.getItemCount(frostSalts) >= 1
			frostSaltsDeposited = true
			saltIndex += 1
		endif
		
		if saltIndex == 0
			; no salts were present - dump out.
; 			debug.trace("no salt in atronach forge. fail")
		elseif saltIndex > 1
			; salts were mixed, failed experiment.  Spit out a dead Skeever
			; NOTE - maybe change this out for a list of funny dead things
			; NOTE - maybe if all three salts, something REALLY nasty comes out, like a dremora
; 			debug.trace("too many types of salt in atronach forge. Fail")
			objectReference failedExperiment 
			getLinkedRef().placeAtMe(failureExplosion, 1, false)
			failedExperiment = getLinkedRef().placeAtMe(deadSkeever, 1, false)
			(failedExperiment as actor).kill()
			(failedExperiment as actor).removeAllItems() ;no free loot here!
			offeringBox.RemoveItem(firesalts, (offeringBox.getItemCount(firesalts)), true)
			offeringBox.RemoveItem(voidsalts, (offeringBox.getItemCount(voidsalts)), true)
			offeringBox.RemoveItem(frostsalts, (offeringBox.getItemCount(frostsalts)), true)
			if activeSummon != NONE
					(activeSummon as actor).kill()
			endif
		elseif saltIndex == 1		
			; in this case, only one type of salt could have been present, so conjure corresponding atronach
			; also remove all salts of that type.  Player gets no benefit from piling in a lot of salt!
			if fireSaltsDeposited == true
				atronach = flameAtronach
				salts = firesalts
				atroActor = fireActor
			elseif voidSaltsDeposited == true
				atronach = stormAtronach
				salts = voidsalts
				atroActor = voidActor
			elseif frostSaltsDeposited == true
				atronach = frostAtronach
				salts = frostSalts
				atroActor = frostActor
			endif
				; ---------------
				; NOTE!!!
				;--------------
				; temporarily using placeAtMe().  Want to discuss w/Grant & Steve best way to do this...
				if activeSummon != NONE
					(activeSummon as actor).kill()
				endif
				
				DEBUGSPELL.CAST(castingNPC, game.getplayer())
				;activeSummon = conjureLocation.placeAtMe(atroActor, 1, TRUE)
				;(activeSummon as actor).startCombat(actronaut as actor)	; aggro on whomever summoned me
				
				;"now that the variables have been set, do the business:
; 				;debug.trace("casting " + atronach + " with " + salts + "from " + conjureLocation)
				;atronach.cast(conjureLocation);, conjureLocation.getLinkedRef())				
				; vaporize all the salts in the offering canister
				offeringBox.RemoveItem(salts, (offeringBox.getItemCount(salts)), true)
				
		endif
		
		; now go ahead and wait a couple seconds and reset the device
		utility.wait(3.0)
; 		debug.trace("begin clearing out the atronach forge script")
		saltIndex = 0
		fireSaltsDeposited = false
		voidSaltsDeposited = false
		frostSaltsDeposited = false
		gotoState("ready")
	endEVENT
endSTATE


STATE busy
	; do nothing in this state until "ready" state clears
	EVENT onBeginState()
; 		debug.trace("Atronach forge is busy")
		MasterSpear.activate(masterSpear)
		spearsUp = true
	endEVENT
endSTATE