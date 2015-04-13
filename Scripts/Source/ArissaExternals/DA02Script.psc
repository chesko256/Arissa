Scriptname DA02Script extends Quest  Conditional

;<patch 1.4>
int property stage auto conditional
;</patch 1.4>

int Property ReasonGiven auto Conditional Hidden	;used in dialogue when Boethiah asks the player why he slayed someone at the shrine

ObjectReference Property DA02BoethiahShrineMapMarker Auto

Weapon Property DA02Dagger Auto
Book Property DA02Book Auto

Quest Property DA02KillObj auto
Quest Property DA02Post Auto

Scene Property DA02FightScene2 Auto
Scene Property DA02BoethiahScene1 Auto
Scene Property DA02BoethiahScene2 Auto
Scene Property DA02BoethiahArmorWornScene Auto
Scene Property DA02BoethiahElisifScene Auto

Scene Property DA02PillarTrapScene Auto

Faction Property DA02CultistsAreEnemies Auto
Faction Property DA02CulistsPlayerEnemy Auto

ReferenceAlias Property Fighter1 Auto
ReferenceAlias Property Fighter2 Auto
ReferenceAlias Property BoethiahsConduit Auto
ReferenceAlias Property Champion Auto

ReferenceAlias Property Cultist1 Auto
ReferenceAlias Property Cultist2 Auto
ReferenceAlias Property Cultist3 Auto
ReferenceAlias Property Cultist4 Auto
ReferenceAlias Property Cultist5 Auto

int conduitAggression	;so i can set it back... shouldn't matter at all since he's dead... but just in case.
int conduitAssistance	;so i can set it back... shouldn't matter at all since he's dead... but just in case.

;ReferenceAlias Property Contender1 Auto
;ReferenceAlias Property Contender2 Auto
;ReferenceAlias Property Contender3 Auto

Int Property FriendPresent Auto Hidden	;0 not set, 1 = friend is here, -1 = friend has left -- see DA02FriendCheckTriggerScript

int Property countCultists = 5 auto Hidden		;see incrementCountCultists() and decrementCountCultists() functions

;bool Property Contender1AwareOfPlayer Auto Hidden conditional		;set in OnUpdate() below, and used by packages on Aliases
;bool Property Contender2AwareOfPlayer Auto Hidden conditional
;bool Property Contender3AwareOfPlayer Auto Hidden conditional

int Property countContenders = 3 auto Hidden

Armor Property DA02Cuirass Auto

int Property foundMail Auto hidden conditional
int Property championDead Auto hidden conditional
int Property warnedChampion Auto Hidden Conditional  ;set in stage 21 - OBSOLETE

Faction Property WINoBodyCleanupFaction Auto
ReferenceAlias Property DeadFriend Auto

ObjectReference Property ShrineOfBoethiahRef Auto
ObjectReference Property DA02PillarRef Auto
ObjectReference Property FXShrineofBoethiaOrbRef Auto

int Property PillarTrappedVictim Auto Conditional	;used as condition on packages

VisualEffect Property DA02SummonValorTargetFX Auto

ImageSpaceModifier Property DA02ResurrectBlur Auto
ImageSpaceModifier Property DA02ResurrectBlurAnimated Auto

bool KilledFriend  ;a "doOnce"

;BLUE PALACE section: OBSOLETE
int Property GuardForcegreet auto hidden Conditional		;0 = unset, 1 = forcegreeted. set in dialogue.

Location Property SolitudeBluePalaceLocation Auto
ReferenceAlias Property GuardA auto
ReferenceAlias Property GuardB auto
ReferenceAlias Property GuardC auto
ReferenceAlias Property GuardD auto

LocationRefType Property DA02PalaceAttackTrigger Auto
LocationRefType Property DA02PalaceFollowTrigger Auto
LocationRefType Property DA02PalaceWarnTrigger Auto

int Property InOfflimitsArea auto hidden conditional		; >0 == true, set by processPalaceTrigger which is called by the PalaceXXXTrigger aliases script
int Property InWarnArea auto hidden conditional			; >0 == true, set by processPalaceTrigger which is called by the PalaceXXXTrigger aliases script
int Property InFollowArea auto hidden conditional			; >0 == true, set by processPalaceTrigger which is called by the PalaceXXXTrigger aliases script


bool PlayerKnownToBeInFollowArea		;at some point a guard has detected the player in an area he should be escorted. If no guard can detect hime before he's detected in an area he's allowed in alone, they send the alarm

int GuardDetectionPollingFrequency = 1 ;used by TestGuardDetection() as the parameter for a RegisterForSingleUpdate()

int secondsWithoutDetection				;how long the player has gone undetected while in a secure area
int secondsWithoutDetectionAllowed	= 10	;how many seconds the player can go without being detected while in a secure area before the guards freak out

