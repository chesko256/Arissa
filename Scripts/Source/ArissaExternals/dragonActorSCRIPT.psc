scriptname dragonActorSCRIPT extends actor
{Base Actor Script for all Dragons}
; _____________
;|			    |
;|    SETUP    |
;|_____________|
ImageSpaceModifier property dragonFOVfx auto
{FX played for various impacts in dragon combat}
float property deathFXrange = 1024.0 auto
{max range to play death FX on player}
quest property MQkillDragon auto
{used to invoke deathSequence() function in MQKillDragonScript.psc}
actor property player auto hidden
{For quick reference and clean-looking script}
float property FOVfalloff auto hidden
{choosing not to expose this and clutter the prop list in CS, since it won't be touched often}
sound property NPCDragonFlyby auto
{Sound played when dragon passes by a target}
explosion property knockBackExplosion auto
{explosion used to knock back enemies}
; NOTE - the dragon breed/skin settings are deprecated and have no effect.
armor property SnowDragonSkin auto
{deprecated - do not use}
armor property TundraDragonSkin auto
{deprecated - do not use}
armor property forestDragonSkin auto
{deprecated - do not use}
int property dragonBreed = 0 auto
{deprecated - do not use}

WIFunctionsScript Property WI Auto		;added by jduvall
{Pointer to WIFunctionsScript on WI quest. Used to create script event to get nearby NPCs to react to the death of the dragon}

ImpactDataSet Property FXDragonTakeoffImpactSet Auto
{Impact data set to use for the dragon takeoff}
ImpactDataSet Property FXDragonLandingImpactSet Auto
{Impact data set to use for the dragon landing}
ImpactDataSet Property FXDragonTailstompImpactSet Auto
{Impact data set to use for the tailstomp}

; _____________
;|			    |
;|    EVENTS   |
;|_____________|
	EVENT onInit()
		; just initialize any variables, etc.
		player = game.getPlayer()				; store player reference
		FOVfalloff = 1600				; range at which impact doesn't play FOV
		
		if deathFXrange == 0
			deathFXrange = 1000
		endif
		
		if !isDead() && isGhost()
			; redundancy check to prevent invincible, "ghosted" dragons from respawning.
			setGhost(FALSE)
		endif
		
		gotoState("alive")
	endEVENT
	
	EVENT onReset()
		; if we're resetting a previously-killed dragon, make sure it's not a ghost.
		setGhost(FALSE)
	endEVENT
	
	EVENT onLoad()
		; change markings based on breed of this dragon
		; first, support random selection
		; if dragonBreed == 4
			; dragonBreed = utility.randomInt(0,3)
		; endif
		; then assign the markings, either way.
		; if dragonBreed == 1
			; equipItem(snowDragonSkin)
		; elseif dragonBreed == 2
			; equipItem(tundraDragonSkin)
		; elseif dragonBreed == 3
			; equipItem(forestDragonSkin)
		; endif
		
		if !isDead() && isGhost()
			; redundancy check to prevent invincible, "ghosted" dragons from respawning.
			setGhost(FALSE)
		endif
		
		registerForAnimationEvent(self, "DragonLandEffect")
		registerForAnimationEvent(self, "DragonForcefulLandEffect")
		registerForAnimationEvent(self, "DragonTakeoffEffect")
		registerForAnimationEvent(self, "DragonBiteEffect")
		registerForAnimationEvent(self, "DragonTailAttackEffect")
		registerForAnimationEvent(self, "DragonLeftWingAttackEffect")
		registerForAnimationEvent(self, "DragonRightWingAttackEffect")
		registerForAnimationEvent(self, "DragonPassByEffect")
		registerForAnimationEvent(self, "flightCrashLandStart")			; Considered temp for showing injury FX test
		registerForAnimationEVENT(self, "DragonKnockbackEvent")
	endEVENT


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;USED TO GET DIALOGUE CONDITIONED ON DRAGON HAVING ATTACKED A TOWN	-- only happens if he lands on the ground in a location - ie death, or to land to fight (not on a perch)
	;see also DragonPerchScript

	debug.trace(self + "OnLocationChange() calling WI.RegisterDragonAttack(" +akNewLoc + ")")
	WI.RegisterDragonAttack(akNewLoc, self)
	
	if !isDead() && isGhost()
			; redundancy check to prevent invincible, "ghosted" dragons from respawning.
			setGhost(FALSE)
	endif

EndEvent
	
STATE alive
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)		
	
		if !isDead() && isGhost()
			; redundancy check to prevent invincible, "ghosted" dragons from respawning.
			setGhost(FALSE)
		endif
	
		if akTarget == Game.GetPlayer()
			WI.updateWIDragonTimer()		;used to prevent dragons from appearing too frequently
		endif
	endEvent
	
	EVENT onAnimationEvent(objectReference deliverator, string eventName)
		debug.trace("AnimEvent: " + eventName + " delivered by Dragon ("+self+") ")
		if (eventName == "DragonLandEffect")
			;debug.trace("Dragon AnimPayLoad: DragonLandEffect")
			game.shakeCamera(self, 1)
			game.shakeController(95, 95, 2)
			KnockAreaEffect(1, getLength())
			animateFOV()								; call the FOV function
			PlayImpactEffect(FXDragonTakeoffImpactSet, "NPC Pelvis", 0, 0, -1, 512)
		elseIf (eventName == "DragonForcefulLandEffect")
			;debug.trace("Dragon AnimPayLoad: DragonForcefulLandEffect")
			PlayImpactEffect(FXDragonLandingImpactSet, "NPC Pelvis", 0, 0, -1, 512)
			KnockAreaEffect(1, 2*getLength())
			;notification ("Dragon Forceful Land Effect")
		elseIf (eventName == "DragonTakeoffEffect")
			debug.trace("Dragon AnimPayLoad: DragonTakeoffEffect")
			PlayImpactEffect(FXDragonTakeoffImpactSet, "NPC Tail8", 0, 0, -1, 2048)
		elseIf (eventName == "DragonBiteEffect")
			;Removed spit effect on 6/1/10. Leaving logic in case we need to sub in other fx or sounds.
			;debug.trace("Dragon ("+self+") AnimPayLoad: DragonBiteEffect")
			;DragonBiteFX.Play(Self, 2)
			;notification ("Dragon Bite Effect")
		elseIf (eventName == "DragonTailAttackEffect")
			;debug.trace(" Dragon AnimPayoload: DragonTailAttackEffect")
			PlayImpactEffect(FXDragonTailstompImpactSet, "NPC Tail8", 0, 0, -1, 512)
			;notification("Dragon Tail Attack Effect")
		elseIf (eventName == "DragonLeftWingAttackEffect")
			;debug.trace("Dragon AnimPayLoad: DragonLeftWingAttackEffect")
			PlayImpactEffect(FXDragonTailstompImpactSet, "NPC LHand", 0, 0, -1, 512)
			;notification ("Dragon Left Wing Attack Effect")
		elseIf (eventName == "DragonRightWingAttackEffect")
			;debug.trace("Dragon AnimPayLoad: DragonRightWingAttackEffect")
			PlayImpactEffect(FXDragonTailstompImpactSet, "NPC RHand", 0, 0, -1, 512)
			;notification ("Dragon Right Wing Attack Effect")
		elseIf (eventName == "DragonPassByEffect")
			NPCDragonFlyby.Play(self)
			game.shakeCamera(self, 0.85)
			game.shakeController(0.65, 0.65, 0.5)
		;elseIf (eventName == "flightCrashLandStart")
			;Removed by mark since leaking magic is a bust. May replace with leaking blood at some point as a second test.
			; apply injury FX art when I crash land.
			;FXinjuryLeaks.play(self, -1)
		elseIf (eventName == "DragonKnockbackEvent")
			; dragon needs to stagger everyone in radius a bit larger than my length
			;debug.trace(self + " is knocking back actors within " + 1.5*getLength() + " of self @ " + self.x + ", " + self.y)
			;self.placeAtMe(knockBackExplosion)
			KnockAreaEffect(1, 1.5*getLength())
			animateFOV(1.5*getLength())
		endif
	endEVENT

	EVENT onDeath(actor killer)
		debug.trace("Remove mouth/injury FX art, begin death FX sequence for " + self)
		gotoState("deadAndWaiting")
		
		WI.startWIDragonKillQuest(self)		;used to create a scene if any NPCs are nearby when the dragon dies. See WIFunctionsScript attached to WI quest which creates a story manager script event, and WIDragonKilled quest which handles the scene.
		
		; removing update registration in favor of a while() in the STATE below
		;registerForUpdate(1)
	endEVENT
