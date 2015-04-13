Scriptname MQ201ThalmorEmbassyDisguiseScript extends actor  
{this script will attempt to manage the factions and/or aggression of thalmor guards in the embassy when the player is disguised.}

;Need a way for the Thalmor guards to receive an event(?) when the player removes the disguise...

formlist property MQ201ThalmorDisguiseHeadItems auto
formlist property MQ201ThalmorDisguiseBodyItems auto

race property HighElfRace auto
race property nordRace auto
race property woodElfRace auto
race property darkElfRace auto
race property orcRace auto
race property khajiitRace auto
race property argonianRace auto
race property bretonRace auto
race property redguardRace auto
race property imperialRace auto

bool property isSolarGuard = FALSE auto

; NOTE - still messing with this, but it's very likely these numbers should roughly match
; 			the radii specified in dunEmbassyGuardDiscuised<Race> packages...

float property fRangeElf = 512.0 auto
{how close can a bosmer/dunmer get before raising suspicion?}
float property fRangeHuman = 1280.0 auto
{how close can a nord/breton/redguard/imperial get before raising suspicion?}
float property fRangeBeast = 1600.0 auto
{how close can a orc/khajiit/argonian get before raising suspicion?}

faction property MQ201ThalmorFooledFaction auto
faction property MQ201ThalmorEnemyFaction auto

bool property bDebug = TRUE auto
{Usually keep this false, unless having difficulties.}

actor player
; initialize isFooled to true 
bool isFooled = TRUE
float range

EVENT onInit()
	player = game.getPlayer()
	if is3Dloaded()
		gotoState("active")
	else
		gotoSTate("inactive")
		registerForSingleUpdate(2.0)
	endif
endEVENT

STATE inactive

	EVENT onUpdate()
; 		; debug.trace("||-------------------------------------------")
; 		; debug.trace("|| onUpdate during inactive state on "+self)
; 		; debug.trace("|| Should only see this once, not repeating")
	endEVENT

	EVENT onLoad()
		; 3D has loaded, go to active.
		if bDebug == TRUE
; 			debug.trace("||-------------------------------------------")
; 			debug.trace("|| Loaded 3D for "+self)
; 			debug.trace("|| Loading up MQ201 disguise stuff")
		endif
		registerForSingleUpdate(4.0)
		gotoState("active")
	endEVENT

endSTATE

STATE active
	EVENT onUpdate()
	
		if is3Dloaded() == FALSE
			;we have no 3d, go to inactive
			gotoState("inactive")
		endif
	
; 		; debug.trace("||-------------------------------------------")
; 		; debug.trace("|| Debug info for "+self)
		
		; move this stuff to onInit() after debugging is ocmplete (leaving here for now so I can change races at runtime)
		actorBase playerBase = player.getActorBase()
		if playerBase.getRace() == nordRace || imperialRace || bretonRace || redguardRace
			range = fRangeHuman
		elseif playerBase.getRace() == orcRace || khajiitRace || argonianRace
			range = fRangeBeast
		elseif playerBase.getRace() == woodElfRace || darkElfRace
			range = fRangeElf
		elseif playerBase.getRace() == HighElfRace
			; High elf players get a total pass.
			range = 0
		else
			; spit out warnings if we hit this block
			if bDebug
; 				debug.traceStack("Player is not an expected race?" + self, 1)
; 				debug.traceStack("thalmor embassy guards will regard player as a beast race", 1)
			endif
			range = fRangeBeast
		endif

		; only run this check outside of combat.  During combat the disguise shouldn't matter (and guys in the Thalmor faction should assist each other regardless)
		if !isInCombat()
			if bDebug
; 				;debug.trace("Begin out-of-combat checking for Thalmor Guard: "+self)
			endif
			; do a separate check JUST for the disguise.  Don't mess with other stuff if not even bothering to hide.
			if player.isEquipped(MQ201ThalmorDisguiseHeadItems) == FALSE && player.isEquipped(MQ201ThalmorDisguiseBodyItems) == FALSE
				if bDebug
; 					debug.trace("Player undisguised, I'm going aggressive: Thalmor Guard: "+self)
				endif
				addToFaction(MQ201ThalmorEnemyFaction)
				setAV("aggression",2)
			else
				; now, since the player is in disguise, aggro if they get too close.
				if player.getDistance(self) > range
				; player is in disguise
				if isFooled == FALSE
					if bDebug
; 						debug.trace("Changing state to isFooled on "+self)
					endif
					isFooled = TRUE
					setAV("aggression",0)
					addToFaction(MQ201ThalmorFooledFaction)
					removeFromFaction(MQ201ThalmorEnemyFaction)
					evaluatePackage()
				endif
			else	; player is not wearing a disguise
; 				; debug.trace("|| the player is not disguised OR is disguised within suspicion range")
				if isFooled == TRUE
					if bDebug
; 						debug.trace("Changing state to NOT Fooled on "+self)
					endif
					isFooled = FALSE
					setAV("aggression",2)
					addToFaction(MQ201ThalmorEnemyFaction)
					removeFromFaction(MQ201ThalmorFooledFaction)
					evaluatePackage()
				endif
			endif
			
				
			endif
		endif

		; always (for now) re-register to update faster than usual EVP updates
		; but only if I haven't died and my 3D is loaded.
		if !isDead() && is3Dloaded()
			registerForSingleUpdate(4.0)
		endif
		
	endEVENT
	
	EVENT onActivate(objectReference actronaut)
		if isSolarGuard == TRUE
			; do nothing.  This specific NPC has dialogue for disguised altmer players.
		else
			if actronaut == game.getPlayer()
				startCombat(game.getPlayer())
			endif
		endif
		
	endEVENT
endSTATE

; FUNCTION alertState(bool onAlert)
; 		; debug.trace("|||||||||||||||||||||||||||||||")
; 		; debug.trace("|| ALERT EVENT FOR "+self)
	; if onAlert == TRUE
; 		; debug.trace("|| Going to onAlert State")
		; isFooled = FALSE
		; setAV("aggression",3)
		; addToFaction(ThalmorAlertedFaction)
		; removeFromFaction(MQ201ThalmorFooledFaction)
		; evaluatePackage()
	; else
; 		; debug.trace("|| Going to isFooled state")
		; isFooled = TRUE
		; setAV("aggression",2)
		; addToFaction(MQ201ThalmorFooledFaction)
		; removeFromFaction(ThalmorAlertedFaction)
		; evaluatePackage()
	; endif
; endFUNCTION