Scene Property DA02GuardALostDetectionScene Auto		;the scene that plays when the player shakes his guard escort
Scene Property DA02SoundAlarmScene Auto	;scene that starts the guards attacking the player

Faction Property DA02GuardsPlayerEnemy Auto

int stageToStopPollingForDetection = 70	;at this stage or higher stop polling for detection (ie the player has already caused the alarm to go off, or has completed the mission

Quest Property DA02GuardWarn Auto		;makes the closest gaurd say the private area is offlimits, see TestGuardDetection()

ReferenceAlias Property FriendEscort Auto

int friendEscortDistance = 300		;how far can the player be away from his friend who is escorting him before the guards freak out

int Property NearEscort auto Hidden Conditional		;used by guard packages

scene Property DA02FriendEscortScene Auto		;scene where friend gets elisif to open the door for you

Key Property SolitudeBluePalaceServantsKey Auto

Faction Property DA02ElisifAfraidOfPlayer Auto



Event OnUpdate()
	if Game.GetPlayer().GetCurrentLocation() == SolitudeBluePalaceLocation
	
; 		debug.trace("DA02Script OnUpdate() player is in SolitudeBluePalaceLocation so test for guards detecting him.")
		TestGuardDetection()
	EndIf
EndEvent


Function PillarTrap(ObjectReference akActionRef)

; 	debug.trace("DA02Script PillarTrap() start")

	(akActionRef as Actor).setRestrained(true)
	ShrineOfBoethiahRef.playAnimation("playanim01")	;swirl
	FXShrineofBoethiaOrbRef.playAnimation("playanim02")	;bubble on - turned off in stage 12
	(DA02PillarRef as DefaultSoundControlScript).playSoundByName("BubbleActivate") ;oneshot, does not need to be stopped
	
	
	;DA02PillarRef.playAnimation("playanim01") - happens automatically now from callback from furniture .animation
	DeadFriend.ForceRefTo(akActionRef)
	PillarTrappedVictim = 1
	DA02PillarTrapScene.start()		;this is just to prevent the player from activating the Actor, and make him scared looking

	
	
;	int waitedFor
;	while DA02PillarTrapScene.isPlaying() == False
;		Utility.wait(1)
;		waitedFor += 1
; ;		debug.trace("DA02Script PillarTrap() waiting for scene for " + waitedFor)
;	EndWhile
;	
;	(akActionRef as actor).SetDoingFavor(false)	
	
; 	debug.trace("DA02Script PillarTrap() end")
	
EndFunction

Function PillarKill(Actor Victim)

	if KilledFriend == false
		killedFriend = true
		
; 		debug.trace("DA02Script PillarKill() start")

		Victim.kill(Game.GetPlayer())
		Victim.AddToFaction(WINoBodyCleanupFaction)

		DA02PillarRef.playAnimation("playanim02")
		(DA02PillarRef as DefaultSoundControlScript).playSoundByName("ShrineSurge")
	
		ShrineOfBoethiahRef.playAnimation("playanim04")	;particals and letters
	
		utility.wait(3)

		;*** KillPreviousConduit() - added 9/10 jduvall, fixes #68068
		killPreviousConduit()
		BoethiahsConduit.ForceRefTo(Victim)
	
		ShrineOfBoethiahRef.playAnimation("playanim05")	;stop particals, keep letters
	
		SetStage(11)
		
; 		debug.trace("DA02Script PillarKill() end")
	
	endif

	
EndFunction

Function PillarStop() ; called in stage 20

; 	debug.trace("DA02Script PillarStop() start")

	ShrineOfBoethiahRef.playAnimation("playanim03")
	DA02PillarRef.playAnimation("playanim03")
	FXShrineofBoethiaOrbRef.playAnimation("playanim01")	;bubble off
	
	(DA02PillarRef as DefaultSoundControlScript).stopSoundByName("ShrineSurge")
	
; 	debug.trace("DA02Script PillarStop() end")
	
EndFunction


function killPreviousConduit()
	
	Actor Conduit = BoethiahsConduit.GetActorReference()
	
	if Conduit
		Conduit.SetGhost(false)
		Conduit.kill(Game.GetPlayer())
	
	EndIf
	
EndFunction


function resurrectCounduit(ReferenceAlias AliasToMakeConduit = None)
{Sets up the conduit as ghost and so it won't try to kill the player when resurrected}
	

	actor Conduit

	if AliasToMakeConduit
		BoethiahsConduit.ForceRefTo(AliasToMakeConduit.GetActorReference())
	EndIf
	
	Conduit = BoethiahsConduit.GetActorReference()
	
	Conduit.SetGhost()	
	Conduit.StopCombat()
	Conduit.StopCombatAlarm()
	ConduitAggression = Conduit.GetAv("Aggression") as int
	ConduitAssistance = Conduit.GetAv("Assistance") as int
	Conduit.SetAv("Aggression", 0)
	Conduit.SetAv("Assistance", 0)

	
	;DA02ResurrectBlur.ApplyCrossFade(5)
	
	DA02ResurrectBlurAnimated.Apply()
	
	;as a failsafe if something bad happened and the Conduit is really far away, move him to the player
	if Conduit.GetDistance(Game.GetPlayer()) > 1000
	   Conduit.MoveTo(Game.GetPlayer())
	endif
	
	utility.wait(1)
	
	DA02SummonValorTargetFX.play(conduit, 10)
	utility.wait(0.5)
	conduit.Resurrect()
;	ImageSpaceModifier.RemoveCrossFade(1)
	(BoethiahsConduit as DA02BoethiahsConduitScript).startIMODs()
	
EndFunction

function releaseConduit()
{Unpacifies, unghosts the conduit, and kills it.}

	actor Conduit = BoethiahsConduit.GetActorReference()

	Conduit.SetGhost(false)
	Conduit.kill(Game.GetPlayer())
	Conduit.SetAv("Aggression", ConduitAggression)
	Conduit.SetAv("Assistance", ConduitAssistance)

	(BoethiahsConduit as DA02BoethiahsConduitScript).stopIMODs(CompletelyStop = True)
	
EndFunction

Function decrementCountCultists(ReferenceAlias DeadCultistAlias)
	countCultists -= 1
	
	checkDeadAndSetStage(DeadCultistAlias)

EndFunction

Function checkDeadAndSetStage(ReferenceAlias DeadCultistAlias)		;also called from DA02FighterScript

; 	debug.trace("DA02Script checkDeadAndSetStage(" + DeadCultistAlias + "): countCultists ==" + countCultists)
	if countCultists == 0
		;make sure the fighter aliases are all dead or not present -- NOTE: the reason they fighters have don't have the same cultist scripts that decrement the value is because there was more to them in earlier implementation
		if (Fighter1.GetActorReference().IsDead() || Fighter1.GetActorReference().GetDistance(Game.GetPlayer()) > 5000) && (Fighter2.GetActorReference().IsDead() || Fighter2.GetActorReference().GetDistance(Game.GetPlayer()) > 5000)
; 			debug.trace("DA02Script checkDeadAndSetStage(): countCultists == 0 and Fighter1 and Fighter2 are both dead or far away. Setting Stage 500")
			
			;*** KillPreviousConduit() - added 9/10 jduvall, fixes #68068
			killPreviousConduit()
			BoethiahsConduit.ForceRefTo(DeadCultistAlias.GetReference())
			
			setStage(17)
		EndIf
	EndIf
EndFunction


Function MakeCultistsAggressive()
; 	debug.trace("DA02Script MakeCultistsAggressive()")

	DA02FightScene2.stop()
	SetStage(6)	;unghosts and vulnerables the fighters
	
	Fighter1.GetActorReference().AddToFaction(DA02CulistsPlayerEnemy)
	Fighter2.GetActorReference().AddToFaction(DA02CulistsPlayerEnemy)

	Cultist1.GetActorReference().AddToFaction(DA02CulistsPlayerEnemy) 
	Cultist2.GetActorReference().AddToFaction(DA02CulistsPlayerEnemy)
	Cultist3.GetActorReference().AddToFaction(DA02CulistsPlayerEnemy)
	Cultist4.GetActorReference().AddToFaction(DA02CulistsPlayerEnemy)
	Cultist5.GetActorReference().AddToFaction(DA02CulistsPlayerEnemy)
	
EndFunction

function processPalaceTrigger(ObjectReference TriggerRef, Bool IsEntering)

	;No matter which ref type, the player should be followed
	if IsEntering
		InFollowArea += 1
	Else
		InFollowArea -= 1
	EndIf

	if TriggerRef.HasRefType(DA02PalaceWarnTrigger)
		if IsEntering
			InWarnArea += 1
		Else
			InWarnArea -= 1
		EndIf
	EndIf
			
	if TriggerRef.HasRefType(DA02PalaceAttackTrigger)
		if IsEntering
			InOfflimitsArea += 1
		Else
			InOfflimitsArea -= 1
		EndIf
	
	EndIf

	;DEBUG 
;	string debugString = "DA02Script: Player should be "
;		
;	if InFollowArea > 0
;		debugString += "FOLLOWED"
;	Else
;		debugString += "NOT FOLLOWED"
;	EndIf
;	
;	if InWarnArea > 0
;		debugString += ", WARNED"
;	Else	
;		debugString += ", NOT WARNED"
;	EndIf
;	
;	if InOfflimitsArea > 0
;		debugString += ", ATTACKED"
;	Else
;		debugString += ", NOT ATTACKED"
;	EndIf
; ;	debug.trace(debugString)

	;test for detection by the guards
	TestGuardDetection()
	
EndFunction

function TestGuardDetection()
	if GetStage() >= stageToStopPollingForDetection
; 		debug.trace("DA02Script: TestGuardDetection() quest stage(" + GetStage() + ") >= stageToStopPollingForDetection(" + stageToStopPollingForDetection + "). Returning early without processing detection.")
		Return 
	EndIf

	Actor GuardActorA = GuardA.GetActorReference()
	Actor GuardActorB = GuardB.GetActorReference()
	Actor GuardActorC = GuardC.GetActorReference()
	Actor GuardActorD = GuardD.GetActorReference()
	
	Actor PlayerActor = Game.GetPlayer() as Actor
	Actor FriendEscortActor = FriendEscort.GetActorReference()
	
	
	;*** TO DO: EDIT THIS TO NOT CARE IF THE PLAYER IS CURRENTLY BEING ESCORTED BY A FRIEND WHO BELONGS IN THE PALACE
	
	if FriendEscortActor != None && PlayerActor.getDistance(FriendEscortActor) <= friendEscortDistance
		NearEscort = 1
; 		debug.trace("DA02Script: TestGuardDetection() player is nearby his friend escort, so the guards don't care.")
	
	else
		NearEscort = 0
		
		if PlayerActor.IsDetectedBy(GuardActorA) || PlayerActor.IsDetectedBy(GuardActorB) || PlayerActor.IsDetectedBy(GuardActorC) || PlayerActor.IsDetectedBy(GuardActorD)
			
			secondsWithoutDetection = 0
			
			if InFollowArea 	;player is in an area where he needs an escort
				PlayerKnownToBeInFollowArea = true
; 				debug.trace("DA02Script: TestGuardDetection() one of the guards detects the player after he has ENTERED a trigger box.")
			
			Else	;player not in follow area
				PlayerKnownToBeInFollowArea = False
; 				debug.trace("DA02Script: TestGuardDetection() one of the guards detects the player after he has LEFT a trigger box.")		
			
			EndIf
			
			if InWarnArea 	;player is in an area where he needs an escort
; 				debug.trace("DA02Script: TestGuardDetection() one of the guards detects the player after he has ENTERED a warn area trigger box, starting DA02GuardWarn quest scene.")
				DA02GuardWarn.start()
				
			EndIf
			
			if InOfflimitsArea 	;player is in an area where he isn't allowed
; 				debug.trace("DA02Script: TestGuardDetection() player is detected and InOfflimitsArea, SOUND THE ALARM!")		
				DA02SoundAlarmScene.start()
				
			EndIf
			
			
		Elseif PlayerKnownToBeInFollowArea 	;then it means he has escaped notice of someone that was keeping an eye on him, sound the alarm
			secondsWithoutDetection += 1
			
; 			debug.trace("DA02Script: TestGuardDetection() secondsWithoutDetection ==" + secondsWithoutDetection)	
					
			if secondsWithoutDetection > secondsWithoutDetectionAllowed
; 				debug.trace("DA02Script: TestGuardDetection() secondsWithoutDetection(" + secondsWithoutDetection + ") > secondsWithoutDetectionAllowed(" + secondsWithoutDetectionAllowed +") SOUND THE ALARM!")		
				DA02SoundAlarmScene.start()
				
			Else
				if DA02GuardALostDetectionScene.IsPlaying() == False
					DA02GuardALostDetectionScene.start()
				EndIf
		
			EndIf
			
		EndIf
	
	EndIf
	
	GuardActorA.EvaluatePackage()
	GuardActorB.EvaluatePackage()
	GuardActorC.EvaluatePackage()
	GuardActorD.EvaluatePackage()

	RegisterForSingleUpdate(GuardDetectionPollingFrequency)
	
EndFunction

function promoteToFriendEscort(Actor FriendActor)
	FriendEscort.ForceRefTo(FriendActor)
	
EndFunction

function soundAlarm(ObjectReference ObjectAtWhichToCreateDetectionEvent)
	GuardA.GetActorReference().AddToFaction(DA02GuardsPlayerEnemy)
	GuardB.GetActorReference().AddToFaction(DA02GuardsPlayerEnemy)
	GuardC.GetActorReference().AddToFaction(DA02GuardsPlayerEnemy)
	GuardD.GetActorReference().AddToFaction(DA02GuardsPlayerEnemy)
	
	ObjectAtWhichToCreateDetectionEvent.CreateDetectionEvent(Game.GetPlayer() as actor, 100)
	
EndFunction

function givePlayerServantsKey(Actor ActorGivingKey)
	ActorGivingKey.RemoveItem(SolitudeBluePalaceServantsKey)
	Game.GetPlayer().AddItem(SolitudeBluePalaceServantsKey)

EndFunction