endSTATE

STATE deadAndWaiting
	EVENT onBeginState()
		while getDistance(player) > deathFXrange
			utility.wait(1.0)
		endWhile
		debug.trace("player close enough to absorb" + self)
		gotoState("deadDisintegrated")
		(MQkillDragon as MQKillDragonScript).deathSequence(self)
	endEVENT
	
	; EVENT onUpdate()
		; if getDistance(player) < deathFXrange
			; debug.trace("player close enough to absorb" + self)
			; gotoState("deadDisintegrated")
			; unRegisterforUpdate()
			; (MQkillDragon as MQKillDragonScript).deathSequence(self)
		; endif
	;endEVENT
endSTATE

STATE deadDisintegrated
	; nothing happens here - dead and just bones.
endSTATE

; _____________
;|			   |
;|  FUNCTIONS  |
;|_____________|
function AnimateFOV(float fFOVfalloff = 1600.0)
	; Function that animates FOV with an ismod.  Declaring here in case needed frequently
	float playerDist = player.getDistance(self)	; get and store the player's current distance from me	
	if playerDist < fFOVfalloff
		float FOVpower = (1- (1/(fFOVfalloff/(playerDist))))		; consider offset to compensate for collision size
		if FOVpower > 1.0
			FOVpower = 1.0		; clamp to prevent wacky values
		endif
		;debug.trace("player is " + playerDist + " from landing dragon")
		;debug.trace("dragon FOV fx power is" + FOVpower)
		dragonFOVfx.apply(FOVpower) ;animated FOV effect.  Strength based on distance from player
	endif
endFunction

