scriptName defaultNPCrunToTRIG extends objectReference
{Linked NPC(s) on defaultMasterPackage will check out their linked runToWhenTriggered ref(s)}

bool property runToPatrol auto
{Always run to patrol? (regardless of Player stealth.)  DEFAULT: False}
bool property walkToPatrol auto
{Always run to patrol? (regardless of Player stealth.)  DEFAULT: False}

bool ranOnce
actor NPC
actor player
bool playerSneaky

EVENT onLoad()
	player = game.getPlayer()
	NPC = getLinkedRef() as actor
endEVENT

EVENT onTriggerEnter(objectReference actronaut)
	; trigger only on player entering
	if actronaut == player && ranOnce == FALSE
		ranOnce = TRUE
		triggerNPC()
	endif
endEVENT

EVENT onActivate(objectReference actronaut)
	; including activate event support so we can trigger this from a door/lever/etc activated by player
	if ranOnce == FALSE
		ranOnce = TRUE
		triggerNPC()
	endif
endEVENT

;======================================
; This function is the meat. Declaring here so we can call from either event type
FUNCTION triggerNPC()	
		if stealthCheck()
			; player is sneaking and has better sneak, so WALK to the patrol
			; variable04 helps the package stack along via stack conditions in defaultMasterPackage
			NPC.setActorValue("variable04", 1)
		elseif !stealthCheck()
			; player wasn't sneaking or failed check, so RUN there.
			NPC.setActorValue("variable04", 2)
		endif
		
		; politely ask NPC to evp package stack and realize he needs to build a path
		NPC.evaluatePackage()
		
		; set var04 to an invalid to avoid retracing steps
		utility.wait(5)
		NPC.setActorValue("variable04",3)
endFUNCTION

;=====================================
; Breaking stealth check into separate function in case this needs changes 
bool FUNCTION stealthCheck()
	; a very basic stealth check for run/walk check
	; TRUE return = player is "sneaky" so walk
	; FALSE retrun = player isn't sneaky, so run
	; first, an error checker
	if runToPatrol == TRUE && walkToPatrol == TRUE
; 		debug.trace("ERROR: Run/Walk properties mutually exclusive.  Setting both to false on "+self)
		runToPatrol = FALSE
		walkToPatrol = FALSE
	endif
	
	; return quickly if user has explicity chosen behavior
	if runToPatrol == TRUE
		return FALSE
	elseif walkToPatrol == TRUE
		return TRUE
	endif
	
	if game.getplayer().getActorValue("Sneak") >= NPC.getActorValue("Sneak") && player.isSneaking() == TRUE
		; player is sneaking and has higher skill than NPC, so walk
		return FALSE
	else
		; player is either not sneaky or worse at it than NPC
		return TRUE
	endif
endFUNCTION
