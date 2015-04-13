Scriptname dunSoljundsBossSCRIPT extends ObjectReference  

; //A is the fire statue, B is the healing statue
OBJECTREFERENCE PROPERTY statueA AUTO
OBJECTREFERENCE PROPERTY statueB AUTO

; //the boss mob himself
OBJECTREFERENCE PROPERTY bossMob AUTO

; //the shaders for the charging of A the flame statue and B the heal statue
EfFECTSHADER PROPERTY FXstatueA AUTO
EfFECTSHADER PROPERTY FXstatueB AUTO

; //the points to fire from
OBJECTREFERENCE PROPERTY FPstatueA AUTO
OBJECTREFERENCE PROPERTY FPstatueB AUTO

; //the other guys who can be healed
OBJECTREFERENCE PROPERTY mobA AUTO
OBJECTREFERENCE PROPERTY mobB AUTO
OBJECTREFERENCE PROPERTY mobC AUTO

; //the spells
SPELL PROPERTY fireSpell AUTO
SPELL PROPERTY healSpell AUTO

; //start the cycle once
BOOL startOnce=TRUE

; //flags for the spell being ready
BOOL fireReady=TRUE
BOOL healReady=TRUE

FLOAT bossCurrent
FLOAT bossBase
FLOAT bossPercent

INT fireCounter=0
INT healCounter=0

BOOL BOSSFIGHTING=FALSE

EVENT onTriggerEnter(OBJECTREFERENCE obj)
	IF(obj == game.getPlayer() && startOnce)
		BOSSFIGHTING = TRUE
		registerForSingleUpdate(1)
		
		goToState("polling")
		
		; //effects should already be started
		FXstatueB.play(statueB)
		fireCounter = 4
		
		bossBase = (bossMob as ACTOR).getBaseAV("Health") as FLOAT
		
		startOnce = FALSE
	
	ENDIF

ENDEVENT

EVENT onCELLDETACH()
	unregisterForUpdate()
	BOSSFIGHTING = FALSE
	
	IF((bossMob as ACTOR).isDead() == FALSE)
		startOnce = TRUE
	ENDIF
	
endEVENT

STATE polling

	EVENT ONUPDATE()

		IF((bossMob as ACTOR).isDead() == TRUE)
			FXstatueA.stop(statueA)
			FXstatueB.stop(statueB)
			BOSSFIGHTING = FALSE
		ENDIF
		
		; /////
		; //the stuff for the fireballs
		; /////
		
		; //update the fire stuff
		fireCounter += 1
		
		; // spit hot fire
		IF(fireReady && FPStatueA.isEnabled() == TRUE)
			
			IF(fireCounter == 5)
				FXstatueA.play(statueA)
				
			ELSEIF(fireCounter == 7)
				fireSpell.cast(FPStatueA, game.getPlayer())
				FXstatueA.stop(statueA)
			
				fireCounter = 0
			
			ENDIF
		
		ENDIF
		
		; /////
		; //the stuff for the heals
		; /////
		
		; //update the heal stuff
		healCounter += 1
		bossCurrent = (bossMob as ACTOR).getAV("Health") as FLOAT
		bossPercent = (bossCurrent / bossBase)
		
		; //check if the heal is ready
		IF(healCounter >= 8 && !healReady && FPStatueB.isEnabled() == TRUE)
			healReady = TRUE
			FXstatueB.play(statueB)
		ENDIF
		
		; //heal if we need too
		IF(healReady && bossPercent <= 0.7 && healCounter >= 10 && FPStatueB.isEnabled() == TRUE)
			
			healReady = FALSE
			FXstatueB.stop(statueB)
			healSpell.cast((bossMob as ACTOR), (bossMob as ACTOR))
			healCounter = 0
			
		ENDIF
		
		IF(BOSSFIGHTING)
			registerForSingleUpdate(1)
		ENDIF

	ENDEVENT
	
	
ENDSTATE
